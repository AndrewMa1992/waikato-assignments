--COMP219 Practest1

--ID:1260430
--Name:Bruce Tan

--Answer Q3 Below
drop table observation,species,plantgroup,phenophase,sites,observer

create table observer (
observer_id int NOT NULL,
observer_name varchar(50),
observer_surname varchar(50),
email varchar(100),
phone int,
primary key (observer_id)
)

create table sites(
site_id int NOT NULL,
longitude Decimal(9,6),
latitude Decimal(9,6),
site_name varchar(500),
site_city varchar(50),
site_state varchar(50),
site_comment varchar(100),
primary key (site_id),
)

create table phenophase(
phenophase_id int NOT NULL,
phenophase_name varchar(50),
primary key (phenophase_id),
)

create table plantgroup (
plant_group_id int NOT NULL,
plant_group_description varchar(1000),
primary key (plant_group_id),
)

create table species (
species_id int NOT NULL,
common_name varchar(50),
scientific_name varchar(50),
plant_group_id int NOT NULL,
primary key(species_id),
foreign key(plant_group_id) references plantgroup,
)

create table observation (
observation_id int NOT NULL,
observation_date date,
observation_month int,
observation_year int,
day_of_year int,
species int NOT NULL,
plantgroup int NOT NULL,
phenophase int NOT NULL,
observation_type varchar(50) check (observation_type in ('Single', 'Regular')),
observation_comment varchar(1000),
observation_site int NOT NULL,
observer int NOT NULL,
primary key(observation_id),
foreign key (species) references species,
foreign key (plantgroup) references plantgroup,
foreign key (phenophase) references phenophase,
foreign key (observation_site) references sites,
foreign key (observer) references observer,

)

--Answer Q4 Below
--Row 2, 8000 in excel
insert into observer values (373,'bruce','tan','brucetansh@gmail.com',0211011111);
insert into observer values (20761,'james','bond','james@gmail.com',0223155339);

insert into sites values (10632,40.0361,-105.062,'Erie Test Site',	'Erie','CO',null)
insert into sites values (12736,39.44826,-76.26728,'Anita C. Leight Estuary Center Native Garden Plantings','Abingdon','MD',null)

insert into phenophase values (110,'Leaves Unfolding (None)')
insert into phenophase values (46,'Full Fruiting')

insert into plantgroup values (1,'occ_trees')
insert into plantgroup values (2,'deciduous')

insert into species values (7,'apple','Malus pumila',1)
insert into species values (8459,'Common Elderberry','Sambucus canadensis',2)

insert into observation values (24608,'2014-01-02','1','2014','2',7,1,110,'Single','Happy New Year!',10632,373)
insert into observation values (34709,'2014-07-27','7','2014','27',8459,2,46,'regular',null,12736,20761)

select * from observer
select * from sites
select * from phenophase
select * from plantgroup
select * from species
select * from observation
--Answer Q5 Below

insert into observation values (34709,'2014-07-27','7','2014','27',8459,2,46,'multiple',null,12736,20761)
