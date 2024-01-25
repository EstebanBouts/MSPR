-- Création de la Base de Données
CREATE DATABASE IF NOT EXISTS plantes_db;
USE plantes_db;

-- Création de la Table Utilisateurs
CREATE TABLE utilisateurs (
                              id INT PRIMARY KEY AUTO_INCREMENT,
                              nom VARCHAR(100),
                              email VARCHAR(100) UNIQUE,
                              mot_de_passe VARCHAR(255),
                              type ENUM('Utilisateur', 'Botaniste')
);

-- Création de la Table Botanistes
CREATE TABLE botanistes (
                            id INT PRIMARY KEY AUTO_INCREMENT,
                            id_utilisateur INT,
                            specialisation VARCHAR(100),
                            annees_experience INT,
                            FOREIGN KEY (id_utilisateur) REFERENCES utilisateurs(id)
);

-- Création de la Table Plantes
CREATE TABLE plantes (
                         id_plante INT PRIMARY KEY AUTO_INCREMENT,
                         nom VARCHAR(100),
                         type VARCHAR(100),
                         instructions_soin TEXT,
                         id_utilisateur INT,
                         FOREIGN KEY (id_utilisateur) REFERENCES utilisateurs(id)
);

-- Création de la Table Conseils
CREATE TABLE conseils (
                          id_conseil INT PRIMARY KEY AUTO_INCREMENT,
                          contenu TEXT,
                          id_botaniste INT,
                          id_plante INT,
                          FOREIGN KEY (id_botaniste) REFERENCES botanistes(id_utilisateur),
                          FOREIGN KEY (id_plante) REFERENCES plantes(id_plante)
);

-- Création de la Table Sessions de Garde
CREATE TABLE sessions_garde (
                                id_session INT PRIMARY KEY AUTO_INCREMENT,
                                id_plante INT,
                                id_gardien INT,
                                date_debut DATE,
                                date_fin DATE,
                                commentaires TEXT,
                                FOREIGN KEY (id_plante) REFERENCES plantes(id_plante),
                                FOREIGN KEY (id_gardien) REFERENCES utilisateurs(id)
);


-- Insertion dans la Table Utilisateurs
INSERT INTO utilisateurs (nom, email, mot_de_passe, type) VALUES
                                                              ('Alice Dupont', 'alice@example.com', 'password123', 'Utilisateur'),
                                                              ('Bob Martin', 'bob@example.com', 'password123', 'Botaniste');

-- Insertion dans la Table Botanistes
INSERT INTO botanistes (id,id_utilisateur, specialisation, annees_experience) VALUES
    (2, 'Botanique tropicale', 5);

-- Insertion dans la Table Plantes
INSERT INTO plantes (nom, type, instructions_soin, id_utilisateur) VALUES
                                                                       ('Ficus', 'Plante d’intérieur', 'Arroser une fois par semaine', 1),
                                                                       ('Orchidée', 'Fleur', 'Exposer à la lumière indirecte', 1);

-- Insertion dans la Table Conseils
INSERT INTO conseils (contenu, id_botaniste, id_plante) VALUES
    ('Utilisez un terreau pour orchidées pour un meilleur drainage', 2, 2);

-- Insertion dans la Table Sessions de Garde
INSERT INTO sessions_garde (id_plante, id_gardien, date_debut, date_fin, commentaires) VALUES
    (1, 2, '2024-01-01', '2024-01-07', 'Plante bien entretenue');