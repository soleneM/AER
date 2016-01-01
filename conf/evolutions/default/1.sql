# --- Created by Ebean DDL
# To stop Ebean DDL generation, remove this comment and start using Evolutions

# --- !Ups

create table commune (
  ville_id                  MEDIUMINT(8) UNSIGNED auto_increment not null,
  ville_departement_departement_code VARCHAR(3),
  ville_slug                varchar(255),
  ville_nom                 VARCHAR(45) not null,
  ville_nom_reel            VARCHAR(45) not null,
  ville_nom_soundex         VARCHAR(20),
  ville_nom_metaphone       VARCHAR(22),
  ville_code_postal         varchar(255),
  ville_commune             VARCHAR(3),
  ville_code_commune        VARCHAR(5),
  ville_arrondissement      SMALLINT(3) UNSIGNED,
  ville_canton              VARCHAR(4),
  ville_amdi                SMALLINT(5) UNSIGNED,
  ville_population_2010     MEDIUMINT(11) UNSIGNED,
  ville_population_1999     MEDIUMINT(11) UNSIGNED,
  ville_population_2012     MEDIUMINT(10) UNSIGNED,
  ville_densite_2010        INT(11) UNSIGNED,
  ville_surface             MEDIUMINT(7) UNSIGNED,
  ville_longitude_deg       FLOAT,
  ville_latitude_deg        FLOAT,
  ville_longitude_grd       VARCHAR(9),
  ville_latitude_grd        VARCHAR(8),
  ville_longitude_dms       VARCHAR(9),
  ville_latitude_dms        VARCHAR(8),
  ville_zmin                MEDIUMINT(4),
  ville_zmax                MEDIUMINT(4),
  ville_population_2010_order_france INT(10) UNSIGNED,
  ville_densite_2010_order_france INT(10) UNSIGNED,
  ville_surface_order_france INT(10) UNSIGNED,
  ville_nom_aer             varchar(255),
  constraint pk_commune primary key (ville_id))
;

create table confidentialite (
  confidentialite_id        integer auto_increment not null,
  confidentialite_intitule  varchar(255) not null,
  confidentialite_explication TEXT not null,
  constraint pk_confidentialite primary key (confidentialite_id))
;

create table date_charniere (
  date_charniere_id         integer auto_increment not null,
  date_charniere_date       datetime not null,
  date_charniere_groupe_groupe_id integer not null,
  constraint pk_date_charniere primary key (date_charniere_id))
;

create table departement (
  departement_code          VARCHAR(3) not null,
  departement_nom           varchar(255),
  departement_nom_uppercase varchar(255),
  departement_slug          varchar(255),
  departement_nom_soundex   VARCHAR(20),
  constraint pk_departement primary key (departement_code))
;

create table droits (
  droits_id                 integer auto_increment not null,
  droits_intitule           varchar(255) not null,
  constraint pk_droits primary key (droits_id))
;

create table espece (
  espece_id                 integer auto_increment not null,
  espece_nom                varchar(255) not null,
  espece_auteur             varchar(255) not null,
  espece_systematique       integer not null,
  espece_photo_image_id     bigint,
  espece_groupement_scientifique_pere_groupement_scientifique_id integer not null,
  espece_commentaires       TEXT,
  constraint pk_espece primary key (espece_id))
;

create table espece_is_in_groupement_local (
  espece_is_in_groupement_local_id integer auto_increment not null,
  espece_espece_id          integer not null,
  groupe_groupe_id          integer not null,
  constraint pk_espece_is_in_groupement_local primary key (espece_is_in_groupement_local_id))
;

create table espece_synonyme (
  synonyme_id               integer auto_increment not null,
  synonyme_nom              varchar(255) not null,
  synonyme_origine_aer      tinyint(1) default 0 not null,
  synonyme_espece_espece_id integer not null,
  constraint pk_espece_synonyme primary key (synonyme_id))
;

