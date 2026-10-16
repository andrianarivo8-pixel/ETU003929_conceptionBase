CREATE TABLE categorie (
    id_categorie INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom          VARCHAR(50) NOT NULL UNIQUE
);
INSERT INTO categorie (nom) VALUES
    ('Plat malagasy'),
    ('Plat chinois'),
    ('Soupe'),
    ('Dessert et goûter'),
    ('Boisson'),
    ('Entrée');

-- NULLABLE AVECINTEGER
    ALTER TABLE plat
    ADD COLUMN id_categorie INTEGER REFERENCES categorie(id_categorie);

UPDATE plat SET id_categorie = (SELECT id_categorie FROM categorie WHERE nom = 'Plat malagasy')
WHERE nom IN ('Romazava', 'Ravitoto sy henakisoa', 'Akoho sy voanio');

UPDATE plat SET id_categorie = (SELECT id_categorie FROM categorie WHERE nom = 'Plat chinois')
WHERE nom = 'Mi sao';

UPDATE plat SET id_categorie = (SELECT id_categorie FROM categorie WHERE nom = 'Soupe')
WHERE nom = 'Soupe chinoise';

UPDATE plat SET id_categorie = (SELECT id_categorie FROM categorie WHERE nom = 'Dessert et goûter')
WHERE nom = 'Mofo gasy (les 4)';

UPDATE plat SET id_categorie = (SELECT id_categorie FROM categorie WHERE nom = 'Boisson')
WHERE nom = 'Ranon ampango';

--  la catégorie devient obligatoire
ALTER TABLE plat ALTER COLUMN id_categorie SET NOT NULL;