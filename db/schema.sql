CREATE DATABASE sundayfounders;

\c sundayfounders;
DROP TABLE investor_ratings;

CREATE TABLE investors (
  id SERIAL,
  name TEXT,
  url TEXT,
  logo_url TEXT
);

CREATE TABLE investor_ratings (
  id SERIAL,
  investor_id INTEGER,
  user_id INTEGER,
  rating INTEGER,
  review TEXT
);

CREATE TABLE users (
  id SERIAL,
  email TEXT, 
  password_digest TEXT
);


SELECT rating FROM investor_ratings;


INSERT INTO users (email, password_digest) VALUES ('nikki.ricks@gmail.com', 'pudding');

INSERT INTO investor_ratings (investor_id, rating, review) VALUES ('1', 3, 'This is a test rating on an investor to see if it can come up or not');


INSERT INTO investors (name, url, logo_url) VALUES ('Artesian', 'https://www.artesianinvest.com/', 'https://images.squarespace-cdn.com/content/v1/5c386d5c697a98c3d98b4739/1563343449818-8EGGJHQH1DNXUHEMPX0J/ke17ZwdGBToddI8pDm48kHQmEroUjuAYEGd6XkAMUsdZw-zPPgdn4jUwVcJE1ZvWEtT5uBSRWt4vQZAgTJucoTqqXjS3CfNDSuuf31e0tVFWPUj2HnfQH23RtiqsDuB-nOIVJ8JG7EmRJnqTlgkLGk04jVIyHqa3GP_YF0Nx3_k/Artesian_VC_Sunday+Founders.jpg?format=750w');

INSERT INTO investors (name, url, logo_url) VALUES ('Airtree', 'https://www.airtree.vc/', 'https://images.squarespace-cdn.com/content/v1/5c386d5c697a98c3d98b4739/1563344088627-4707M971GH2SULZIVIFV/ke17ZwdGBToddI8pDm48kHQmEroUjuAYEGd6XkAMUsdZw-zPPgdn4jUwVcJE1ZvWEtT5uBSRWt4vQZAgTJucoTqqXjS3CfNDSuuf31e0tVFWPUj2HnfQH23RtiqsDuB-nOIVJ8JG7EmRJnqTlgkLGk04jVIyHqa3GP_YF0Nx3_k/Airtree_VC_Sunday+Founders.jpg?format=750w');


INSERT INTO investors (name, url, logo_url) VALUES ('Blackbird', 'https://blackbird.vc/', 'https://images.squarespace-cdn.com/content/v1/5c386d5c697a98c3d98b4739/1563344241891-AKUW34DG2M9O5LVPQFU3/ke17ZwdGBToddI8pDm48kHQmEroUjuAYEGd6XkAMUsdZw-zPPgdn4jUwVcJE1ZvWEtT5uBSRWt4vQZAgTJucoTqqXjS3CfNDSuuf31e0tVFWPUj2HnfQH23RtiqsDuB-nOIVJ8JG7EmRJnqTlgkLGk04jVIyHqa3GP_YF0Nx3_k/BLACKBIRD_VC_Sunday+Founders.jpg?format=750w');

INSERT INTO investors (name, url, logo_url) VALUES ('Rampersand', 'http://rampersand.vc/', 'https://images.squarespace-cdn.com/content/v1/5c386d5c697a98c3d98b4739/1563345644226-7IKR70C0C4H8PEH5WV7Q/ke17ZwdGBToddI8pDm48kHQmEroUjuAYEGd6XkAMUsdZw-zPPgdn4jUwVcJE1ZvWEtT5uBSRWt4vQZAgTJucoTqqXjS3CfNDSuuf31e0tVFWPUj2HnfQH23RtiqsDuB-nOIVJ8JG7EmRJnqTlgkLGk04jVIyHqa3GP_YF0Nx3_k/RAMPERSAND_VC_Sunday+Founders.jpg?format=750w');


-- not done - pending needing investor_id and user_id
CREATE TABLE investor_details (
  id SERIAL,
  name TEXT,
  fund_type TEXT, 
  fund_size TEXT,
  ratings TEXT,
  reviews TEXT
);





-- template text
INSERT INTO movies (title, plot, year, poster, imdbrating) VALUES ('movie testing', 'this movie is the most amazing one you will ever watch', '1977', 'https://images-na.ssl-images-amazon.com/images/I/41ybnR2NHcL.jpg', '8.9');

SELECT name FROM investors;

INSERT INTO students (name, score) VALUES ('chai', 5);
INSERT INTO students (name, score) VALUES ('kay', 7);

DELETE FROM students WHERE name = 'kay';

UPDATE students SET score = 100 WHERE name = 'chai';

ALTER TABLE students ADD COLUMN hobbies VARCHAR(400);