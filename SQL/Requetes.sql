--REQUETES NON TESTEES ---------------------------------------------------------------

--1.     Le nom et les grades des encadrants d’un doctorant donné

(SELECT Nom FROM Personnel WHERE idPersonnel=(SELECT idScientifique FROM ScientifiqueEncadreDoctorant WHERE idDoctorant=1)
UNION
SELECT s.Grade FROM Scientifique s WHERE s.idScientifique=(SELECT idScientifique FROM ScientifiqueEncadreDoctorant WHERE idDoctorant=1));

--2.     Les pays avec qui un scientifique donné collabore

SELECT Pays FROM Labo_externe WHERE Nom=(SELECT NomLabo FROM Auteur WHERE idAuteur=(SELECT idAuteur FROM AuteurLaboPublie WHERE idPubli=(SELECT idPublication FROM PersonnelPublie WHERE idPersonnel=1)));

--3.     Les noms et les pays des auteurs collaborateurs d’un scientifique donné en 2016


((SELECT Nom FROM Auteur WHERE idAuteur=(SELECT idAuteur FROM AuteurLaboPublie WHERE idPubli=(SELECT idPublication FROM PersonnelPublie WHERE idPersonnel=1)
INTERSECT
(SELECT idPubliation FROM Publication WHERE annee_publication=2016)))
UNION
(SELECT Pays FROM Labo_externe WHERE Nom=(SELECT NomLabo FROM Auteur WHERE idAuteur=(SELECT idAuteur FROM AuteurLaboPublie WHERE idPubli=(SELECT idPublication FROM PersonnelPublie WHERE idPersonnel=1)
INTERSECT
(SELECT idPubliation FROM Publication WHERE annee_publication=2016)))));

--4.     Le nombre de collaborateurs d’un scientifique donné en 2018



--5.     Pour chaque doctorant, on souhaiterait récupérer le nombre de ses publications

SELECT idPersonnel, cntPubli FROM 
(SELECT idPersonnel,COUNT(idPublication) as cntPubli FROM PersonnelPublie GROUP BY idPersonnel),
(SELECT idDoctorant FROM Doctorant) WHERE idDoctorant=idPersonnel;

--6.     Le nombre de publications par année de tout le laboratoire

(SELECT annee_publication,COUNT(*) as cntPubli FROM Publication GROUP BY annee_publication)

--7.     Le nombre de doctorants du laboratoire

SELECT COUNT(*) nbDoctorants FROM Doctorant;

--8.     Le nombre de scientifiques du laboratoire

SELECT COUNT(*)FROM Scientifique;

--9.     Le nombre d’enseignants chercheurs par établissement d’enseignement

(SELECT idEtablissement,COUNT(*) as cntEnseignants FROM Enseignant_chercheur GROUP BY idEtablissement)

--10.   Le nombre de publications par scientifique/doctorant

(SELECT idPersonnel,COUNT(idPublication) as cntPubli FROM PersonnelPublie GROUP BY idPersonnel)

--11.   Les personnes ayant participé à toutes les journées portes ouvertes

--12.   Les personnes qui n’ont jamais participé aux journées portes ouvertes

--13.   Le nom et l’année de toutes les conférences organisées par un scientifique donné.

--14.   Le nom et le prénom du scientifique qui n’a jamais encadré

--15.   Pour une année donnée, on veut récupérer le nombre de publications, de conférences, et de  doctorants de chaque scientifique

--16.   Le nom et le prénom du scientifique qui n’a jamais publié, encadré, ni participé à des projets.

--17.   Afficher pour chaque scientifique, le nombre de ses publications, le nombre de ses projets et de ses doctorants.

--18.   Les scientifiques qui ont que des doctorants ayant soutenus et pas de doctorant en cours

--19.   Pour chaque scientifique, le nombre de ses collaborateur externes

--20.   Les scientifiques qui encadrent mais n’ont pas de doctorants ayant déjà soutenu

--21.   Le nombre de collaborateurs par pays

--22.   Les doctorants qui ont un seul encadrant et qui ont toujours des publications qu’avec leur encadrant

--23.   Les doctorants qui ont plus de 3 encadrants

SELECT idDoctorant FROM ScientifiqueEncadreDoctorant GROUP BY idDoctorant HAVING COUNT(idScientifique)>3

--24.   Les scientifiques qui ont plus de 3 doctorants qui ont débuté leur thèse il y a moins de 2 ans.

--25.   Les doctorants qui ont au moins une publication chaque année depuis leur recrutement

--26.   Les scientifiques qui recrutent au moins un doctorant par année

--27.   Les pays qui sont présents à tous les projets

--28.   Les scientifiques qui publient que dans des conférences de classe A

--29.   Les scientifiques qui n’ont jamais publié dans des conférences de classe A

--30.   Le nombre de conférences de classe A organisées par le laboratoire par année

--31.   L’établissement d’enseignement ayant le plus grand nombre d’enseignant chercheur


-- REQUETES TESTEES ---------------------------------------------------------------
