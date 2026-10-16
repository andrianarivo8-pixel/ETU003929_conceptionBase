# Étape 1 : CREATE DATABASE gargote;

--

PLAT(**id_plat**, nom, prix) 

--

**Piège :** Le prix est un `INTEGER` car les montants sont en ariary,et sa valeur par defaut est NULL L'identifiant et une primary key (ìd_plat`,auto genere)plutot que le nom car un nom peut etre modifié

# Étape 2

--

CATEGORIE(**id_categorie**, nom) 

PLAT(**id_plat**, nom, prix, #id_categorie) (modifie)

--

**Piège :** Une colonne `categorie VARCHAR(50)` autoriserait plusieurs noms variants de meme sens ("Soupe", "soupe", "Soupes") : les regroupements deviendraient faux, et renommer une categorie obligerait a modifier tous les plats concernes. Elle ne permettrait pas non plus de lister une categorie sans plat. Avec une table `CATEGORIE` et une primary key, le nom est stocké une seule fois et la coherence est garantie.

# Étape 3

--

COMMANDE(**id_commande**, date_commande) (nouveau)

LIGNE_COMMANDE(**#id_commande**, **#id_plat**, quantite) (nouveau)

--

**Piège :** La quantité se place dans la table d'association `LIGNE_COMMANDE`, pas dans `COMMANDE` ni dans `PLAT`, car elle dépend du couple (commande, plat) : « combien de ce plat dans cette commande ». Elle n'a de sens ni pour la commande seule ni pour le plat seul.