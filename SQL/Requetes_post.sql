-- REQUETES TESTEES ---------------------------------------------------------------

--1.     Le nom et les grades des encadrants d’un doctorant donné

SELECT p.Nom,s.grade FROM 
(SELECT Nom, idPersonnel FROM Personnel WHERE idPersonnel IN (SELECT idScientifique FROM ScientifiqueEncadreDoctorant WHERE idDoctorant=1))as p
JOIN
(SELECT s.grade,s.idScientifique FROM Scientifique s WHERE s.idScientifique IN (SELECT idScientifique FROM ScientifiqueEncadreDoctorant WHERE idDoctorant=1))as s
ON s.idScientifique=p.idPersonnel

--2.     Les pays avec qui un scientifique donné collabore

SELECT Pays FROM Labo_externe WHERE Nom IN(SELECT NomLabo FROM Auteur WHERE idAuteur IN(SELECT idAuteur FROM AuteurLaboPublie WHERE idPubli IN(SELECT idPublication FROM PersonnelPublie WHERE idPersonnel=8)));

--4.     Le nombre de collaborateurs d’un scientifique donné en 2018


SELECT COUNT(idPersonnel)as NbCollab FROM PersonnelPublie 
WHERE (idPublication IN 
	(SELECT idPublication FROM Publication 
	WHERE annee_publication=2018 AND idPublication IN
	(SELECT idPublication FROM PersonnelPublie 
		WHERE idPersonnel=10)
	) AND idPersonnel!=10)
	


--5.     Pour chaque doctorant, on souhaiterait récupérer le nombre de ses publications

SELECT d.idDoctorant,p.cntPubli
FROM (SELECT idPersonnel,COUNT(idPublication) as cntPubli FROM PersonnelPublie GROUP BY idPersonnel)as p
RIGHT JOIN (SELECT idDoctorant FROM Doctorant) as d
ON d.idDoctorant=p.idPersonnel
	
--6.     Le nombre de publications par année de tout le laboratoire

(SELECT annee_publication,COUNT(*) as cntPubli FROM Publication GROUP BY annee_publication);


--7.     Le nombre de doctorants du laboratoire

SELECT COUNT(*) as nbDoctorants FROM Doctorant;

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

--12.   Les personnes qui n’ont jamais participé aux journées portes ouvertes

(SELECT idPersonnel from Personnel)
EXCEPT
(SELECT idPersonnel from PersonnelParticipeJPO)


--13.   Le nom et l’année de toutes les conférences organisées par un scientifique donné.

SELECT Nom_conf,EXTRACT(YEAR FROM date_debut) as annee FROM Conference WHERE idPresident=7

--14.   Le nom et le prénom du scientifique qui n’a jamais encadré

SELECT s.Nom,s.Prenom
FROM(SELECT idPersonnel,Nom,Prenom from Personnel) as s
JOIN ((SELECT idScientifique from Scientifique)
EXCEPT
(SELECT idScientifique from ScientifiqueEncadreDoctorant))as e
ON e.idScientifique=s.idPersonnel


--15.   Pour une année donnée, on veut récupérer le nombre de publications, de conférences, et de  doctorants de chaque scientifique

SELECT s.idScientifique, NbPubli,NbConf,NbDocts
FROM(SELECT idScientifique FROM Scientifique) as s
LEFT JOIN (SELECT idPresident,COUNT(*) as NbConf FROM Conference WHERE EXTRACT(YEAR FROM date_debut)=2018 GROUP BY idPresident) as c
ON s.idScientifique=c.idPresident

LEFT JOIN (SELECT idPersonnel,COUNT(*) as NbPubli FROM PersonnelPublie WHERE idPublication IN(SELECT idPublication FROM Publication	WHERE annee_publication=2018) GROUP BY idPersonnel) as p
ON s.idScientifique=p.idPersonnel

LEFT JOIN	(SELECT idScientifique,COUNT(*) as NbDocts FROM ScientifiqueEncadreDoctorant WHERE idDoctorant IN(SELECT idDoctorant FROM Doctorant WHERE EXTRACT(YEAR FROM date_soutenance)=2018)GROUP BY idScientifique) as d
ON s.idScientifique=d.idScientifique


--16.   Le nom et le prénom du scientifique qui n’a jamais publié, encadré, ni participé à des projets.
SELECT Nom,Prenom from Personnel p WHERE p.idPersonnel=
((((SELECT idScientifique from Scientifique)
EXCEPT
(SELECT idScientifique from ScientifiqueEncadreDoctorant))
EXCEPT
(SELECT idScientifique from ScientifiqueParticipeProjet))
EXCEPT
SELECT idPersonnel from PersonnelPublie)


--17.   Afficher pour chaque scientifique, le nombre de ses publications, le nombre de ses projets et de ses doctorants.