create table fiche (
  fiche_id                  bigint auto_increment not null,
  fiche_lieudit             varchar(255),
  fiche_date_min            datetime,
  fiche_date                datetime not null,
  fiche_memo                TEXT,
  fiche_utm_utm             VARCHAR(4),
  fiche_commune_ville_id    MEDIUMINT(8) UNSIGNED,
  fiche_gps_coordinates     varchar(255),
  fiche_utm1x1              varchar(255),
  fiche_date_soumission     datetime not null,
  fiche_id_papier           integer,
  constraint pk_fiche primary key (fiche_id))
;

create table fiche_has_membre (
  fiche_has_membre_id       integer auto_increment not null,
  membre_membre_id          integer not null,
  fiche_fiche_id            bigint not null,
  constraint pk_fiche_has_membre primary key (fiche_has_membre_id))
;

create table groupe (
  groupe_id                 integer auto_increment not null,
  groupe_nom                varchar(255) not null,
  groupe_pere_groupe_id     integer,
  groupe_type_type_groupement_local_intitule varchar(255) not null,
  constraint pk_groupe primary key (groupe_id))
;

create table groupe_de_membres (
  groupe_de_membres_id      integer auto_increment not null,
  groupe_de_membres_nom     varchar(255) not null,
  constraint pk_groupe_de_membres primary key (groupe_de_membres_id))
;

create table groupement_scientifique (
  groupement_scientifique_id integer auto_increment not null,
  groupement_scientifique_nom varchar(255),
  groupement_scientifique_type_intitule varchar(255) not null,
  groupement_scientifique_pere_groupement_scientifique_id integer,
  constraint pk_groupement_scientifique primary key (groupement_scientifique_id))
;

create table groupement_scientifique_is_in_groupement_local (
  groupement_scientifique_is_in_groupement_local_id integer auto_increment not null,
  groupement_scientifique_groupement_scientifique_id integer not null,
  groupe_groupe_id          integer not null,
  constraint pk_groupement_scientifique_is_in_groupement_local primary key (groupement_scientifique_is_in_groupement_local_id))
;

create table image (
  image_id                  bigint auto_increment not null,
  image_chemin              varchar(255) not null,
  image_nom                 varchar(255),
  constraint pk_image primary key (image_id))
;

create table informations_complementaires (
  informations_complementaires_id bigint auto_increment not null,
  informations_complementaires_observation_observation_id bigint not null,
  informations_complementaires_nombre_de_specimens INT UNSIGNED,
  informations_complementaires_stade_sexe_stade_sexe_id integer,
  constraint pk_informations_complementaires primary key (informations_complementaires_id))
;

create table membre (
  membre_id                 integer auto_increment not null,
  membre_civilite           varchar(255),
  membre_nom                varchar(255) not null,
  membre_adresse            varchar(255),
  membre_adresse_complement varchar(255),
  membre_code_postal        varchar(255),
  membre_ville              varchar(255),
  membre_pays               varchar(255),
  membre_confidentialite_confidentialite_id integer not null,
  membre_abonne             tinyint(1) default 0 not null,
  membre_temoin_actif       tinyint(1) default 0 not null,
  membre_journais           integer,
  membre_moisnais           integer,
  membre_annenais           integer,
  membre_jourdece           integer,
  membre_moisdece           integer,
  membre_annedece           integer,
  membre_biographie         TEXT,
  membre_email              varchar(255),
  membre_mdp_hash           varchar(255),
  membre_tel                varchar(255),
  membre_droits_droits_id   integer not null,
  membre_inscription_acceptee tinyint(1) default 0 not null,
  membre_lien_de_validation_de_mail varchar(255),
  constraint pk_membre primary key (membre_id))
;

create table membre_has_groupe_de_membres (
  membre_has_groupe_de_membres_id integer auto_increment not null,
  membre_membre_id          integer not null,
  groupe_de_membres_groupe_de_membres_id integer not null,
  constraint pk_membre_has_groupe_de_membres primary key (membre_has_groupe_de_membres_id))
;

create table membre_is_expert_on_groupe (
  membre_is_expert_on_groupe_id integer auto_increment not null,
  membre_membre_id          integer not null,
  groupe_groupe_id          integer not null,
  constraint pk_membre_is_expert_on_groupe primary key (membre_is_expert_on_groupe_id))
;

