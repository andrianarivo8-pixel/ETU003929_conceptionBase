-- Étape 1 : je veux la liste des plats avec leurs prix
SELECT nom, prix FROM plat;
-- les plats du plus cher au moins cher
SELECT nom, prix FROM plat ORDER BY prix DESC;