SELECT s.idScientifique, NbPubli,NbProjet,NbDocts
FROM(SELECT idScientifique FROM Scientifique) as s
LEFT JOIN (SELECT idPersonnel, COUNT(*) as NbPubli FROM PersonnelPublie GROUP BY idPersonnel) as p
ON s.idScientifique=p.idPersonnel
LEFT JOIN (SELECT idScientifique, COUNT(*) as NbProjet FROM ScientifiqueParticipeProjet GROUP BY idScientifique) as pr
ON s.idScientifique=pr.idScientifique
LEFT JOIN (SELECT idScientifique, COUNT(*) as NbDocts FROM ScientifiqueEncadreDoctorant GROUP BY idScientifique) as d
ON s.idScientifique=d.idScientifique

--18.   Les scientifiques qui ont que des doctorants ayant soutenus et pas de doctorant en cours


SELECT idScientifique FROM ScientifiqueEncadreDoctorant 
EXCEPT
SELECT idScientifique FROM ScientifiqueEncadreDoctorant 
WHERE (idDoctorant IN (SELECT idDoctorant FROM Doctorant WHERE (date_soutenance >= CURRENT_DATE)))

--19.   Pour chaque scientifique, le nombre de ses collaborateur externes


SELECT s.idScientifique,COUNT(p.idAuteur) as NbCollab
FROM Scientifique s
JOIN (SELECT idPersonnel, idAuteur 
FROM PersonnelPublie
JOIN AuteurLaboPublie
ON idPublication=idPubli) as p
ON p.idPersonnel=s.idScientifique
GROUP BY idScientifique

--20.   Les scientifiques qui encadrent mais n’ont pas de doctorants ayant déjà soutenu

SELECT idScientifique FROM ScientifiqueEncadreDoctorant WHERE idDoctorant IN(SELECT idDoctorant FROM Doctorant WHERE (date_soutenance > CURRENT_DATE))

--21.   Le nombre de collaborateurs par pays


SELECT pn.Pays, COUNT(idAuteur)
FROM(SELECT Pays,Nom  FROM Labo_externe) as pn
LEFT JOIN(SELECT idAuteur, NomLabo FROM Auteur) as a
ON pn.Nom=a.NomLabo
GROUP BY pn.Pays



--23.   Les doctorants qui ont plus de 3 encadrants

SELECT idDoctorant FROM ScientifiqueEncadreDoctorant GROUP BY idDoctorant HAVING COUNT(idScientifique)>3

--26.   Les scientifiques qui recrutent au moins un doctorant par année


SELECT da.idScientifique FROM
(SELECT sd.idScientifique, COUNT(sd.DateDoc) as NbDocs, AVG(EXTRACT( YEAR FROM p.Date_recrutement)) as DateSci
FROM (SELECT idPersonnel, Date_recrutement FROM Personnel) as p

JOIN (SELECT DISTINCT s.idScientifique, EXTRACT(YEAR FROM d.Date_recrutement) as DateDoc
FROM 
(SELECT idScientifique, idDoctorant FROM ScientifiqueEncadreDoctorant) as s 
JOIN 
(SELECT idPersonnel,Date_recrutement FROM Personnel WHERE idPersonnel IN (SELECT idDoctorant FROM Doctorant)) as d 
ON s.idDoctorant=d.idPersonnel )as sd
ON sd.idScientifique=p.idPersonnel
GROUP BY sd.idScientifique) as da
WHERE (da.nbdocs>= (EXTRACT(YEAR FROM CURRENT_DATE) - da.DateSci))


--28.   Les scientifiques qui publient que dans des conférences de classe A

SELECT idScientifique FROM Scientifique WHERE idScientifique IN(
(SELECT idPersonnel FROM PersonnelPublie WHERE idPublication IN (SELECT idPublication FROM Publication WHERE nom_conference_journal IN (SELECT nom_conference_journal FROM TypeConf WHERE classe_conference='A')))
EXCEPT
(SELECT idPersonnel FROM PersonnelPublie WHERE idPublication IN (SELECT idPublication FROM Publication WHERE nom_conference_journal IN (SELECT nom_conference_journal FROM TypeConf WHERE classe_conference!='A'))))

--29
																	
(SELECT idScientifique FROM Scientifique)
INTERSECT
(SELECT idPersonnel FROM PersonnelPublie)
EXCEPT
(SELECT idPersonnel FROM PersonnelPublie WHERE idPublication IN (SELECT idPublication FROM Publication WHERE nom_conference_journal IN (SELECT nom_conference_journal FROM TypeConf WHERE classe_conference='A')))																	
--30.   Le nombre de conférences de classe A organisées par le laboratoire par année

SELECT cd.annee, COUNT(cd.Nom_conf) as NbConf FROM
(SELECT Nom_conf,EXTRACT(YEAR FROM date_debut) as annee FROM Conference) as cd
LEFT JOIN
(SELECT nom_conference_journal FROM TypeConf WHERE classe_conference='A') as na
ON na.nom_conference_journal=cd.Nom_conf
GROUP BY cd.anne


