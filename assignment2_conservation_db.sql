--Table 1:

CREATE Table rangers (
    ranger_id SERIAL PRIMARY KEY,
    name  VARCHAR(100) NOT NULL,
    region VARCHAR(50)  NOT NULL      
);

INSERT into rangers(name, region) VALUES ('Alice Green', 'Northern Hills'), ('Bob White', 'River Delta'), ('Carol King', 'Mountain Range');

SELECT * from rangers;

--Table 2:
CREATE TABLE species(
    species_id SERIAL PRIMARY KEY,            
    common_name VARCHAR(200) NOT NULL,
    scientific_name VARCHAR(200) NOT NULL,                    
    discovery_date DATE NOT NULL,   
    conservation_status VARCHAR(100) NOT NULL
);

INSERT into species(common_name, scientific_name, discovery_date, conservation_status) VALUES
('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
('Bengal Tiger', 'Panthera tigris', '1758-01-01', 'Endangered'), 
('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'), 
('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');

SELECT * from species;
