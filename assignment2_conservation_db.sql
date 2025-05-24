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

--Table 3:
CREATE TABLE sightings(
    sighting_id SERIAL PRIMARY KEY,                
    ranger_id INTEGER REFERENCES rangers(ranger_id) ON DELETE CASCADE , 
    species_id INTEGER REFERENCES species(species_id) ON DELETE CASCADE ,
    sighting_time TIMESTAMP,              
    location VARCHAR(100) NOT NULL,                          
    notes VARCHAR(500)
);

INSERT into sightings(species_id, ranger_id, location, sighting_time, notes) VALUES
(1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL); 

SELECT * from sightings;



--Problem 1: 1️⃣ Register a new ranger with provided data with name = 'Derek Fox' and region = 'Coastal Plains'
INSERT into rangers(name, region) VALUES('Derek Fox', 'Coastal Plains');


--Problem 2: 2️⃣ Count unique species ever sighted.
SELECT count(DISTINCT species_id) as unique_species_count from sightings;


--Problem 3: 3️⃣ Find all sightings where the location includes "Pass".
SELECT * from sightings WHERE location LIKE '%Pass%';