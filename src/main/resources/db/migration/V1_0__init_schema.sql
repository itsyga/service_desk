CREATE TABLE IF NOT EXISTS feedback (
   id SMALLSERIAL,
   type VARCHAR(30) NOT NULL,
   CONSTRAINT pk_feedback PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS ticket (
   id BIGSERIAL,
   number VARCHAR(9) NOT NULL,
   feedback_id SMALLINT NOT NULL,
   CONSTRAINT pk_ticket PRIMARY KEY (id)
);

ALTER TABLE feedback ADD CONSTRAINT uc_feedback_type UNIQUE (type);

ALTER TABLE ticket ADD CONSTRAINT uc_ticket_number UNIQUE (number);

ALTER TABLE ticket ADD CONSTRAINT fk_ticket_on_feedback FOREIGN KEY (feedback_id) REFERENCES feedback (id);