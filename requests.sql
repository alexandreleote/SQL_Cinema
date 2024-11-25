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
GROUP BY film.id_film, film.titre_film, dateSortie, duree, personne.prenom_personne, personne.nom_personne;

/* Exercice 3.b */

SELECT 
    film.id_film, 
    film.titre_film, 
    DATE_FORMAT(film.date_sortie_film, "%Y") AS dateSortie, 
    TIME_FORMAT(SEC_TO_TIME(film.duree_film * 60), "%H:%i") AS duree
FROM film
WHERE film.duree_film > (
    SELECT MAX(film.duree_film)
    FROM film
    WHERE film.duree_film <= 135
)
ORDER BY duree DESC;
