--Table 1:

CREATE Table rangers (
    ranger_id SERIAL PRIMARY KEY,
    name  VARCHAR(100) NOT NULL,
    region VARCHAR(50)  NOT NULL      
);

INSERT into rangers(name, region) VALUES ('Alice Green', 'Northern Hills'), ('Bob White', 'River Delta'), ('Carol King', 'Mountain Range');

SELECT * from rangers;

