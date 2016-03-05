CREATE TABLE linktags (
  id SERIAL8 PRIMARY KEY,
  url VARCHAR(255),
  name VARCHAR(255),
  genre VARCHAR(255), 
  description VARCHAR(255)
)