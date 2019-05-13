INSERT INTO `Personnel` (`Nom`, `Prenom`, `Adresse`, `Date_naissance`, `Date_recrutement`, `idPersonnel`) 
VALUES ('rterte', 'ertertre', 'ertertre', '1978-04-03', '2017-04-18', 1);
INSERT INTO `Personnel` (`Nom`, `Prenom`, `Adresse`, `Date_naissance`, `Date_recrutement`, `idPersonnel`) 
VALUES  ('Orange', 'Pomme', '5 avenue du rolt', '1989-04-03', '2016-04-18', 118518);
INSERT INTO `Personnel` (`Nom`, `Prenom`, `Adresse`, `Date_naissance`, `Date_recrutement`, `idPersonnel`) 
VALUES ('Fastaspack', 'Pol', '85 avenue du grolsh', '1964-05-21', '1992-01-04', 121314);
INSERT INTO `Personnel` (`Nom`, `Prenom`, `Adresse`, `Date_naissance`, `Date_recrutement`, `idPersonnel`) 
VALUES ('Deux', 'Jean-Paul', 'cimetière du vatican', '1929-11-26', '1990-12-25', 151617);
INSERT INTO `Personnel` (`Nom`, `Prenom`, `Adresse`, `Date_naissance`, `Date_recrutement`, `idPersonnel`) 
VALUES ('Encadrator', 'Zi', 'Dans la matrice', '1950-10-04', '2000-09-25', 10);
INSERT INTO `Personnel` (`Nom`, `Prenom`, `Adresse`, `Date_naissance`, `Date_recrutement`, `idPersonnel`) 
VALUES ('Bond', 'James', 'No fix adress', '1920-11-11', '1946-08-02', 007);
INSERT INTO `Personnel` (`Nom`, `Prenom`, `Adresse`, `Date_naissance`, `Date_recrutement`, `idPersonnel`) 
VALUES ('Einstein', 'Albert', '12 Avenue de Zurich', '1801-10-19', '1819-06-14', 999);
INSERT INTO `Personnel` (`Nom`, `Prenom`, `Adresse`, `Date_naissance`, `Date_recrutement`, `idPersonnel`) 
VALUES ('Kine', 'Miss', 'Rue', '1313-10-13', '1393-01-13', 13);
INSERT INTO `Personnel` (`Nom`, `Prenom`, `Adresse`, `Date_naissance`, `Date_recrutement`, `idPersonnel`) 
VALUES ('Boule', 'Boojton', 'Royaume de Belgique', '1888-08-08', '2016-08-10', 8);
INSERT INTO `Personnel` (`Nom`, `Prenom`, `Adresse`, `Date_naissance`, `Date_recrutement`, `idPersonnel`) 
VALUES ('Bill', 'Sacré', 'Royaume de Belgique, niche', '1888-08-08', '2016-08-09', 88);
INSERT INTO `Personnel` (`Nom`, `Prenom`, `Adresse`, `Date_naissance`, `Date_recrutement`, `idPersonnel`) 
VALUES ('Nom', 'Prenom', 'Adresse', '1990-02-04', '2017-04-04', 6);
INSERT INTO `Personnel` (`Nom`, `Prenom`, `Adresse`, `Date_naissance`, `Date_recrutement`, `idPersonnel`) 
VALUES ('Dupont', 'Martin', 'SDF', '1985-02-04', '2016-04-04', 66);


INSERT INTO `Scientifique` (`idScientifique`, `Grade`)
VALUES (118518,2);
INSERT INTO `Scientifique` (`idScientifique`, `Grade`)
VALUES (10,1);
INSERT INTO `Scientifique` (`idScientifique`, `Grade`)
VALUES (007,3);
INSERT INTO `Scientifique` (`idScientifique`, `Grade`)
VALUES (999,1);
INSERT INTO `Scientifique` (`idScientifique`, `Grade`)
VALUES (13,0);
INSERT INTO `Scientifique` (`idScientifique`, `Grade`)
VALUES (6,8);

INSERT INTO `Doctorant` (`idDoctorant`, `date_soutenance`)
VALUES (121314,'1938-12-01');
INSERT INTO `Doctorant` (`idDoctorant`, `date_soutenance`)
VALUES (151617,'2012-12-25');
INSERT INTO `Doctorant` (`idDoctorant`, `date_soutenance`)
VALUES (1,'2019-06-10');
INSERT INTO `Doctorant` (`idDoctorant`, `date_soutenance`)
VALUES (8,'2018-06-10');
INSERT INTO `Doctorant` (`idDoctorant`, `date_soutenance`)
VALUES (88,'2018-12-10');
INSERT INTO `Doctorant` (`idDoctorant`, `date_soutenance`)
VALUES (66,'2017-10-04');