create table observation (
  observation_id            bigint auto_increment not null,
  observation_espece_espece_id integer not null,
  observation_fiche_fiche_id bigint not null,
  observation_determinateur varchar(255),
  observation_commentaires  TEXT,
  observation_vue_par_expert tinyint(1) default 0 not null,
  observation_validee       TINYINT not null,
  observation_date_derniere_modification datetime not null,
  observation_date_validation datetime,
  constraint pk_observation primary key (observation_id))
;

create table stade_sexe (
  stade_sexe_id             integer auto_increment not null,
  stade_sexe_intitule       varchar(255) not null,
  stade_sexe_explication    TEXT,
  constraint pk_stade_sexe primary key (stade_sexe_id))
;

create table stade_sexe_hierarchie_dans_groupe (
  stade_sexe_hierarchie_dans_groupe_id integer auto_increment not null,
  stade_sexe_stade_sexe_id  integer not null,
  groupe_groupe_id          integer not null,
  stade_sexe_pere_stade_sexe_id integer,
  position                  integer not null,
  constraint pk_stade_sexe_hierarchie_dans_groupe primary key (stade_sexe_hierarchie_dans_groupe_id))
;

create table type_groupement_local (
  type_groupement_local_intitule varchar(255) not null,
  constraint pk_type_groupement_local primary key (type_groupement_local_intitule))
;

create table type_groupement_scientifique (
  intitule                  varchar(255) not null,
  constraint pk_type_groupement_scientifique primary key (intitule))
;

create table utms (
  utm                       VARCHAR(4) not null,
  maille20x20               VARCHAR(4),
  maille50x50               VARCHAR(4),
  maille100x100             VARCHAR(4),
  constraint pk_utms primary key (utm))
;

