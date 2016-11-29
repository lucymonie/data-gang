BEGIN;

IF NOT EXISTS users (
  CREATE TABLE users (
    id          SERIAL     PRIMARY KEY,
    firstname   TEXT       NOT NULL,
    lastname    TEXT       NOT NULL,
    github      TEXT       NOT NULL,
    email       TEXT       NOT NULL
  );

  INSERT INTO users(firstname, lastname, github, email) VALUES
    ('Will', 'Savage', 'savagewilliam', 'will@fac.com'),
    ('Steve', 'Hopkinson', 'stevehopkinson', 'steve@fac.com'),
    ('Lucy', 'Monie', 'lucymonie', 'lucy@fac.com'),
    ('Jen', 'Spencer', 'jsms90', 'jen@fac.com');
);

IF NOT EXISTS topics (
  CREATE TABLE topics (
    id          SERIAL     PRIMARY KEY,
    title       TEXT       NOT NULL,
    image_path  TEXT       NOT NULL,
    endpoint    TEXT       NOT NULL
  );

  INSERT INTO topics(title, image_path, endpoint) VALUES
    ('HTML & CSS', './public/images/html_css.jpg', '/html-css'),
    ('Git & Github', './public/images/git_github.jpg', '/git-github'),
    ('Command Line', './public/images/command_line.jpg', '/command-line'),
    ('DOM Mainpulation', './public/images/DOM.jpg', '/the-dom'),
    ('Testing', './public/images/testing.jpg', '/testing'),
    ('API', './public/images/API.jpg', '/api'),
    ('Node', './public/images/node.jpg', '/node'),
    ('Hapi', './public/images/hapi.jpg', '/hapi'),
    ('Handlebars', './public/images/handlebars.jpg', '/handlebars'),
    ('Databases', './public/images/databases.jpg', '/databases'),
    ('Authentication', './public/images/authentication.jpg', '/authetication'),
    ('UX & UI', './public/images/ux_ui.jpg', '/ux-ui');
);

IF NOT EXISTS type (
  CREATE TABLE type (
    id           SERIAL      PRIMARY KEY,
    label        TEXT        NOT NULL
  );

  INSERT INTO type(label) VALUES
    ('tutorial'),
    ('article'),
    ('reference'),
    ('video'),
    ('IDE');
);

IF NOT EXISTS resources (
  CREATE TABLE resources (
    id           SERIAL      PRIMARY KEY,
    title        TEXT        NOT NULL,
    url          TEXT        NOT NULL,
    topic_id     INTEGER     NOT NULL     REFERENCES topics(id),
    type_id      INTEGER     NOT NULL     REFERENCES type(id),
    user_id      INTEGER     NOT NULL     REFERENCES users(id)
  );
);

IF NOT EXISTS reviews (
  CREATE TABLE reviews (
    id           SERIAL      PRIMARY KEY,
    timecreated  TIMESTAMP   NOT NULL,
    rating       SMALLINT    NOT NULL     CHECK (rating > 0 AND rating < 6),
    resource_id  INTEGER     NOT NULL     REFERENCES resources(id),
    content      TEXT        NOT NULL,
    user_id      INTEGER     NOT NULL     REFERENCES users(id)
  );
);

COMMIT;