INSERT INTO `ScientifiqueEncadreDoctorant` (`idScientifique`,`idDoctorant`)
VALUES (118518, 151617);
INSERT INTO `ScientifiqueEncadreDoctorant` (`idScientifique`,`idDoctorant`)
VALUES (10, 121314);
INSERT INTO `ScientifiqueEncadreDoctorant` (`idScientifique`,`idDoctorant`)
VALUES (10, 1);
INSERT INTO `ScientifiqueEncadreDoctorant` (`idScientifique`,`idDoctorant`)
VALUES (118518, 1);
INSERT INTO `ScientifiqueEncadreDoctorant` (`idScientifique`,`idDoctorant`)
VALUES (7, 1);
INSERT INTO `ScientifiqueEncadreDoctorant` (`idScientifique`,`idDoctorant`)
VALUES (6, 1);
INSERT INTO `ScientifiqueEncadreDoctorant` (`idScientifique`,`idDoctorant`)
VALUES (6, 66);
INSERT INTO `ScientifiqueEncadreDoctorant` (`idScientifique`,`idDoctorant`)
VALUES (6, 88);

INSERT INTO `JPO` (`idJPO`,`date_debut`,`date_fin`)
VALUES (12,'2019-03-25','2019-03-27');
INSERT INTO `JPO` (`idJPO`,`date_debut`,`date_fin`)
VALUES (13,'2015-04-12','2015-04-14');

INSERT INTO `PersonnelParticipeJPO` (`idPersonnel`, `idJPO`)
VALUES (1, 12);
INSERT INTO `PersonnelParticipeJPO` (`idPersonnel`, `idJPO`)
VALUES (118518, 13);
INSERT INTO `PersonnelParticipeJPO` (`idPersonnel`, `idJPO`)
VALUES (118518, 12);

INSERT INTO `Etablissement` (`idEtablissement`,`Nom`,`Acronyme`,`Adresse`)
VALUES (51,'Entreprise Décision Financières','EDF','48 impasse du budget');
INSERT INTO `Etablissement` (`idEtablissement`,`Nom`,`Acronyme`,`Adresse`)
VALUES (52,'H2C corporation','H2Ccorp','62 rue de l''eauc');

INSERT INTO `Enseignant_chercheur` (`Echelon`,`idEtablissement`,`idScientifique`)
VALUES (2,51,10);

INSERT INTO `Conference` (`idConference`,`Nom_conf`,`date_debut`,`date_fin`,`idPresident`)
VALUES (31, 'Encadrator VS Publicator : Conférence-combat', '2019-11-12', '2048-04-05',10);
INSERT INTO `Conference` (`idConference`,`Nom_conf`,`date_debut`,`date_fin`,`idPresident`)
VALUES (8, 'L''inspiration dans l''infiltration : Récit', '2000-11-12', '2000-10-10',007);
INSERT INTO `Conference` (`idConference`,`Nom_conf`,`date_debut`,`date_fin`,`idPresident`)
VALUES (18, 'Demain ne meurt pas aujourd''hui : TED talk', '2001-09-31', '2001-10-31',007);
INSERT INTO `Conference` (`idConference`,`Nom_conf`,`date_debut`,`date_fin`,`idPresident`)
VALUES (28, 'La référence, la conférence youpi', '2018-11-12', '2018-10-10',999);
INSERT INTO `Conference` (`idConference`,`Nom_conf`,`date_debut`,`date_fin`,`idPresident`)
VALUES (38, 'Cours de torture pour débutants', '2018-09-31', '2018-10-31',007);
        
INSERT INTO `TypeConf` (`nom_conference/journal`,`classe_conference`)
VALUES ('Sciences & Rhododendrons','Costume');
INSERT INTO `TypeConf` (`nom_conference/journal`,`classe_conference`)
VALUES ('Msobzd & Roeqifh','Oui');
INSERT INTO `TypeConf` (`nom_conference/journal`,`classe_conference`)
VALUES ('Sproutznitch Magazine','Non');
INSERT INTO `TypeConf` (`nom_conference/journal`,`classe_conference`)
VALUES ('Miamgazine','3èmeB');
INSERT INTO `TypeConf` (`nom_conference/journal`,`classe_conference`)
VALUES ('Meuhgazine','TrèsClasse');
INSERT INTO `TypeConf` (`nom_conference/journal`,`classe_conference`)
VALUES ('Magzérable','Mizérableuh');     


INSERT INTO `Publication` (`idPublication`,`titre`,`annee_publication`, `nom_conference/journal`, `nb_pages`)
VALUES (9,'Recherches sur les rhododendrons',2019,'Sciences & Rhododendrons',25000);
INSERT INTO `Publication` (`idPublication`,`titre`,`annee_publication`, `nom_conference/journal`, `nb_pages`)
VALUES (42,'Recherches sur les msobzd',2001,'Msobzd & Roeqifh',50000);
INSERT INTO `Publication` (`idPublication`,`titre`,`annee_publication`, `nom_conference/journal`, `nb_pages`)
VALUES (8,'Recherches sur les Sproutznitch',2000,'Sproutznitch Magazine',3);
INSERT INTO `Publication` (`idPublication`,`titre`,`annee_publication`, `nom_conference/journal`, `nb_pages`)
VALUES (10,'Recherches sur lard des mets',2018,'Miamgazine',2);
INSERT INTO `Publication` (`idPublication`,`titre`,`annee_publication`, `nom_conference/journal`, `nb_pages`)
VALUES (111,'Recherches sur les laits laids',2005,'Meuhgazine',1250);
INSERT INTO `Publication` (`idPublication`,`titre`,`annee_publication`, `nom_conference/journal`, `nb_pages`)
VALUES (100,'Recherches sur la pauvreté',1848,'Magzérable',1848); 
 
