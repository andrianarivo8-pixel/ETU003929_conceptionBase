CREATE TABLE commande (
    id_commande   INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    date_commande DATE NOT NULL DEFAULT CURRENT_DATE
);
CREATE TABLE ligne_commande (
    id_commande INTEGER NOT NULL REFERENCES commande(id_commande),
    id_plat     INTEGER NOT NULL REFERENCES plat(id_plat),
    quantite    INTEGER NOT NULL CHECK (quantite > 0),
    PRIMARY KEY (id_commande, id_plat)
);
-- Données de test
INSERT INTO commande (date_commande) VALUES
    ('2026-10-12'),
    ('2026-10-12'),
    ('2026-10-13');

INSERT INTO ligne_commande (id_commande, id_plat, quantite) VALUES
    (1, 1, 2),   -- 2 Romazava
    (1, 7, 2),   -- 2 Ranonampango
    (2, 4, 1),   -- 1 Mi sao
    (2, 5, 1),   -- 1 Soupe chinoise
    (2, 6, 1),   -- 1 Mofo gasy
    (3, 3, 3);   -- 3 Akoho sy voanio