CREATE TABLE IF NOT EXISTS answer (
   id BIGSERIAL,
   text TEXT,
   ticket_id BIGINT,
   question_id INTEGER,
   CONSTRAINT pk_answer PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS category (
   id SERIAL,
   name VARCHAR(100) NOT NULL,
   target_hours SMALLINT NOT NULL,
   CONSTRAINT pk_category PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS comment (
   id BIGSERIAL,
   ticket_id BIGINT,
   text TEXT NOT NULL,
   CONSTRAINT pk_comment PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS question (
   id SERIAL,
   text TEXT NOT NULL,
   category_id INTEGER NOT NULL,
   CONSTRAINT pk_question PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS state (
   id BIGSERIAL,
   ticket_id BIGINT NOT NULL,
   old_status_id SMALLINT,
   new_status_id SMALLINT,
   CONSTRAINT pk_state PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS status (
   id SMALLSERIAL,
   name VARCHAR(50),
   CONSTRAINT pk_status PRIMARY KEY (id)
);

ALTER TABLE ticket ADD category_id INTEGER;

ALTER TABLE ticket ADD contact_email VARCHAR(100);

ALTER TABLE ticket ADD contact_number VARCHAR(20);

ALTER TABLE ticket ADD description TEXT;

ALTER TABLE ticket ADD status_id SMALLINT;

ALTER TABLE ticket ALTER COLUMN  category_id SET NOT NULL;

ALTER TABLE ticket ALTER COLUMN  status_id SET NOT NULL;

ALTER TABLE category ADD CONSTRAINT uc_category_name UNIQUE (name);

ALTER TABLE answer ADD CONSTRAINT fk_answer_on_question FOREIGN KEY (question_id) REFERENCES question (id);

ALTER TABLE answer ADD CONSTRAINT fk_answer_on_ticket FOREIGN KEY (ticket_id) REFERENCES ticket (id);

ALTER TABLE comment ADD CONSTRAINT fk_comment_on_ticket FOREIGN KEY (ticket_id) REFERENCES ticket (id);

ALTER TABLE question ADD CONSTRAINT fk_question_on_category FOREIGN KEY (category_id) REFERENCES category (id);

ALTER TABLE state ADD CONSTRAINT fk_state_on_new_status FOREIGN KEY (new_status_id) REFERENCES status (id);

ALTER TABLE state ADD CONSTRAINT fk_state_on_old_status FOREIGN KEY (old_status_id) REFERENCES status (id);

ALTER TABLE state ADD CONSTRAINT fk_state_on_ticket FOREIGN KEY (ticket_id) REFERENCES ticket (id);

ALTER TABLE ticket ADD CONSTRAINT fk_ticket_on_category FOREIGN KEY (category_id) REFERENCES category (id);

ALTER TABLE ticket ADD CONSTRAINT fk_ticket_on_status FOREIGN KEY (status_id) REFERENCES status (id);