PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

DROP TABLE IF EXISTS questions;

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL,

  FOREIGN KEY (author_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS question_follows;

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

DROP TABLE IF EXISTS replies;

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  body TEXT NOT NULL,
  parent_reply_id INTEGER,
  subject_question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  
  FOREIGN KEY (parent_reply_id) REFERENCES replies(id),
  FOREIGN KEY (subject_question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS question_likes;

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
  users (fname, lname)
VALUES
  ('Sena', 'Ji'),
  ('Terilyn', 'Truong'),
  ('Andre', 'Truong');

INSERT INTO
  questions (title, body)
VALUES
  ('What is the name of this dog breed?', 'I have no idea what breed my dog is.', 2),
  ('What is 3+3?', 'I am clueless with math...', 1),
  ('Who is the best NBA player?', 'I want to know.', 3);

INSERT INTO
  question_follows (user_id, question_id)
VALUES
  (1, 2),
  (2, 1),
  (3, 3);

INSERT INTO
  replies (body, parent_reply_id, subject_question_id, user_id)
VALUES
  ('It is a Akita!', NULL, 1, 1),
  ('No, this is definitely a Shiba.', 1, 1, 3),
  ('The answer is 6.', NULL, 2, 2),
  ('Anthony Davis.', NULL, 3, 2),
  ('Definitely Anthony Davis.', 4, 3, 3);

INSERT INTO
  question_likes (user_id, question_id)
VALUES
  (1, 1),
  (1, 3),
  (2, 3),
  (2, 2),
  (3, 1);