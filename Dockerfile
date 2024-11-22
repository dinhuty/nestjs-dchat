
FROM node:20.18.0-alpine as base

WORKDIR /app

FROM base as builder

COPY . .

RUN npm i

RUN npm run build

FROM base as production

ENV NODE_ENV production

# Copy the bundled code from the build stage to the production imag
COPY --from=builder --chown=node:node /app/package*.json ./
COPY --from=builder --chown=node:node /app/node_modules/ ./node_modules/
COPY --from=builder --chown=node:node /app/dist/ ./dist/

RUN npm i --omit=dev

# Start the server using the production build
CMD ["node", "dist/server.js"]