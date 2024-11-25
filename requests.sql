/* Exercice 3.a */
SELECT 
    film.id_film, 
    film.titre_film, 
    DATE_FORMAT(film.date_sortie_film, "%Y") AS dateSortie, 
    TIME_FORMAT(SEC_TO_TIME(film.duree_film * 60), "%H:%i") AS duree,
    personne.prenom_personne, 
    personne.nom_personne
FROM film 
INNER JOIN realisateur  ON realisateur.id_realisateur = film.id_realisateur
INNER JOIN personne  ON personne.id_personne = realisateur.id_personne

/* Exercice 3.b */
SELECT 
    film.id_film, 
    film.titre_film, 
    DATE_FORMAT(film.date_sortie_film, "%Y") AS dateSortie, 
    TIME_FORMAT(SEC_TO_TIME(film.duree_film * 60), "%H:%i") AS duree
FROM film
WHERE film.duree_film > 135
ORDER BY duree DESC;

/* Exercice 3.c */
SELECT 
	film.titre_film,
   DATE_FORMAT(film.date_sortie_film, "%Y") AS dateSortie,
   personne.prenom_personne,
   personne.nom_personne
FROM film
INNER JOIN realisateur ON realisateur.id_realisateur = film.id_realisateur
INNER JOIN personne ON personne.id_personne = realisateur.id_personne
WHERE realisateur.id_realisateur = 1

/* Exercice 3.d */
SELECT 
   genre.nom_genre,
   COUNT(film_genre.id_film)
FROM genre
INNER JOIN film_genre ON genre.id_genre = film_genre.id_genre
GROUP BY genre.id_genre

/* Exercice 3.e */
SELECT
   personne.prenom_personne,
   personne.nom_personne,
   COUNT(film.id_film) AS nbFilms
FROM realisateur
LEFT JOIN personne ON realisateur.id_personne = personne.id_personne
LEFT JOIN film ON film.id_realisateur = realisateur.id_realisateur
GROUP BY realisateur.id_realisateur
ORDER BY nbFilms DESC 

/* Exercice 3.f */
SELECT
   personne.prenom_personne,
   personne.nom_personne,
   personne.genre_personne
FROM acteur
LEFT JOIN personne ON personne.id_personne = acteur.id_personne
LEFT JOIN casting ON casting.id_acteur = acteur.id_acteur
WHERE casting.id_film = 1

/* Exercice 3.g */
SELECT
	film.titre_film,
	acteur_role.nom_acteur_role,
	DATE_FORMAT(film.date_sortie_film, "%Y") AS dateSortie
FROM acteur
LEFT JOIN casting ON casting.id_acteur = acteur.id_acteur
LEFT JOIN film ON film.id_film = casting.id_film
LEFT JOIN acteur_role ON acteur_role.id_acteur_role = casting.id_role
WHERE acteur.id_acteur = 1
ORDER BY dateSortie DESC;

/* Exercice 3.h */
SELECT
    personne.prenom_personne,
    personne.nom_personne
FROM personne
LEFT JOIN acteur ON acteur.id_personne = personne.id_personne
LEFT JOIN realisateur ON realisateur.id_personne = personne.id_personne
WHERE acteur.id_personne IS NOT NULL
AND realisateur.id_personne IS NOT NULL;

/* Exercice 3.i */
SELECT
    film.titre_film,
    DATE_FORMAT(film.date_sortie_film, "%Y") AS dateSortie
FROM film
WHERE film.date_sortie_film >= CURDATE() - INTERVAL 5 YEAR;

/* Exercice 3.j */
SELECT
	personne.genre_personne,
	COUNT(personne.genre_personne)
FROM personne
LEFT JOIN acteur ON acteur.id_personne = personne.id_personne
WHERE acteur.id_personne IS NOT NULL
GROUP BY personne.genre_personne

/* Exercice 3.k */
SELECT
	personne.prenom_personne,
	personne.nom_personne,
	YEAR(CURDATE()) - YEAR(personne.date_naissance_personne) AS age
FROM acteur
LEFT JOIN personne ON acteur.id_personne = personne.id_personne
WHERE YEAR(CURDATE()) - YEAR(personne.date_naissance_personne) >= 50
GROUP BY personne.id_personne

/* Exercice 3.l */
