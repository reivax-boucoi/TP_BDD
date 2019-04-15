CREATE TABLE `Scientifique` (
	`idScientifique` int NOT NULL,
	`Grade` int NOT NULL,
	`idPersonnel` int NOT NULL,
	PRIMARY KEY (`idScientifique`)
);

CREATE TABLE `Etablissement` (
	`Nom` varchar(255) NOT NULL,
	`Acronyme` varchar(255) NOT NULL,
	`Adresse` varchar(255) NOT NULL,
	PRIMARY KEY (`Nom`)
);

CREATE TABLE `Enseignant_chercheur` (
	`Echelon` int NOT NULL,
	`NomEtablissement` varchar(255) NOT NULL,
	`idScientifique` INT NOT NULL
);

CREATE TABLE `Projet_recherche` (
	`Titre` varchar(255) NOT NULL,
	`Acronyme` varchar(255) NOT NULL,
	`Anne_debut` int NOT NULL,
	`Duree` int NOT NULL,
	`Cout_global` int NOT NULL,
	`Budget_alloue` int NOT NULL,
	`ScientifiquePorteur`  int NOT NULL,
	PRIMARY KEY (`Titre`)
);

CREATE TABLE `ScientifiqueParticipeProjet` (
	`TitreProjet` varchar(255) NOT NULL,
	`idScientifique` int NOT NULL
);

CREATE TABLE `Doctorant` (
	`idDoctorant` int NOT NULL,
	`date_soutenance` DATE NOT NULL,
	`idPersonnel` int NOT NULL,
	PRIMARY KEY (`idDoctorant`)
);

CREATE TABLE `ScientifiqueEncadreDoctorant` (
	`idScientifique` int NOT NULL,
	`idDoctorant` int NOT NULL
);

CREATE TABLE `Publication` (
	`idPublicaction` int NOT NULL,
	`titre` varchar(255) NOT NULL,
	`annee_publication` DATE NOT NULL,
	`nom_conference/journal` varchar(255) NOT NULL,
	`classe_conference` varchar(255) NOT NULL,
	`nb_pages` int NOT NULL,
	PRIMARY KEY (`idPublicaction`)
);

CREATE TABLE `Labo_externe` (
	`Nom` varchar(255) NOT NULL,
	`Pays` varchar(255) NOT NULL,
	PRIMARY KEY (`Nom`)
);

CREATE TABLE `LaboPublie` (
	`NomLabo` varchar(255) NOT NULL,
	`idPubli` int NOT NULL
);

CREATE TABLE `Personnel` (
	`Nom` VARCHAR(255) NOT NULL,
	`Prenom` VARCHAR(255) NOT NULL,
	`Adresse` VARCHAR(255) NOT NULL,
	`Date_naissance` DATE NOT NULL,
	`Date_recrutement` DATE NOT NULL,
	`idPersonnel` INT NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`idPersonnel`)
);

CREATE TABLE `PersonnelPublie` (
	`idPublication` INT NOT NULL,
	`idPersonnel` INT NOT NULL
);

CREATE TABLE `Conference` (
	`idConference` INT NOT NULL AUTO_INCREMENT,
	`date_debut` DATE NOT NULL,
	`date_fin` DATE NOT NULL,
	PRIMARY KEY (`idConference`)
);

CREATE TABLE `JPO` (
	`idJPO` INT NOT NULL AUTO_INCREMENT,
	`date_debut` DATE NOT NULL,
	`date_fin` DATE NOT NULL,
	PRIMARY KEY (`idJPO`)
);

CREATE TABLE `ScientifiquePresideConference` (
	`idConference` INT NOT NULL,
	`idScientifique` int NOT NULL
);

CREATE TABLE `PersonnelParticipeJPO` (
	`idPersonnel` INT NOT NULL,
	`idJPO`  NOT NULL
);

ALTER TABLE `Scientifique` ADD CONSTRAINT `Scientifique_fk0` FOREIGN KEY (`idPersonnel`) REFERENCES `Personnel`(`idPersonnel`);

ALTER TABLE `Enseignant_chercheur` ADD CONSTRAINT `Enseignant_chercheur_fk0` FOREIGN KEY (`NomEtablissement`) REFERENCES `Etablissement`(`Nom`);

ALTER TABLE `Enseignant_chercheur` ADD CONSTRAINT `Enseignant_chercheur_fk1` FOREIGN KEY (`idScientifique`) REFERENCES `Scientifique`(`idScientifique`);

ALTER TABLE `Projet_recherche` ADD CONSTRAINT `Projet_recherche_fk0` FOREIGN KEY (`ScientifiquePorteur`) REFERENCES `Scientifique`(`idScientifique`);

ALTER TABLE `ScientifiqueParticipeProjet` ADD CONSTRAINT `ScientifiqueParticipeProjet_fk0` FOREIGN KEY (`TitreProjet`) REFERENCES `Projet_recherche`(`Titre`);

ALTER TABLE `ScientifiqueParticipeProjet` ADD CONSTRAINT `ScientifiqueParticipeProjet_fk1` FOREIGN KEY (`idScientifique`) REFERENCES `Scientifique`(`idScientifique`);

ALTER TABLE `Doctorant` ADD CONSTRAINT `Doctorant_fk0` FOREIGN KEY (`idPersonnel`) REFERENCES `Personnel`(`idPersonnel`);

ALTER TABLE `ScientifiqueEncadreDoctorant` ADD CONSTRAINT `ScientifiqueEncadreDoctorant_fk0` FOREIGN KEY (`idScientifique`) REFERENCES `Scientifique`(`idScientifique`);

ALTER TABLE `ScientifiqueEncadreDoctorant` ADD CONSTRAINT `ScientifiqueEncadreDoctorant_fk1` FOREIGN KEY (`idDoctorant`) REFERENCES `Doctorant`(`idDoctorant`);

ALTER TABLE `LaboPublie` ADD CONSTRAINT `LaboPublie_fk0` FOREIGN KEY (`NomLabo`) REFERENCES `Labo_externe`(`Nom`);

ALTER TABLE `LaboPublie` ADD CONSTRAINT `LaboPublie_fk1` FOREIGN KEY (`idPubli`) REFERENCES `Publication`(`idPublicaction`);

ALTER TABLE `PersonnelPublie` ADD CONSTRAINT `PersonnelPublie_fk0` FOREIGN KEY (`idPublication`) REFERENCES `Publication`(`idPublicaction`);

ALTER TABLE `PersonnelPublie` ADD CONSTRAINT `PersonnelPublie_fk1` FOREIGN KEY (`idPersonnel`) REFERENCES `Personnel`(`idPersonnel`);

ALTER TABLE `ScientifiquePresideConference` ADD CONSTRAINT `ScientifiquePresideConference_fk0` FOREIGN KEY (`idConference`) REFERENCES `Conference`(`idConference`);

ALTER TABLE `ScientifiquePresideConference` ADD CONSTRAINT `ScientifiquePresideConference_fk1` FOREIGN KEY (`idScientifique`) REFERENCES `Scientifique`(`idScientifique`);

ALTER TABLE `PersonnelParticipeJPO` ADD CONSTRAINT `PersonnelParticipeJPO_fk0` FOREIGN KEY (`idPersonnel`) REFERENCES `Personnel`(`idPersonnel`);

ALTER TABLE `PersonnelParticipeJPO` ADD CONSTRAINT `PersonnelParticipeJPO_fk1` FOREIGN KEY (`idJPO`) REFERENCES `JPO`(`idJPO`);

