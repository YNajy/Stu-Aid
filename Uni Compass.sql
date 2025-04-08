CREATE TABLE Faculties (
fac_id INT auto_increment primary key,
fac_name VARCHAR(255) NOT NULL,
is_visible BOOLEAN default true
);

CREATE TABLE Questions (
    q_id INT auto_increment primary key,
    q_text TEXT NOT NULL,
    user_id INT NOT NULL, 
    fac_id INT NOT NULL, 
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (fac_id) REFERENCES Faculties(fac_id) ON DELETE CASCADE
);

CREATE TABLE Departments (
dep_id INT auto_increment primary key,
dep_name VARCHAR(255) NOT NULL,
fac_id INT NOT NULL,
is_visible BOOLEAN default true,
FOREIGN KEY (fac_id) REFERENCES Faculties(fac_id) ON DELETE CASCADE 
);

CREATE TABLE Languages (
    lang_id INT AUTO_INCREMENT PRIMARY KEY,
    lang_name VARCHAR(255) NOT NULL,
    dep_id INT NOT NULL,
    is_visible BOOLEAN DEFAULT true,
    FOREIGN KEY (dep_id) REFERENCES Departments(dep_id) ON DELETE CASCADE
);

DELETE FROM Faculties;

ALTER TABLE Faculties ADD UNIQUE (fac_name);

INSERT INTO Faculties (fac_name, is_visible)
VALUES ('Faculty of Electrical Engineering', true),
('Faculty of Computer science', true),
('Faculty of Telecommunication', true),
('Faculty of Automayics', true)
ON DUPLICATE KEY UPDATE 
    fac_name = VALUES(fac_name), 
    is_visible = VALUES(is_visible);

SELECT fac_name, is_visible FROM Faculties
WHERE is_visible = true;

SET SQL_SAFE_UPDATES = 0;

UPDATE Faculties
SET is_visible = false
WHERE fac_name = 'Faculty of Computer science' ;

UPDATE Faculties
SET fac_name = 'Faculty of Computer System and Technology', 
    is_visible = false
WHERE fac_name = 'Faculty of Computer Science';

UPDATE Faculties
SET fac_name = 'Faculty of Automatics', 
    is_visible = false
WHERE fac_name = 'Faculty of Automayics';