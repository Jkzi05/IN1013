-- Task 2 Week 4

-- 1. Insert into events table the information ‘Fluffy’, ‘2020-10-15’, ‘vet’, ‘antibiotics’.
INSERT INTO petEvent VALUES ("Fluffy", "2020-10-15", "vet", "antibiotics");

-- 2. Insert into events table the information ‘Hammy’, ‘2020-10-15’, ‘vet’, ‘antibiotics’. 
INSERT INTO petPet VALUES ("Hammy", "Diane", "hamster", "M", "2010-10-30", NULL);
INSERT INTO petEvent VALUES ("Hammy", "2020-10-15", "vet", "antibiotics");

-- 3. It appeared that Fluffy had 5 kittens 2 of which are male.
INSERT INTO petEvent VALUES ("Fluffy", "2020-10-15", "litter", "5 kittens, 3 female, 2 male");

-- 4. Also, on “1997-08-03” it was Claws who broke the rib.
UPDATE petEvent SET petname = "Claws" WHERE eventdate = "1997-08-03" AND remark = "broken rib";

-- 5. Unfortunately, Puffball died on ‘2020-09-01’.
UPDATE petPet SET death = "2020-09-01" WHERE petname = "Puffball";

-- 6. Harold asked me to remove his dog from my database due to GDPR.
ALTER TABLE petEvent DROP FOREIGN KEY petevent_ibfk_1;
ALTER TABLE petEvent ADD CONSTRAINT fk_petname FOREIGN KEY (petname) REFERENCES petPet(petName) ON DELETE CASCADE;
DELETE FROM petPet WHERE owner = "Harold" AND species = "dog";

