CREATE EXTENSION postgis;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    role VARCHAR(50) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE chat (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id) ON DELETE CASCADE,
    message TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO users (name, role, gender, username, password) VALUES
('Nguyen Van A', 'admin', 'male', 'nguyenvana', 'password1'),
('Tran Thi B', 'user', 'female', 'tranthib', 'password2'),
('Le Van C', 'user', 'male', 'levanc', 'password3'),
('Pham Thi D', 'user', 'female', 'phamthid', 'password4'),
('Vo Van E', 'moderator', 'male', 'vovane', 'password5'),
('Hoang Thi F', 'user', 'female', 'hoangthif', 'password6'),
('Nguyen Van G', 'user', 'male', 'nguyenvang', 'password7'),
('Pham Thi H', 'user', 'female', 'phamthih', 'password8'),
('Vu Van I', 'admin', 'male', 'vuvani', 'password9'),
('Do Thi K', 'user', 'female', 'dothik', 'password10');

INSERT INTO chat (user_id, message) VALUES
(1, 'Hello, this is Nguyen Van A!'),
(2, 'Hi everyone! Tran Thi B here.'),
(3, 'Good morning from Le Van C!'),
(4, 'Hello, Pham Thi D here.'),
(5, 'Hi! Vo Van E checking in.'),
(6, 'Good day, Hoang Thi F here.'),
(7, 'Nguyen Van G saying hello!'),
(8, 'Hello world! Pham Thi H here.'),
(9, 'Vu Van I reporting in.'),
(10, 'Hi, Do Thi K here.');
