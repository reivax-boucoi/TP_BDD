--REQUETES NON TESTEES ---------------------------------------------------------------

--3.     Les noms et les pays des auteurs collaborateurs d’un scientifique donné en 2016


((SELECT Nom FROM Auteur WHERE idAuteur IN(SELECT idAuteur FROM AuteurLaboPublie WHERE idPubli=(SELECT idPublication FROM PersonnelPublie WHERE idPersonnel=1)
INTERSECT
(SELECT idPubliation FROM Publication WHERE annee_publication=2016)))
UNION
(SELECT Pays FROM Labo_externe WHERE Nom IN(SELECT NomLabo FROM Auteur WHERE idAuteur=(SELECT idAuteur FROM AuteurLaboPublie WHERE idPubli IN(SELECT idPublication FROM PersonnelPublie WHERE idPersonnel=1)
INTERSECT
(SELECT idPubliation FROM Publication WHERE annee_publication=2016)))));



--5.     Pour chaque doctorant, on souhaiterait récupérer le nombre de ses publications

SELECT d.idDoctorant,p.cntPubli
FROM (SELECT idPersonnel,COUNT(idPublication) as cntPubli FROM PersonnelPublie)as p
RIGHT JOIN (SELECT idDoctorant FROM Doctorant) as d
ON d.idDoctorant=p.idPersonnel



--12.   Les personnes qui n’ont jamais participé aux journées portes ouvertes

--non testable sous mysql
(SELECT idPersonnel from Personnel)
EXCEPT
(SELECT idPersonnel from PersonnelParticipeJPO)


--mysql, testé
SELECT idPersonnel from Personnel
    LEFT JOIN PersonnelParticipeJPO USING (idPersonnel)
WHERE 
    PersonnelParticipeJPO.idPersonnel IS NULL; 
    

--14.   Le nom et le prénom du scientifique qui n’a jamais encadré
--non testable sous mysql
(SELECT idScientifique from Scientifique)
EXCEPT
(SELECT idScientifique from ScientifiqueEncadreDoctorant)


--mysql, testé
SELECT idScientifique from Scientifique
    LEFT JOIN ScientifiqueEncadreDoctorant USING (idScientifique)
WHERE 
    ScientifiqueEncadreDoctorant.idScientifique IS NULL; 



--16.   Le nom et le prénom du scientifique qui n’a jamais publié, encadré, ni participé à des projets.
--non testable sous mysql
SELECT Nom,Prenom from Personnel p WHERE p.idPersonnel=
((((SELECT idScientifique from Scientifique)
EXCEPT
(SELECT idScientifique from ScientifiqueEncadreDoctorant))
EXCEPT
(SELECT idScientifique from ScientifiqueParticipeProjet))
EXCEPT
SELECT idPersonnel from PersonnelPublie)

--mysql TODO

--18.   Les scientifiques qui ont que des doctorants ayant soutenus et pas de doctorant en cours

 DoctorantsQuiOntSoutenus = Project(Join(Select(Doctorant,date_soutenance<CURRENT_DATE) as dcd ,ScientifiqueEncadreDoctorant as sed,sed.idDoctorant=dcd.idDoctorant),idScientifique)
 DoctorantsQuiOntPasSoutenus = Project(Join(Select(Doctorant,date_soutenance>=CURRENT_DATE) as dcd ,ScientifiqueEncadreDoctorant as sed,sed.idDoctorant=dcd.idDoctorant),idScientifique)
 ScinetifiquesAyantDoctorants = DoctorantsQuiOntSoutenus - DoctorantsQuiOntPasSoutenus
 
--non testable sous mysql
SELECT idScientifique FROM ScientifiqueEncadreDoctorant 
WHERE (idDoctorant IN (SELECT idDoctorant FROM Doctorant WHERE (date_soutenance < CURRENT_DATE)))
EXCEPT
SELECT idScientifique FROM ScientifiqueEncadreDoctorant 
WHERE (idDoctorant IN (SELECT idDoctorant FROM Doctorant WHERE (date_soutenance >= CURRENT_DATE)))


--20.   Les scientifiques qui encadrent mais n’ont pas de doctorants ayant déjà soutenu

SELECT idScientifique FROM ScientifiqueEncadreDoctorant WHERE idDoctorant IN(SELECT idDoctorant FROM Doctorant WHERE (date_soutenance > CURRENT_DATE))

