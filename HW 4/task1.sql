CREATE TABLE petPet (
  petname VARCHAR(20) PRIMARY KEY,
  owner VARCHAR(45),
  species VARCHAR(45),
  gender ENUM('M', 'F'),
  birth DATE,
  death DATE
);

CREATE TABLE petEvent (
  petname VARCHAR(15),
  eventdate DATE,
  eventtype VARCHAR(15),
  remark VARCHAR(255),
  FOREIGN KEY (petname) REFERENCE petPet(petname),
  PRIMARY KEY (petname, eventdate)
);