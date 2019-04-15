INSERT INTO `Personnel` (`Nom`, `Prenom`, `Adresse`, `Date_naissance`, `Date_recrutement`, `idPersonnel`) 
VALUES ('rterte', 'ertertre', 'ertertre', '2019-04-03', '2019-04-18', 1);
INSERT INTO `Personnel` (`Nom`, `Prenom`, `Adresse`, `Date_naissance`, `Date_recrutement`, `idPersonnel`) 
VALUES  ('Orange', 'Pomme', '5 avenue du rolt', '2020-04-03', '2019-04-18', 118518);
INSERT INTO `Personnel` (`Nom`, `Prenom`, `Adresse`, `Date_naissance`, `Date_recrutement`, `idPersonnel`) 
VALUES ('Fastaspack', 'Pol', '85 avenue du grolsh', '1964-05-21', '1992-01-04', 121314);
INSERT INTO `Personnel` (`Nom`, `Prenom`, `Adresse`, `Date_naissance`, `Date_recrutement`, `idPersonnel`) 
VALUES ('Deux', 'Jean-Paul', 'cimetière du vatican', '1929-11-26', '1990-12-25', 151617);
INSERT INTO `Personnel` (`Nom`, `Prenom`, `Adresse`, `Date_naissance`, `Date_recrutement`, `idPersonnel`) 
VALUES ('Encadrator', 'Zi', 'Dans la matrice', '1950-10-04', '2000-09-25', 10);
INSERT INTO `Personnel` (`Nom`, `Prenom`, `Adresse`, `Date_naissance`, `Date_recrutement`, `idPersonnel`) 
VALUES ('Bond', 'James', 'No fix adress', '1920-11-11', '1946-08-02', 007);
INSERT INTO `Personnel` (`Nom`, `Prenom`, `Adresse`, `Date_naissance`, `Date_recrutement`, `idPersonnel`) 
VALUES ('Einstein', 'Albert', '12 Aenue de Zurich', '1801-10-19', '1819-06-14', 999);


INSERT INTO `Scientifique` (`idScientifique`, `Grade`)
VALUES (1,3);
INSERT INTO `Scientifique` (`idScientifique`, `Grade`)
VALUES (118518,2);
INSERT INTO `Scientifique` (`idScientifique`, `Grade`)
VALUES (10,1);
INSERT INTO `Scientifique` (`idScientifique`, `Grade`)
VALUES (007,3);
INSERT INTO `Scientifique` (`idScientifique`, `Grade`)
VALUES (999,1);

INSERT INTO `Doctorant` (`idDoctorant`, `date_soutenance`)
VALUES (121314,'1938-12-01');
INSERT INTO `Doctorant` (`idDoctorant`, `date_soutenance`)
VALUES (151617,'2012-12-25');
INSERT INTO `Doctorant` (`idDoctorant`, `date_soutenance`)
VALUES (1,'2019-04-10');

INSERT INTO `ScientifiqueEncadreDoctorant` (`idScientifique`,`idDoctorant`)
VALUES (118518, 151617);
INSERT INTO `ScientifiqueEncadreDoctorant` (`idScientifique`,`idDoctorant`)
VALUES (10, 121314);
INSERT INTO `ScientifiqueEncadreDoctorant` (`idScientifique`,`idDoctorant`)
VALUES (10, 1);

INSERT INTO `JPO` (`idJPO`,`date_debut`,`date_fin`)
VALUES (12,'2019-03-25','2019-03-27');
INSERT INTO `JPO` (`idJPO`,`date_debut`,`date_fin`)
VALUES (13,'2015-04-12','2015-04-14');

INSERT INTO `PersonnelParticipeJPO` (`idPersonnel`, `idJPO`)
VALUES (1, 12);
INSERT INTO `PersonnelParticipeJPO` (`idPersonnel`, `idJPO`)
VALUES (118518, 13);

INSERT INTO `Etablissement` (`idEtablissement`,`Nom`,`Acronyme`,`Adresse`)
VALUES (51,'Entreprise Décision Financières','EDF','48 impasse du budget');
INSERT INTO `Etablissement` (`idEtablissement`,`Nom`,`Acronyme`,`Adresse`)
VALUES (52,'H2C corporation','H2Ccorp','62 rue de l'eauc');

INSERT INTO `Enseignant_chercheur` (`Echelon`,`idEtablissement`,`idScientifique`)
VALUES (2,51,10);

INSERT INTO `Conference` (`idConference`,`date_debut`,`date_fin`,`idPresident`)
VALUES (

INSERT INTO 
VALUES (''

INSERT INTO 
VALUES (''

INSERT INTO 
VALUES (''

INSERT INTO 
VALUES (''

INSERT INTO 
VALUES (''

INSERT INTO 
VALUES (''

INSERT INTO 
VALUES (''

INSERT INTO 
VALUES (''

INSERT INTO 
VALUES (''

INSERT INTO 
VALUES (''