--21.   Le nombre de collaborateurs par pays

SELECT p.Pays, COUNT(idAuteur)
FROM(SELECT Pays,Nom  FROM Labo_Externe as p) 
LEFT JOIN(SELECT idAuteur, NomLabo FROM Auteur as a)
ON p.Nom=a.NomLabo

--22.   Les doctorants qui ont un seul encadrant et qui ont toujours des publications qu’avec leur encadrant

SELECT idDoctorant FROM ScientifiqueEncadreDoctorant WHERE 

--23.   Les doctorants qui ont plus de 3 encadrants

SELECT idDoctorant FROM ScientifiqueEncadreDoctorant GROUP BY idDoctorant HAVING COUNT(idScientifique)>3

--24.   Les scientifiques qui ont plus de 3 doctorants qui ont débuté leur thèse il y a moins de 2 ans. TODO
SELECT idScientifique FROM ScientifiqueEncadreDoctorant
GROUP BY (SELECT idPersonnel FROM Personnel p WHERE (p.Date_recrutement BETWEEN SUBDATE(CURRENT_DATE, INTERVAL 2 YEAR) AND CURRENT_DATE)
HAVING COUNT(idScientifique)>3

	  --SELECT idPersonnel FROM Personnel p WHERE p.Date_recrutement BETWEEN (CURRENT_DATE - interval '2 year') AND CURRENT_DATE
	  --BETWEEN '2017-05-13' AND
	  --EXTRACT(YEAR FROM CURRENT_DATE)-2
	  --p.date_recrutement BETWEEN SUBDATE(CURRENT_DATE,INTERVAL "02-00" YEAR_MONTH) AND CURRENT_DATE)) HAVING COUNT(idScientifique)>3

--25.   Les doctorants qui ont au moins une publication chaque année depuis leur recrutement
SELECT idDoctorant FROM Doctorant WHERE idDoctorant IN (SELECT idPersonnel FROM PersonnelPublie pp) --retourne tous les doctorants qui ont publié
HAVING 
	  
	  
--26.   Les scientifiques qui recrutent au moins un doctorant par année
SELECT idScientifique FROM ScientifiqueEncadreDoctorant WHERE idDoctorant
--27.   Les pays qui sont présents à tous les projets
SELECT Pays FROM Partenaire part1 WHERE part.idPartenaire IN(SELECT idPartenaire FROM PartenaireParticipeProjet)
WHERE 
	  
SELECT * FROM Partenaire part1 WHERE NOT EXISTS(SELECT * FROM PartenaireParticipeProjet ppp WHERE NOT EXISTS(
	SELECT * FROM Partenaire part2 WHERE part1.Pays=part2.Pays AND part2.idPartenaire=ppp.idPartenaire))
WHERE 
--28.   Les scientifiques qui publient que dans des conférences de classe A

--29.   Les scientifiques qui n’ont jamais publié dans des conférences de classe A

--30.   Le nombre de conférences de classe A organisées par le laboratoire par année

--31.   L’établissement d’enseignement ayant le plus grand nombre d’enseignant chercheur


-- REQUETES TESTEES ---------------------------------------------------------------

--1.     Le nom et les grades des encadrants d’un doctorant donné

SELECT p.Nom,s.grade FROM 
(SELECT Nom, idPersonnel FROM Personnel WHERE idPersonnel IN (SELECT idScientifique FROM ScientifiqueEncadreDoctorant WHERE idDoctorant=1))as p
JOIN
(SELECT s.grade,s.idScientifique FROM Scientifique s WHERE s.idScientifique IN (SELECT idScientifique FROM ScientifiqueEncadreDoctorant WHERE idDoctorant=1))as s
ON s.idScientifique=p.idPersonnel

--2.     Les pays avec qui un scientifique donné collabore

SELECT Pays FROM Labo_externe WHERE Nom IN(SELECT NomLabo FROM Auteur WHERE idAuteur=(SELECT idAuteur FROM AuteurLaboPublie WHERE idPubli IN(SELECT idPublication FROM PersonnelPublie WHERE idPersonnel=1)));

--4.     Le nombre de collaborateurs d’un scientifique donné en 2018


