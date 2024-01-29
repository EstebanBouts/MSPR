-- Insertions dans la Table Utilisateurs
INSERT INTO utilisateurs (nom, email, mot_de_passe)
VALUES
    ("Alice Dupont", "alice@example.com", "password123"),
    ("Bob Martin", "bob@example.com", "password123"),
    ("Claire Dupuis", "claire@example.com", "password456"),
    ("David Tremblay", "david@example.com", "password789"),
    ("Élise Lavoie", "elise@example.com", "passwordabc"),
    ("François Leclerc", "francois@example.com", "passworddef"),
    ("Gabrielle Gagnon", "gabrielle@example.com", "passwordghi"),
    ("Hugo Bélanger", "hugo@example.com", "passwordjkl"),
    ("Isabelle Fortin", "isabelle@example.com", "passwordmno"),
    ("Jean-Pierre Bergeron", "jeanpierre@example.com", "passwordpqr"),
    ("Julie Martin", "julie@example.com", "passwordstu"),
    ("Kevin Tremblay", "kevin@example.com", "passwordvwx"),
    ("Léa Gagnon", "lea@example.com", "passwordyz"),
    ("Martin Bélanger", "martin@example.com", "password123"),
    ("Nathalie Fortin", "nathalie@example.com", "password456"),
    ("Olivier Bergeron", "olivier@example.com", "password789"),
    ("Patricia Dupont", "patricia@example.com", "passwordabc"),
    ("Quentin Lavoie", "quentin@example.com", "passworddef"),
    ("Rachel Gagnon", "rachel@example.com", "passwordghi"),
    ("Sébastien Martin", "sebastien@example.com", "passwordjkl"),
    ("Sophie Tremblay", "sophie@example.com", "passwordmno"),
    ("Thierry Bélanger", "thierry@example.com", "passwordpqr"),
    ("Valérie Fortin", "valerie@example.com", "passwordstu"),
    ("William Bergeron", "william@example.com", "passwordvwx"),
    ("Xavier Dupont", "xavier@example.com", "passwordyz"),
    ("Yasmine Lavoie", "yasmine@example.com", "password123"),
    ("Zoé Gagnon", "zoe@example.com", "password456"),
    ("Albert Martin", "albert@example.com", "password789"),
    ("Béatrice Tremblay", "beatrice@example.com", "passwordabc"),
    ("Cédric Bélanger", "cedric@example.com", "passworddef"),
    ("Diane Fortin", "diane@example.com", "passwordghi"),
    ("Éric Dupont", "eric@example.com", "passwordjkl"),
    ("Fanny Gagnon", "fanny@example.com", "passwordmno"),
    ("Gilles Martin", "gilles@example.com", "passwordpqr"),
    ("Hélène Tremblay", "helene@example.com", "passwordstu"),
    ("Isaac Lavoie", "isaac@example.com", "passwordvwx"),
    ("Jennifer Bergeron", "jennifer@example.com", "passwordyz"),
    ("Karl Fortin", "karl@example.com", "password123"),
    ("Linda Dupont", "linda@example.com", "password456"),
    ("Mathieu Gagnon", "mathieu@example.com", "password789"),
    ("Nancy Martin", "nancy@example.com", "passwordabc"),
    ("Olivier Tremblay", "olivier2@example.com", "passworddef"),
    ("Patricia Dupuis", "patricia2@example.com", "passwordghi"),
    ("Quentin Lefebvre", "quentin2@example.com", "passwordjkl"),
    ("Rachel Gauthier", "rachel2@example.com", "passwordmno"),
    ("Sébastien Dubois", "sebastien2@example.com", "passwordpqr"),
    ("Sophie Lefebvre", "sophie2@example.com", "passwordstu"),
    ("Thierry Gosselin", "thierry2@example.com", "passwordvwx"),
    ("Valérie Rousseau", "valerie2@example.com", "passwordyz");

