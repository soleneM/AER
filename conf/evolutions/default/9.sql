# ajout de trois comptes par défaut avec les différents niveaux de droits

# --- !Ups

INSERT INTO `membre` (`membre_id`, `membre_nom`, `membre_confidentialite_confidentialite_id`, `membre_abonne`, `membre_temoin_actif`,`membre_droits_droits_id`,`membre_inscription_acceptee`,`membre_email`,`membre_mdp_hash`) VALUES
('1', 'user1', '1', '1', '1', '1', '1','user1','1000:64ac80b733fb754926e3c2b6bbbf1c62bb4c53d0295b53c9:dd2a542e1c77d8f785c8a77b43bcd949caec51b2f1ab8b37'),
('2', 'user2', '1', '1', '1', '2', '1','user2','1000:64ac80b733fb754926e3c2b6bbbf1c62bb4c53d0295b53c9:dd2a542e1c77d8f785c8a77b43bcd949caec51b2f1ab8b37'),
('3', 'user3', '1', '1', '1', '3', '1','user3','1000:64ac80b733fb754926e3c2b6bbbf1c62bb4c53d0295b53c9:dd2a542e1c77d8f785c8a77b43bcd949caec51b2f1ab8b37');

INSERT INTO `membre_is_expert_on_groupe` (`membre_is_expert_on_groupe_id`, `membre_membre_id`, `groupe_groupe_id`) VALUES
('1','2','8'),
('2','3','3');

INSERT INTO `type_groupement_scientifique` (`intitule`) VALUES
('sous-famille'),
('famille'),
('super-famille'),
('ordre');


INSERT INTO `aer3`.`groupement_scientifique` (`groupement_scientifique_id`, `groupement_scientifique_nom`, `groupement_scientifique_type_intitule`, `groupement_scientifique_pere_groupement_scientifique_id`) VALUES
('1', 'ordre 1', 'ordre',null),
('2', 'ordre 2', 'ordre',null),
('3', 'super famille 1', 'super-famille', '1'),
('4', 'super famille 2', 'super-famille', '1'),
('5', 'famille 1', 'famille', '3'),
('6', 'famille 2', 'famille', '3'),
('7', 'sous famille 1', 'sous-famille', '5'),
('8', 'sous famille 2', 'sous-famille', '5'),
('9', 'sous famille 3', 'sous-famille', null);

INSERT INTO `espece` (`espece_id`, `espece_nom`, `espece_auteur`, `espece_groupement_scientifique_pere_groupement_scientifique_id`, `espece_systematique`) VALUES
('1','espece 1','bob','7', '1'),
('2','espece 2','bob','7', '2'),
('3','espece 3','bob','5', '3');



# --- !Downs

SET FOREIGN_KEY_CHECKS=0;

DELETE FROM membre;
DELETE FROM membre_is_expert_on_groupe;
DELETE FROM type_groupement_scientifique;

SET FOREIGN_KEY_CHECKS=1;