SELECT COUNT(idPersonnel)as NbCollab FROM PersonnelPublie 
WHERE (idPublication IN 
	(SELECT idPublication FROM Publication 
	WHERE annee_publication=2018 AND idPublication IN
	(SELECT idPublication FROM PersonnelPublie 
		WHERE idPersonnel=10)
	) AND idPersonnel!=10)
	
	
--6.     Le nombre de publications par année de tout le laboratoire

(SELECT annee_publication,COUNT(*) as cntPubli FROM Publication GROUP BY annee_publication)


--7.     Le nombre de doctorants du laboratoire

SELECT COUNT(*) nbDoctorants FROM Doctorant;

--8.     Le nombre de scientifiques du laboratoire

SELECT COUNT(*) as NbScientifiques FROM Scientifique;


--9.     Le nombre d’enseignants chercheurs par établissement d’enseignement

(SELECT idEtablissement,COUNT(*) as cntEnseignants FROM Enseignant_chercheur GROUP BY idEtablissement)

--10.   Le nombre de publications par scientifique/doctorant

(SELECT idPersonnel,COUNT(idPublication) as cntPubli FROM PersonnelPublie GROUP BY idPersonnel)

--11.   Les personnes ayant participé à toutes les journées portes ouvertes

SELECT DISTINCT idPersonnel FROM PersonnelParticipeJPO j1
WHERE NOT EXISTS(SELECT * FROM JPO j2
WHERE NOT EXISTS(SELECT * FROM PersonnelParticipeJPO j3
WHERE (j1.idPersonnel=j3.idPersonnel AND j2.idJPO=j3.idJPO)))

--13.   Le nom et l’année de toutes les conférences organisées par un scientifique donné.

SELECT Nom_conf,EXTRACT(YEAR FROM date_debut) as annee FROM Conference WHERE idPresident=7

--15.   Pour une année donnée, on veut récupérer le nombre de publications, de conférences, et de  doctorants de chaque scientifique
SELECT s.idScientifique, NbPubli,NbConf,NbDocts
FROM(SELECT idScientifique FROM Scientifique) as s
LEFT JOIN (SELECT idPresident,COUNT(*) as NbConf FROM Conference WHERE EXTRACT(YEAR FROM date_debut)=2018 GROUP BY idPresident) as c
ON s.idScientifique=c.idPresident

LEFT JOIN (SELECT idPersonnel,COUNT(*) as NbPubli FROM PersonnelPublie WHERE idPublication IN(SELECT idPublication FROM Publication	WHERE annee_publication=2018) GROUP BY idPersonnel) as p
ON s.idScientifique=p.idPersonnel

LEFT JOIN	(SELECT idScientifique,COUNT(*) as NbDocts FROM ScientifiqueEncadreDoctorant WHERE idDoctorant IN(SELECT idDoctorant FROM Doctorant WHERE EXTRACT(YEAR FROM date_soutenance)=2018)GROUP BY idScientifique) as d
ON s.idScientifique=d.idScientifique

--17.   Afficher pour chaque scientifique, le nombre de ses publications, le nombre de ses projets et de ses doctorants.

SELECT s.idScientifique, NbPubli,NbProjet,NbDocts
FROM(SELECT idScientifique FROM Scientifique) as s
LEFT JOIN (SELECT idPersonnel, COUNT(*) as NbPubli FROM PersonnelPublie GROUP BY idPersonnel) as p
ON s.idScientifique=p.idPersonnel
LEFT JOIN (SELECT idScientifique, COUNT(*) as NbProjet FROM ScientifiqueParticipeProjet GROUP BY idScientifique) as pr
ON s.idScientifique=pr.idScientifique
LEFT JOIN (SELECT idScientifique, COUNT(*) as NbDocts FROM ScientifiqueEncadreDoctorant GROUP BY idScientifique) as d
ON s.idScientifique=d.idScientifique

--19.   Pour chaque scientifique, le nombre de ses collaborateur externes


SELECT s.idScientifique,COUNT(p.idAuteur) as NbCollab
FROM Scientifique s
JOIN (SELECT idPersonnel, idAuteur 
FROM PersonnelPublie
JOIN AuteurLaboPublie
ON idPublication=idPubli) as p
ON p.idPersonnel=s.idScientifique
GROUP BY idScientifique