-- Insertions dans la Table Spécialisations
INSERT INTO specialisations (specialisation)
VALUES
    ("Plantes d’intérieur"),
    ("Plantes désertiques"),
    ("Plantes aquatiques"),
    ("Arbres"),
    ("Fleurs"),
    ("Légumes"),
    ("Herbes aromatiques");


-- Insertions dans la Table Botanistes
INSERT INTO experiences (id_utilisateur, specialisation, annees_experience)
VALUES
    (2, 1, 5),
    (4, 1, 7),
    (6, 1, 3),
    (8, 1, 10),
    (10, 1, 2),
    (12, 1, 8),
    (14, 1, 4),
    (16, 1, 6),
    (18, 1, 9),
    (20, 1, 5),
    (22, 1, 7);


-- Insertions dans la Table Plantes
INSERT INTO plantes (nom, type, instructions_soin, id_utilisateur)
VALUES
    ("Ficus", "Plante d’intérieur", "Arroser une fois par semaine", 1),
    ("Orchidée", "Fleur", "Exposer à la lumière indirecte", 1),
    ("Cactus", "Plante désertique", "Arroser rarement", 4),
    ("Algue", "Plante aquatique", "Maintenir dans un aquarium", 6),
    ("Épinette", "Arbre", "Planter en plein soleil", 8),
    ("Rose", "Fleur", "Tailler les roses fanées", 10),
    ("Tomate", "Légume", "Arroser régulièrement", 12),
    ("Bambou", "Plante d’intérieur", "Arroser abondamment", 14),
    ("Tulipe", "Fleur", "Planter en automne", 16),
    ("Sauge", "Herbe aromatique", "Récolter les feuilles pour la cuisine", 18);


-- Insertions dans la Table Conseils
INSERT INTO conseils (contenu, id_experience, id_plante)
VALUES
    ("Utilisez un terreau pour orchidées pour un meilleur drainage", 2, 2),
    ("Évitez de trop arroser les cactus pour éviter la pourriture des racines", 4, 3),
    ("Nettoyez régulièrement les algues de l'aquarium", 3, 4),
    ("Taillez les branches mortes de l'épinette", 2, 5),
    ("Supprimez les feuilles malades des roses", 1, 6),
    ("Taillez la lavande après la floraison", 1, 1),
    ("Élaguez l'érable en fin d'hiver", 3, 1),
    ("Buttez les plants de pommes de terre en cours de croissance", 2, 1),
    ("Taillez les lys après la floraison", 1, 1),
    ("Taillez la menthe pour éviter qu'elle envahisse", 3, 1),
    ("Élaguez le palmier au printemps", 2,6),
    ("Arrosez les laitues régulièrement pour éviter l'amertume", 1, 7),
    ("Utilisez du thym frais en cuisine", 3, 8),
    ("Le baobab nécessite peu d'eau", 2, 9),
    ("Arrosez les plants de courgettes abondamment", 1, 1),
    ("Le basilic parfume les plats", 3, 1),
    ("Taillez le cerisier pour favoriser la fructification", 2, 2),
    ("Tuteurez les plants de concombre pour les soutenir", 1, 3);


-- Insertions dans la Table Sessions de Garde
INSERT INTO sessions_garde (id_plante, id_utilisateur, date_debut, date_fin, commentaires)
VALUES
    (1, 2, "2024-01-01", "2024-01-07", "Plante bien entretenue"),
    (2, 4, "2024-02-15", "2024-02-21", "Orchidée en floraison"),
    (3, 6, "2024-03-10", "2024-03-17", "Cactus en croissance"),
    (4, 8, "2024-04-20", "2024-04-27", "Algues en expansion"),
    (5, 10, "2024-05-05", "2024-05-12", "Épinette en bonne santé"),
    (6, 12, "2024-06-15", "2024-06-22", "Roses en boutons"),
    (7, 14, "2024-07-01", "2024-07-07", "Tomates en croissance");