INSERT INTO `PersonnelPublie` (`idPublication`, `idPersonnel`)
VALUES (9,1);
INSERT INTO `PersonnelPublie` (`idPublication`, `idPersonnel`)
VALUES (42,1);
INSERT INTO `PersonnelPublie` (`idPublication`, `idPersonnel`)
VALUES (8,007);
INSERT INTO `PersonnelPublie` (`idPublication`, `idPersonnel`)
VALUES (111,10);
INSERT INTO `PersonnelPublie` (`idPublication`, `idPersonnel`)
VALUES (10,10);
INSERT INTO `PersonnelPublie` (`idPublication`, `idPersonnel`)
VALUES (100,10);
INSERT INTO `PersonnelPublie` (`idPublication`, `idPersonnel`)
VALUES (10,999);
INSERT INTO `PersonnelPublie` (`idPublication`, `idPersonnel`)
VALUES (111,121314);


INSERT INTO `Labo_externe` (`Nom`,`Pays`)
VALUES ('NotreDamedeFeu', 'Paris');
INSERT INTO `Labo_externe` (`Nom`,`Pays`)
VALUES ('Laas', 'MonPaïs');
INSERT INTO `Labo_externe` (`Nom`,`Pays`)
VALUES ('cdelalitterature', 'Estonie');
INSERT INTO `Labo_externe` (`Nom`,`Pays`)
VALUES ('Chambre', 'URSS');

INSERT INTO `Auteur` (`idAuteur`, `Nom`, `Prenom`, `NomLabo`)
VALUES (1, 'Hugo', 'Viktor', 'NotreDamedeFeu');
INSERT INTO `Auteur` (`idAuteur`, `Nom`, `Prenom`, `NomLabo`)
VALUES (2, 'Sade', 'Le Marquis', 'Cdelalitterature');
INSERT INTO `Auteur` (`idAuteur`, `Nom`, `Prenom`, `NomLabo`)
VALUES (3, 'Apollinaire', 'Kev', 'Chambre');

INSERT INTO `AuteurLaboPublie` (`idAuteur`, `idPubli`)
VALUES (1,100);
INSERT INTO `AuteurLaboPublie` (`idAuteur`, `idPubli`)
VALUES (2,42);


INSERT INTO `Projet_recherche` (`Titre`, `Acronyme`,`Anne_debut`,`Duree`,`Cout_global`,`Budget_alloue`,`ScientifiquePorteur`)
VALUES ('Meilleur projet du meilleur quinôme','MPMQ',2019,1000,0,1,10);
INSERT INTO `Projet_recherche` (`Titre`, `Acronyme`,`Anne_debut`,`Duree`,`Cout_global`,`Budget_alloue`,`ScientifiquePorteur`)
VALUES ('Parce que c''est notre projet','PQCNP',2019,1000,4,5,118518);
INSERT INTO `Projet_recherche` (`Titre`, `Acronyme`,`Anne_debut`,`Duree`,`Cout_global`,`Budget_alloue`,`ScientifiquePorteur`)
VALUES ('Amen.','JC',0,1000,12,54,6);
INSERT INTO `Projet_recherche` (`Titre`, `Acronyme`,`Anne_debut`,`Duree`,`Cout_global`,`Budget_alloue`,`ScientifiquePorteur`)
VALUES ('Vivement Dimanche Matin','VDM',1950,5,20000,1,118518);

INSERT INTO `ScientifiqueParticipeProjet` (`TitreProjet`, `idScientifique`)
VALUES ('Meilleur projet du meilleur quinôme',10);
INSERT INTO `ScientifiqueParticipeProjet` (`TitreProjet`, `idScientifique`)
VALUES ('Parce que c''est notre projet',118518);
INSERT INTO `ScientifiqueParticipeProjet` (`TitreProjet`, `idScientifique`)
VALUES ('Vivement Dimanche Matin',118518);

INSERT INTO `Partenaire` (`idPartenaire`,`NomEntite`,`Pays`)
VALUES (1212,'LeGrandMiam','France');
INSERT INTO `Partenaire` (`idPartenaire`,`NomEntite`,`Pays`)
VALUES (1213,'LeGrandMeaulnes','Espagne');
INSERT INTO `Partenaire` (`idPartenaire`,`NomEntite`,`Pays`)
VALUES (1214,'Parvenir','Suisse');

INSERT INTO `PartenaireParticipeProjet` (`TitreProjet`,`idPartenaire`)
VALUES ('Amen.',1212);
INSERT INTO `PartenaireParticipeProjet` (`TitreProjet`,`idPartenaire`)
VALUES ('Vivement Dimanche Matin',1214);

--Tout ce qui précède a été testé et implémenté (et c'est vrai cette fois)