alter table commune add constraint fk_commune_ville_departement_1 foreign key (ville_departement_departement_code) references departement (departement_code) on delete restrict on update restrict;
create index ix_commune_ville_departement_1 on commune (ville_departement_departement_code);
alter table date_charniere add constraint fk_date_charniere_date_charniere_groupe_2 foreign key (date_charniere_groupe_groupe_id) references groupe (groupe_id) on delete restrict on update restrict;
create index ix_date_charniere_date_charniere_groupe_2 on date_charniere (date_charniere_groupe_groupe_id);
alter table espece add constraint fk_espece_espece_photo_3 foreign key (espece_photo_image_id) references image (image_id) on delete restrict on update restrict;
create index ix_espece_espece_photo_3 on espece (espece_photo_image_id);
alter table espece add constraint fk_espece_espece_groupement_scientifique_pere_4 foreign key (espece_groupement_scientifique_pere_groupement_scientifique_id) references groupement_scientifique (groupement_scientifique_id) on delete restrict on update restrict;
create index ix_espece_espece_groupement_scientifique_pere_4 on espece (espece_groupement_scientifique_pere_groupement_scientifique_id);
alter table espece_is_in_groupement_local add constraint fk_espece_is_in_groupement_local_espece_5 foreign key (espece_espece_id) references espece (espece_id) on delete restrict on update restrict;
create index ix_espece_is_in_groupement_local_espece_5 on espece_is_in_groupement_local (espece_espece_id);
alter table espece_is_in_groupement_local add constraint fk_espece_is_in_groupement_local_groupe_6 foreign key (groupe_groupe_id) references groupe (groupe_id) on delete restrict on update restrict;
create index ix_espece_is_in_groupement_local_groupe_6 on espece_is_in_groupement_local (groupe_groupe_id);
alter table espece_synonyme add constraint fk_espece_synonyme_synonyme_espece_7 foreign key (synonyme_espece_espece_id) references espece (espece_id) on delete restrict on update restrict;
create index ix_espece_synonyme_synonyme_espece_7 on espece_synonyme (synonyme_espece_espece_id);
alter table fiche add constraint fk_fiche_fiche_utm_8 foreign key (fiche_utm_utm) references utms (utm) on delete restrict on update restrict;
create index ix_fiche_fiche_utm_8 on fiche (fiche_utm_utm);
alter table fiche add constraint fk_fiche_fiche_commune_9 foreign key (fiche_commune_ville_id) references commune (ville_id) on delete restrict on update restrict;
create index ix_fiche_fiche_commune_9 on fiche (fiche_commune_ville_id);
alter table fiche_has_membre add constraint fk_fiche_has_membre_membre_10 foreign key (membre_membre_id) references membre (membre_id) on delete restrict on update restrict;
create index ix_fiche_has_membre_membre_10 on fiche_has_membre (membre_membre_id);
alter table fiche_has_membre add constraint fk_fiche_has_membre_fiche_11 foreign key (fiche_fiche_id) references fiche (fiche_id) on delete restrict on update restrict;
create index ix_fiche_has_membre_fiche_11 on fiche_has_membre (fiche_fiche_id);
alter table groupe add constraint fk_groupe_groupe_pere_12 foreign key (groupe_pere_groupe_id) references groupe (groupe_id) on delete restrict on update restrict;
create index ix_groupe_groupe_pere_12 on groupe (groupe_pere_groupe_id);
alter table groupe add constraint fk_groupe_groupe_type_13 foreign key (groupe_type_type_groupement_local_intitule) references type_groupement_local (type_groupement_local_intitule) on delete restrict on update restrict;
create index ix_groupe_groupe_type_13 on groupe (groupe_type_type_groupement_local_intitule);
alter table groupement_scientifique add constraint fk_groupement_scientifique_groupement_scientifique_type_14 foreign key (groupement_scientifique_type_intitule) references type_groupement_scientifique (intitule) on delete restrict on update restrict;
create index ix_groupement_scientifique_groupement_scientifique_type_14 on groupement_scientifique (groupement_scientifique_type_intitule);
alter table groupement_scientifique add constraint fk_groupement_scientifique_groupement_scientifique_pere_15 foreign key (groupement_scientifique_pere_groupement_scientifique_id) references groupement_scientifique (groupement_scientifique_id) on delete restrict on update restrict;
create index ix_groupement_scientifique_groupement_scientifique_pere_15 on groupement_scientifique (groupement_scientifique_pere_groupement_scientifique_id);
alter table groupement_scientifique_is_in_groupement_local add constraint fk_groupement_scientifique_is_in_groupement_local_groupementS_16 foreign key (groupement_scientifique_groupement_scientifique_id) references groupement_scientifique (groupement_scientifique_id) on delete restrict on update restrict;
create index ix_groupement_scientifique_is_in_groupement_local_groupementS_16 on groupement_scientifique_is_in_groupement_local (groupement_scientifique_groupement_scientifique_id);
alter table groupement_scientifique_is_in_groupement_local add constraint fk_groupement_scientifique_is_in_groupement_local_groupe_17 foreign key (groupe_groupe_id) references groupe (groupe_id) on delete restrict on update restrict;
create index ix_groupement_scientifique_is_in_groupement_local_groupe_17 on groupement_scientifique_is_in_groupement_local (groupe_groupe_id);
alter table informations_complementaires add constraint fk_informations_complementaires_informations_complementaires__18 foreign key (informations_complementaires_observation_observation_id) references observation (observation_id) on delete restrict on update restrict;
create index ix_informations_complementaires_informations_complementaires__18 on informations_complementaires (informations_complementaires_observation_observation_id);
alter table informations_complementaires add constraint fk_informations_complementaires_informations_complementaires__19 foreign key (informations_complementaires_stade_sexe_stade_sexe_id) references stade_sexe (stade_sexe_id) on delete restrict on update restrict;
create index ix_informations_complementaires_informations_complementaires__19 on informations_complementaires (informations_complementaires_stade_sexe_stade_sexe_id);
alter table membre add constraint fk_membre_membre_confidentialite_20 foreign key (membre_confidentialite_confidentialite_id) references confidentialite (confidentialite_id) on delete restrict on update restrict;
create index ix_membre_membre_confidentialite_20 on membre (membre_confidentialite_confidentialite_id);
alter table membre add constraint fk_membre_membre_droits_21 foreign key (membre_droits_droits_id) references droits (droits_id) on delete restrict on update restrict;
create index ix_membre_membre_droits_21 on membre (membre_droits_droits_id);
alter table membre_has_groupe_de_membres add constraint fk_membre_has_groupe_de_membres_membre_22 foreign key (membre_membre_id) references membre (membre_id) on delete restrict on update restrict;
create index ix_membre_has_groupe_de_membres_membre_22 on membre_has_groupe_de_membres (membre_membre_id);
alter table membre_has_groupe_de_membres add constraint fk_membre_has_groupe_de_membres_groupe_de_membres_23 foreign key (groupe_de_membres_groupe_de_membres_id) references groupe_de_membres (groupe_de_membres_id) on delete restrict on update restrict;
create index ix_membre_has_groupe_de_membres_groupe_de_membres_23 on membre_has_groupe_de_membres (groupe_de_membres_groupe_de_membres_id);
alter table membre_is_expert_on_groupe add constraint fk_membre_is_expert_on_groupe_membre_24 foreign key (membre_membre_id) references membre (membre_id) on delete restrict on update restrict;
create index ix_membre_is_expert_on_groupe_membre_24 on membre_is_expert_on_groupe (membre_membre_id);
alter table membre_is_expert_on_groupe add constraint fk_membre_is_expert_on_groupe_groupe_25 foreign key (groupe_groupe_id) references groupe (groupe_id) on delete restrict on update restrict;
create index ix_membre_is_expert_on_groupe_groupe_25 on membre_is_expert_on_groupe (groupe_groupe_id);
alter table observation add constraint fk_observation_observation_espece_26 foreign key (observation_espece_espece_id) references espece (espece_id) on delete restrict on update restrict;
create index ix_observation_observation_espece_26 on observation (observation_espece_espece_id);
alter table observation add constraint fk_observation_observation_fiche_27 foreign key (observation_fiche_fiche_id) references fiche (fiche_id) on delete restrict on update restrict;
create index ix_observation_observation_fiche_27 on observation (observation_fiche_fiche_id);
alter table stade_sexe_hierarchie_dans_groupe add constraint fk_stade_sexe_hierarchie_dans_groupe_stade_sexe_28 foreign key (stade_sexe_stade_sexe_id) references stade_sexe (stade_sexe_id) on delete restrict on update restrict;
create index ix_stade_sexe_hierarchie_dans_groupe_stade_sexe_28 on stade_sexe_hierarchie_dans_groupe (stade_sexe_stade_sexe_id);
alter table stade_sexe_hierarchie_dans_groupe add constraint fk_stade_sexe_hierarchie_dans_groupe_groupe_29 foreign key (groupe_groupe_id) references groupe (groupe_id) on delete restrict on update restrict;
create index ix_stade_sexe_hierarchie_dans_groupe_groupe_29 on stade_sexe_hierarchie_dans_groupe (groupe_groupe_id);
alter table stade_sexe_hierarchie_dans_groupe add constraint fk_stade_sexe_hierarchie_dans_groupe_stade_sexe_pere_30 foreign key (stade_sexe_pere_stade_sexe_id) references stade_sexe (stade_sexe_id) on delete restrict on update restrict;
create index ix_stade_sexe_hierarchie_dans_groupe_stade_sexe_pere_30 on stade_sexe_hierarchie_dans_groupe (stade_sexe_pere_stade_sexe_id);



# --- !Downs

SET FOREIGN_KEY_CHECKS=0;

drop table commune;

drop table confidentialite;

drop table date_charniere;

drop table departement;

drop table droits;

drop table espece;

drop table espece_is_in_groupement_local;

drop table espece_synonyme;

drop table fiche;

drop table fiche_has_membre;

drop table groupe;

drop table groupe_de_membres;

drop table groupement_scientifique;

drop table groupement_scientifique_is_in_groupement_local;

drop table image;

drop table informations_complementaires;

drop table membre;

drop table membre_has_groupe_de_membres;

drop table membre_is_expert_on_groupe;

drop table observation;

drop table stade_sexe;

drop table stade_sexe_hierarchie_dans_groupe;

drop table type_groupement_local;

drop table type_groupement_scientifique;

drop table utms;

SET FOREIGN_KEY_CHECKS=1;

