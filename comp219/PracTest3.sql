/*create table teams (
tnum int not null,
tname varchar(20),
country char(2),
coach varchar(30),
points int,
captain_id int,
primary key (tnum)
)

create table players (
pnum int not null,
pname varchar(40),
position varchar (20),
team_id int,
primary key (pnum),
foreign key (team_id) references teams,
check (position = 'forwards' or position = 'backs')
)

create table results (
roundnumber int,
gamedate date,
hometeam int not null,
awayteam int not null,
homescore int,
awayscore int,
hometries int,
awaytries int,
gamecity  varchar (20),
primary key (roundnumber, hometeam, awayteam),
foreign key (hometeam) references teams,
foreign key (awayteam) references teams
)*/

GO
insert into teams values (1, 'Blues', 'NZ', 'Sir John Kirwan', 0, 19)
insert into teams values (2, 'Brumbies', 'AU', 'Jake White', 0, 44)
insert into teams values (3, 'Bulls', 'SA', 'Frans Ludeke', 0, 84)
insert into teams values (4, 'Cheetahs', 'SA', 'Naka Drotske', 0, 119)
insert into teams values (5, 'Chiefs', 'NZ', 'Dave Rennie', 0, 160)
insert into teams values (6, 'Crusaders', 'NZ', 'Todd Blackadder', 0, 194)
insert into teams values (7, 'Force', 'AU', 'Michael Foley', 0, 225)
insert into teams values (8, 'Highlanders', 'NZ', ' Jamie Joseph', 0, 288)
insert into teams values (9, 'Hurricanes', 'NZ', 'Mark Hammett', 0, 324)
insert into teams values (10, 'Kings', 'SA', 'Matt Sexton', 0, 351)
insert into teams values (11, 'Rebels', 'AU', 'Damien Hill', 0, 375)
insert into teams values (12, 'Reds', 'AU', 'Ewen McKenzie', 0, 421)
insert into teams values (13, 'Sharks', 'SA', 'John Plumtree', 0, 478)
insert into teams values (14, 'Stormers', 'SA', 'Allister Coetzee', 0, 505)
insert into teams values (15, 'Waratahs', 'AU', 'Michael Cheika', 0, 529)

Go
insert into players values (1, 'Kane Barrett', 'Forwards', 1)
insert into players values (2, 'Anthony Boric', 'Forwards', 1)
insert into players values (3, 'Luke Braid', 'Forwards', 1)
insert into players values (4, 'Charlie Faumuina', 'Forwards', 1)
insert into players values (5, 'Steve Luatua', 'Forwards', 1)
insert into players values (6, 'Quentin MacDonald', 'Forwards', 1)
insert into players values (7, 'Tom McCartney', 'Forwards', 1)
insert into players values (8, 'Keven Mealamu', 'Forwards', 1)
insert into players values (9, 'Liaki Moli', 'Forwards', 1)
insert into players values (10, 'Brendon OConnor', 'Forwards', 1)
insert into players values (11, 'James Parsons', 'Forwards', 1)
insert into players values (12, 'Tim Perry', 'Forwards', 1)
insert into players values (13, 'Sam Prattley', 'Forwards', 1)
insert into players values (14, 'Ronald Raaymakers', 'Forwards', 1)
insert into players values (15, 'Culum Retallick', 'Forwards', 1)
insert into players values (16, 'Peter Saili', 'Forwards', 1)
insert into players values (17, 'Angus Taavao', 'Forwards', 1)
insert into players values (18, 'Ofa Tuungafasi', 'Forwards', 1)
insert into players values (19, 'Ali Williams', 'Forwards', 1)
insert into players values (20, 'Jamison Gibson-Park', 'Backs', 1)
insert into players values (21, 'Frank Halai', 'Backs', 1)
insert into players values (22, 'Bryn Hall', 'Backs', 1)
insert into players values (23, 'Baden Kerr', 'Backs', 1)
insert into players values (24, 'Marty McKenzie', 'Backs', 1)
insert into players values (25, 'George Moala', 'Backs', 1)
insert into players values (26, 'Waisake Naholo', 'Backs', 1)
insert into players values (27, 'Wayne Ngaluafe', 'Backs', 1)
insert into players values (28, 'Albert Nikoro', 'Backs', 1)
insert into players values (29, 'Chris Noakes', 'Backs', 1)
insert into players values (30, 'Charles Piutau', 'Backs', 1)
insert into players values (31, 'Rene Ranger', 'Backs', 1)
insert into players values (32, 'Francis Saili', 'Backs', 1)
insert into players values (33, 'Lolagi Visinia', 'Backs', 1)
insert into players values (34, 'Piri Weepu', 'Backs', 1)
insert into players values (35, 'Jackson Willison', 'Backs', 1)
insert into players values (36, 'Ben Alexander', 'Forwards', 2)
insert into players values (37, 'Fotu Auelua', 'Forwards', 2)
insert into players values (38, 'Sam Carter', 'Forwards', 2)
insert into players values (39, 'Colby Faingaa', 'Forwards', 2)
insert into players values (40, 'Scott Fardy', 'Forwards', 2)
insert into players values (41, 'Peter Kimlin', 'Forwards', 2)
insert into players values (42, 'Joshua Mann-Rea', 'Forwards', 2)
insert into players values (43, 'Stephen Moore', 'Forwards', 2)
insert into players values (44, 'Ben Mowen', 'Forwards', 2)
insert into players values (45, 'Ruaidhri Murphy', 'Forwards', 2)
insert into players values (46, 'Etienne Oosthuizen', 'Forwards', 2)
insert into players values (47, 'Dan Palmer', 'Forwards', 2)
insert into players values (48, 'David Pocock', 'Forwards', 2)
insert into players values (49, 'Leon Power', 'Forwards', 2)
insert into players values (50, 'Siliva Siliva', 'Forwards', 2)
insert into players values (51, 'Scott Sio', 'Forwards', 2)
insert into players values (52, 'Jordan Smiler', 'Forwards', 2)
insert into players values (53, 'George Smith', 'Forwards', 2)
insert into players values (54, 'Ruan Smith', 'Forwards', 2)
insert into players values (55, 'Ita Vaea', 'Forwards', 2)
insert into players values (56, 'Robbie Coleman', 'Backs', 2)
insert into players values (57, 'Zack Holmes', 'Backs', 2)
insert into players values (58, 'Tevita Kuridrani', 'Backs', 2)
insert into players values (59, 'Christian Lealiifano', 'Backs', 2)
insert into players values (60, 'Pat McCabe', 'Backs', 2)
insert into players values (61, 'Jesse Mogg', 'Backs', 2)
insert into players values (62, 'Ian Prior', 'Backs', 2)
insert into players values (63, 'Clyde Rathbone', 'Backs', 2)
insert into players values (64, 'Andrew Smith', 'Backs', 2)
insert into players values (65, 'Henry Speight', 'Backs', 2)
insert into players values (66, 'Mark Swanepoel', 'Backs', 2)
insert into players values (67, 'Joe Tomane', 'Backs', 2)
insert into players values (68, 'Matt Toomua', 'Backs', 2)
insert into players values (69, 'Nic White', 'Backs', 2)
insert into players values (70, 'Tom Cox', 'Backs', 2)
insert into players values (71, 'Arno Botha', 'Forwards', 3)
insert into players values (72, 'Jean Cook', 'Forwards', 3)
insert into players values (73, 'Jacques du Plessis', 'Forwards', 3)
insert into players values (74, 'Dean Greyling', 'Forwards', 3)
insert into players values (75, 'Grant Hattingh', 'Forwards', 3)
insert into players values (76, 'Frik Kirsten', 'Forwards', 3)
insert into players values (77, 'Juandré Kruger', 'Forwards', 3)
insert into players values (78, 'Werner Kruger', 'Forwards', 3)
insert into players values (79, 'Morné Mellett', 'Forwards', 3)
insert into players values (80, 'Dewald Potgieter', 'Forwards', 3)
insert into players values (81, 'Jacques Potgieter', 'Forwards', 3)
insert into players values (82, 'Chiliboy Ralepelle', 'Forwards', 3)
insert into players values (83, 'Jono Ross', 'Forwards', 3)
insert into players values (84, 'Pierre Spies', 'Forwards', 3)
insert into players values (85, 'Wilhelm Steenkamp', 'Forwards', 3)
insert into players values (86, 'Deon Stegmann', 'Forwards', 3)
insert into players values (87, 'Flip van der Merwe', 'Forwards', 3)
insert into players values (88, 'Hencus van Wyk', 'Forwards', 3)
insert into players values (89, 'Callie Visagie', 'Forwards', 3)
insert into players values (90, 'Willie Wepener', 'Forwards', 3)
insert into players values (91, 'Paul Willemse', 'Forwards', 3)
insert into players values (92, 'Cornell Hess', 'Forwards', 3)
insert into players values (93, 'Bjorn Basson', 'Backs', 3)
insert into players values (94, 'Ulrich Beyers', 'Backs', 3)
insert into players values (95, 'JJ Engelbrecht', 'Backs', 3)
insert into players values (96, 'Louis Fouche', 'Backs', 3)
insert into players values (97, 'Francois Hougaard', 'Backs', 3)
insert into players values (98, 'Zane Kirchner', 'Backs', 3)
insert into players values (99, 'Lionel Mapoe', 'Backs', 3)
insert into players values (100, 'Sampie Mastriet', 'Backs', 3)
insert into players values (101, 'Akona Ndungane', 'Backs', 3)
insert into players values (102, 'Wynand Olivier', 'Backs', 3)
insert into players values (103, 'Rudy Paige', 'Backs', 3)
insert into players values (104, 'Jan Serfontein', 'Backs', 3)
insert into players values (105, 'Morné Steyn', 'Backs', 3)
insert into players values (106, 'Francois Venter', 'Backs', 3)
insert into players values (107, 'Jano Vermaak', 'Backs', 3)
insert into players values (108, 'Jürgen Visser', 'Backs', 3)
insert into players values (109, 'Ruan Snyman', 'Backs', 3)
insert into players values (110, 'Lourens Adriaanse', 'Forwards', 4)
insert into players values (111, 'Ryno Barnes', 'Forwards', 4)
insert into players values (112, 'Heinrich Brüssow', 'Forwards', 4)
insert into players values (113, 'Lood de Jager', 'Forwards', 4)
insert into players values (114, 'Lappies Labuschagne', 'Forwards', 4)
insert into players values (115, 'Ligtoring Landman', 'Forwards', 4)
insert into players values (116, 'Trevor Nyakane', 'Forwards', 4)
insert into players values (117, 'Coenie Oosthuizen', 'Forwards', 4)
insert into players values (118, 'Boom Prinsloo', 'Forwards', 4)
insert into players values (119, 'Adriaan Strauss', 'Forwards', 4)
insert into players values (120, 'Francois Uys', 'Forwards', 4)
insert into players values (121, 'Philip van der Walt', 'Forwards', 4)
insert into players values (122, 'Waltie Vermeulen', 'Forwards', 4)
insert into players values (123, 'Frans Viljoen', 'Forwards', 4)
insert into players values (124, 'Rossouw de Klerk', 'Forwards', 4)
insert into players values (125, 'Andries Ferreira', 'Forwards', 4)
insert into players values (126, 'Hercú Liebenberg', 'Forwards', 4)
insert into players values (127, 'Caylib Oosthuizen', 'Forwards', 4)
insert into players values (128, 'Davon Raubenheimer', 'Forwards', 4)
insert into players values (129, 'Rayno Benjamin', 'Backs', 4)
insert into players values (130, 'Francois Brummer', 'Backs', 4)
insert into players values (131, 'Hennie Daniller', 'Backs', 4)
insert into players values (132, 'Tewis de Bruyn', 'Backs', 4)
insert into players values (133, 'Robert Ebersohn', 'Backs', 4)
insert into players values (134, 'Burton Francis', 'Backs', 4)
insert into players values (135, 'Barry Geel', 'Backs', 4)
insert into players values (136, 'Johan Goosen', 'Backs', 4)
insert into players values (137, 'Willie le Roux', 'Backs', 4)
insert into players values (138, 'Howard Mnisi', 'Backs', 4)
insert into players values (139, 'Sarel Pretorius', 'Backs', 4)
insert into players values (140, 'Raymond Rhule', 'Backs', 4)
insert into players values (141, 'Johann Sadie', 'Backs', 4)
insert into players values (142, 'Riaan Smit', 'Backs', 4)
insert into players values (143, 'Piet van Zyl', 'Backs', 4)
insert into players values (144, 'Elgar Watts', 'Backs', 4)
insert into players values (145, 'Hansie Graaff', 'Backs', 4)
insert into players values (146, 'Rocco Jansen', 'Backs', 4)
insert into players values (147, 'Ben Afeaki', 'Forwards', 5)
insert into players values (148, 'Sam Cane', 'Forwards', 5)
insert into players values (149, 'Craig Clarke', 'Forwards', 5)
insert into players values (150, 'Nick Crosswell', 'Forwards', 5)
insert into players values (151, 'Hikawera Elliot', 'Forwards', 5)
insert into players values (152, 'Ross Filipo', 'Forwards', 5)
insert into players values (153, 'Michael Fitzgerald', 'Forwards', 5)
insert into players values (154, 'Romana Graham', 'Forwards', 5)
insert into players values (155, 'Mike Kainga', 'Forwards', 5)
insert into players values (156, 'Tanerau Latimer', 'Forwards', 5)
insert into players values (157, 'Fritz Lee', 'Forwards', 5)
insert into players values (158, 'Pauliasi Manu', 'Forwards', 5)
insert into players values (159, 'Rhys Marshall', 'Forwards', 5)
insert into players values (160, 'Liam Messam', 'Forwards', 5)
insert into players values (161, 'Brodie Retallick', 'Forwards', 5)
insert into players values (162, 'Mahonri Schwalger', 'Forwards', 5)
insert into players values (163, 'Toby Smith', 'Forwards', 5)
insert into players values (164, 'Ben Tameifuna', 'Forwards', 5)
insert into players values (165, 'Matt Vant Leven', 'Forwards', 5)
insert into players values (166, 'Josh Hohneck', 'Forwards', 5)
insert into players values (167, 'Solomona Sakalia', 'Forwards', 5)
insert into players values (168, 'Bundee Aki', 'Backs', 5)
insert into players values (169, 'Gareth Anscombe', 'Backs', 5)
insert into players values (170, 'Aaron Cruden', 'Backs', 5)
insert into players values (171, 'Andrew Horrell', 'Backs', 5)
insert into players values (172, 'Richard Kahui', 'Backs', 5)
insert into players values (173, 'Tawera Kerr-Barlow', 'Backs', 5)
insert into players values (174, 'Brendon Leonard', 'Backs', 5)
insert into players values (175, 'Lelia Masaga', 'Backs', 5)
insert into players values (176, 'Tim Nanai-Williams', 'Backs', 5)
insert into players values (177, 'Charlie Ngatai', 'Backs', 5)
insert into players values (178, 'Patrick Osborne', 'Backs', 5)
insert into players values (179, 'Augustine Pulu', 'Backs', 5)
insert into players values (180, 'Robbie Robinson', 'Backs', 5)
insert into players values (181, 'Asaeli Tikoirotuma', 'Backs', 5)
insert into players values (182, 'Savenaca Tokula', 'Backs', 5)
insert into players values (183, 'Dan Waenga', 'Backs', 5)
insert into players values (184, 'Dominic Bird', 'Forwards', 6)
insert into players values (185, 'Shane Christie', 'Forwards', 6)
insert into players values (186, 'Wyatt Crockett', 'Forwards', 6)
insert into players values (187, 'Tom Donnelly', 'Forwards', 6)
insert into players values (188, 'Corey Flynn', 'Forwards', 6)
insert into players values (189, 'Owen Franks', 'Forwards', 6)
insert into players values (190, 'Ben Funnell', 'Forwards', 6)
insert into players values (191, 'Nepo Laulala', 'Forwards', 6)
insert into players values (192, 'Richie McCaw', 'Forwards', 6)
insert into players values (193, 'Joe Moody', 'Forwards', 6)
insert into players values (194, 'Kieran Read', 'Forwards', 6)
insert into players values (195, 'Luke Romano', 'Forwards', 6)
insert into players values (196, 'Jordan Taufua', 'Forwards', 6)
insert into players values (197, 'Codie Taylor', 'Forwards', 6)
insert into players values (198, 'Matt Todd', 'Forwards', 6)
insert into players values (199, 'Jimmy Tupou', 'Forwards', 6)
insert into players values (200, 'George Whitelock', 'Forwards', 6)
insert into players values (201, 'Luke Whitelock', 'Forwards', 6)
insert into players values (202, 'Sam Whitelock', 'Forwards', 6)
insert into players values (203, 'Tyler Bleyendaal', 'Backs', 6)
insert into players values (204, 'Dan Carter', 'Backs', 6)
insert into players values (205, 'Ryan Crotty', 'Backs', 6)
insert into players values (206, 'Israel Dagg', 'Backs', 6)
insert into players values (207, 'Andy Ellis', 'Backs', 6)
insert into players values (208, 'Robbie Fruean', 'Backs', 6)
insert into players values (209, 'Zac Guildford', 'Backs', 6)
insert into players values (210, 'Willi Heinz', 'Backs', 6)
insert into players values (211, 'Tom Marshall', 'Backs', 6)
insert into players values (212, 'Johnny McNicholl', 'Backs', 6)
insert into players values (213, 'Tom Taylor', 'Backs', 6)
insert into players values (214, 'Telusa Veainu', 'Backs', 6)
insert into players values (215, 'Adam Whitelock', 'Backs', 6)
insert into players values (216, 'Jeremy Sua', 'Backs', 6)
insert into players values (217, 'Chris Alcock', 'Forwards', 7)
insert into players values (218, 'Phoenix Battye', 'Forwards', 7)
insert into players values (219, 'Richard Brown', 'Forwards', 7)
insert into players values (220, 'Nathan Charles', 'Forwards', 7)
insert into players values (221, 'Angus Cottrell', 'Forwards', 7)
insert into players values (222, 'Pekahou Cowan', 'Forwards', 7)
insert into players values (223, 'Tetera Faulkner', 'Forwards', 7)
insert into players values (224, 'James Hilterbrand', 'Forwards', 7)
insert into players values (225, 'Matt Hodgson', 'Forwards', 7)
insert into players values (226, 'Kieran Longbottom', 'Forwards', 7)
insert into players values (227, 'Toby Lynn', 'Forwards', 7)
insert into players values (228, 'Salesi Maafu', 'Forwards', 7)
insert into players values (229, 'Salesi Manu', 'Forwards', 7)
insert into players values (230, 'Ben McCalman', 'Forwards', 7)
insert into players values (231, 'Hugh McMeniman', 'Forwards', 7)
insert into players values (232, 'Heath Tessmann', 'Forwards', 7)
insert into players values (233, 'Rory Walton', 'Forwards', 7)
insert into players values (234, 'Ben Whittaker', 'Forwards', 7)
insert into players values (235, 'Sam Wykes', 'Forwards', 7)
insert into players values (236, 'Lachlan McCaffrey', 'Forwards', 7)
insert into players values (237, 'Sam Christie', 'Backs', 7)
insert into players values (238, 'Nick Cummins', 'Backs', 7)
insert into players values (239, 'Patrick Dellit', 'Backs', 7)
insert into players values (240, 'Sias Ebersohn', 'Backs', 7)
insert into players values (241, 'Kyle Godwin', 'Backs', 7)
insert into players values (242, 'Jayden Hayward', 'Backs', 7)
insert into players values (243, 'Ben Jacobs', 'Backs', 7)
insert into players values (244, 'Alfie Mafi', 'Backs', 7)
insert into players values (245, 'Alby Mathewson', 'Backs', 7)
insert into players values (246, 'Sam Norton-Knight', 'Backs', 7)
insert into players values (247, 'Junior Rasolea', 'Backs', 7)
insert into players values (248, 'Brett Sheehan', 'Backs', 7)
insert into players values (249, 'Michael Snowden', 'Backs', 7)
insert into players values (250, 'Winston Stanley', 'Backs', 7)
insert into players values (251, 'Ed Stubbs', 'Backs', 7)
insert into players values (252, 'Will Tupou', 'Backs', 7)
insert into players values (253, 'Chris Eaton', 'Backs', 7)
insert into players values (254, 'Chris Tuatara-Morrison', 'Backs', 7)
insert into players values (255, 'Josh Bekhuis', 'Forwards', 8)
insert into players values (256, 'Tim Boys', 'Forwards', 8)
insert into players values (257, 'Liam Coltman', 'Forwards', 8)
insert into players values (258, 'Elliot Dixon', 'Forwards', 8)
insert into players values (259, 'Maafu Fia', 'Forwards', 8)
insert into players values (260, 'John Hardie', 'Forwards', 8)
insert into players values (261, 'Jarrad Hoeata', 'Forwards', 8)
insert into players values (262, 'Andrew Hore', 'Forwards', 8)
insert into players values (263, 'TJ Ioane', 'Forwards', 8)
insert into players values (264, 'Chris King', 'Forwards', 8)
insert into players values (265, 'Jamie Mackintosh', 'Forwards', 8)
insert into players values (266, 'Nasi Manu', 'Forwards', 8)
insert into players values (267, 'Brayden Mitchell', 'Forwards', 8)
insert into players values (268, 'Bronson Murray', 'Forwards', 8)
insert into players values (269, 'Jake Paringatai', 'Forwards', 8)
insert into players values (270, 'Jason Rutledge', 'Forwards', 8)
insert into players values (271, 'Brad Thorn', 'Forwards', 8)
insert into players values (272, 'Mose Tuialii', 'Forwards', 8)
insert into players values (273, 'Joe Wheeler', 'Forwards', 8)
insert into players values (274, 'Tony Woodcock', 'Forwards', 8)
insert into players values (275, 'Phil Burleigh', 'Backs', 8)
insert into players values (276, 'Tamati Ellison', 'Backs', 8)
insert into players values (277, 'Jason Emery', 'Backs', 8)
insert into players values (278, 'Tony Ensor', 'Backs', 8)
insert into players values (279, 'Hosea Gear', 'Backs', 8)
insert into players values (280, 'Maritino Nemani', 'Backs', 8)
insert into players values (281, 'Maa Nonu', 'Backs', 8)
insert into players values (282, 'Hayden Parker', 'Backs', 8)
insert into players values (283, 'Kade Poki', 'Backs', 8)
insert into players values (284, 'Buxton Popoalii', 'Backs', 8)
insert into players values (285, 'Trent Renata', 'Backs', 8)
insert into players values (286, 'Colin Slade', 'Backs', 8)
insert into players values (287, 'Aaron Smith', 'Backs', 8)
insert into players values (288, 'Ben Smith', 'Backs', 8)
insert into players values (289, 'Lima Sopoaga', 'Backs', 8)
insert into players values (290, 'Fumiaki Tanaka', 'Backs', 8)
insert into players values (291, 'Shaun Treeby', 'Backs', 8)
insert into players values (292, 'Frae Wilson', 'Backs', 8)
insert into players values (293, 'Declan ODonnell', 'Backs', 8)
insert into players values (294, 'James Broadhurst', 'Forwards', 9)
insert into players values (295, 'Dane Coles', 'Forwards', 9)
insert into players values (296, 'Ash Dixon', 'Forwards', 9)
insert into players values (297, 'Jason Eaton', 'Forwards', 9)
insert into players values (298, 'Ben Franks', 'Forwards', 9)
insert into players values (299, 'Reggie Goodes', 'Forwards', 9)
insert into players values (300, 'Jack Lam', 'Forwards', 9)
insert into players values (301, 'Faifili Levave', 'Forwards', 9)
insert into players values (302, 'Karl Lowe', 'Forwards', 9)
insert into players values (303, 'Motu Matuu', 'Forwards', 9)
insert into players values (304, 'Ben May', 'Forwards', 9)
insert into players values (305, 'Mark Reddish', 'Forwards', 9)
insert into players values (306, 'Ardie Savea', 'Forwards', 9)
insert into players values (307, 'John Schwalger', 'Forwards', 9)
insert into players values (308, 'Brad Shields', 'Forwards', 9)
insert into players values (309, 'Blade Thomson', 'Forwards', 9)
insert into players values (310, 'Jeremy Thrush', 'Forwards', 9)
insert into players values (311, 'Jeffery Toomaga-Allen', 'Forwards', 9)
insert into players values (312, 'Victor Vito', 'Forwards', 9)
insert into players values (313, 'Eric Sione', 'Forwards', 9)
insert into players values (314, 'Beauden Barrett', 'Backs', 9)
insert into players values (315, 'Tim Bateman', 'Backs', 9)
insert into players values (316, 'Rey Lee-Lo', 'Backs', 9)
insert into players values (317, 'Alapati Leiua', 'Backs', 9)
insert into players values (318, 'James Marshall', 'Backs', 9)
insert into players values (319, 'Ope Peleseuma', 'Backs', 9)
insert into players values (320, 'TJ Perenara', 'Backs', 9)
insert into players values (321, 'Tusi Pisi', 'Backs', 9)
insert into players values (322, 'Matt Proctor', 'Backs', 9)
insert into players values (323, 'Julian Savea', 'Backs', 9)
insert into players values (324, 'Conrad Smith', 'Backs', 9)
insert into players values (325, 'Chris Smylie', 'Backs', 9)
insert into players values (326, 'Andre Taylor', 'Backs', 9)
insert into players values (327, 'Samisoni Fisilau', 'Backs', 9)
insert into players values (328, 'Cory Jane', 'Backs', 9)
insert into players values (329, 'Daniel Adongo', 'Forwards', 10)
insert into players values (330, 'Rynier Bernardo', 'Forwards', 10)
insert into players values (331, 'David Bulbring', 'Forwards', 10)
insert into players values (332, 'Kevin Buys', 'Forwards', 10)
insert into players values (333, 'Aidon Davis', 'Forwards', 10)
insert into players values (334, 'Charl du Plessis', 'Forwards', 10)
insert into players values (335, 'Cornell du Preez', 'Forwards', 10)
insert into players values (336, 'Jacques Engelbrecht', 'Forwards', 10)
insert into players values (337, 'Jaco Engels', 'Forwards', 10)
insert into players values (338, 'Schalk Ferreira', 'Forwards', 10)
insert into players values (339, 'Hannes Franklin', 'Forwards', 10)
insert into players values (340, 'Grant Kemp', 'Forwards', 10)
insert into players values (341, 'Virgile Lacombe', 'Forwards', 10)
insert into players values (342, 'Tomás Leonardi', 'Forwards', 10)
insert into players values (343, 'Bandise Maku', 'Forwards', 10)
insert into players values (344, 'Thabo Mamojele', 'Forwards', 10)
insert into players values (345, 'Edgar Marutlulle', 'Forwards', 10)
insert into players values (346, 'Mpho Mbiyozo', 'Forwards', 10)
insert into players values (347, 'Darron Nell', 'Forwards', 10)
insert into players values (348, 'Devin Oosthuizen', 'Forwards', 10)
insert into players values (349, 'Steven Sykes', 'Forwards', 10)
insert into players values (350, 'Wimpie van der Walt', 'Forwards', 10)
insert into players values (351, 'Luke Watson', 'Forwards', 10)
insert into players values (352, 'Demetri Catrakilis', 'Backs', 10)
insert into players values (353, 'Ronnie Cooke', 'Backs', 10)
insert into players values (354, 'Shane Gates', 'Backs', 10)
insert into players values (355, 'Siyanda Grey', 'Backs', 10)
insert into players values (356, 'Johan Herbst', 'Backs', 10)
insert into players values (357, 'Michael Killian', 'Backs', 10)
insert into players values (358, 'SP Marais', 'Backs', 10)
insert into players values (359, 'Waylon Murray', 'Backs', 10)
insert into players values (360, 'Hadleigh Parkes', 'Backs', 10)
insert into players values (361, 'Sergeal Petersen', 'Backs', 10)
insert into players values (362, 'Marcello Sampson', 'Backs', 10)
insert into players values (363, 'Shakes Soyizwapi', 'Backs', 10)
insert into players values (364, 'Andries Strauss', 'Backs', 10)
insert into players values (365, 'Scott van Breda', 'Backs', 10)
insert into players values (366, 'Elric van Vuuren', 'Backs', 10)
insert into players values (367, 'Shaun Venter', 'Backs', 10)
insert into players values (368, 'Nicolás Vergallo', 'Backs', 10)
insert into players values (369, 'George Whitehead', 'Backs', 10)
insert into players values (370, 'Paul Alo-Emile', 'Forwards', 11)
insert into players values (371, 'Tim Davidson', 'Forwards', 11)
insert into players values (372, 'Gareth Delve', 'Forwards', 11)
insert into players values (373, 'Scott Fuglistaller', 'Forwards', 11)
insert into players values (374, 'Nic Henderson', 'Forwards', 11)
insert into players values (375, 'Scott Higginbotham', 'Forwards', 11)
insert into players values (376, 'Shota Horie', 'Forwards', 11)
insert into players values (377, 'Luke Jones', 'Forwards', 11)
insert into players values (378, 'James King', 'Forwards', 11)
insert into players values (379, 'Patrick Leafa', 'Forwards', 11)
insert into players values (380, 'Cadeyrn Neville', 'Forwards', 11)
insert into players values (381, 'Hugh Pyle', 'Forwards', 11)
insert into players values (382, 'Jordy Reid', 'Forwards', 11)
insert into players values (383, 'Ged Robinson', 'Forwards', 11)
insert into players values (384, 'Jarrod Saffy', 'Forwards', 11)
insert into players values (385, 'Laurie Weeks', 'Forwards', 11)
insert into players values (386, 'Eddie Aholelei', 'Forwards', 11)
insert into players values (387, 'Chris Thomson', 'Forwards', 11)
insert into players values (388, 'Kurtley Beale', 'Backs', 11)
insert into players values (389, 'Luke Burgess', 'Backs', 11)
insert into players values (390, 'Tom English', 'Backs', 11)
insert into players values (391, 'Bryce Hegarty', 'Backs', 11)
insert into players values (392, 'James Hilgendorf', 'Backs', 11)
insert into players values (393, 'Mitch Inman', 'Backs', 11)
insert into players values (394, 'Richard Kingi', 'Backs', 11)
insert into players values (395, 'Lachlan Mitchell', 'Backs', 11)
insert into players values (396, 'James OConnor', 'Backs', 11)
insert into players values (397, 'Nick Phipps', 'Backs', 11)
insert into players values (398, 'Angus Roberts', 'Backs', 11)
insert into players values (399, 'Alex Rokobaro', 'Backs', 11)
insert into players values (400, 'Rory Sidey', 'Backs', 11)
insert into players values (401, 'Kimami Sitauti', 'Backs', 11)
insert into players values (402, 'Nic Stirzaker', 'Backs', 11)
insert into players values (403, 'Cooper Vuna', 'Backs', 11)
insert into players values (404, 'Jason Woodward', 'Backs', 11)
insert into players values (405, 'Albert Anae', 'Forwards', 12)
insert into players values (406, 'Curtis Browning', 'Forwards', 12)
insert into players values (407, 'Jarrad Butler', 'Forwards', 12)
insert into players values (408, 'Ben Daley', 'Forwards', 12)
insert into players values (409, 'Saia Faingaa', 'Forwards', 12)
insert into players values (410, 'Liam Gill', 'Forwards', 12)
insert into players values (411, 'James Hanson', 'Forwards', 12)
insert into players values (412, 'Greg Holmes', 'Forwards', 12)
insert into players values (413, 'James Horwill', 'Forwards', 12)
insert into players values (414, 'Ed ODonoghue', 'Forwards', 12)
insert into players values (415, 'Jono Owen', 'Forwards', 12)
insert into players values (416, 'Eddie Quirk', 'Forwards', 12)
insert into players values (417, 'Beau Robinson', 'Forwards', 12)
insert into players values (418, 'Radike Samo', 'Forwards', 12)
insert into players values (419, 'Jake Schatz', 'Forwards', 12)
insert into players values (420, 'Rob Simmons', 'Forwards', 12)
insert into players values (421, 'James Slipper', 'Forwards', 12)
insert into players values (422, 'Adam Wallace-Harrison', 'Forwards', 12)
insert into players values (423, 'Nigel Ah Wong', 'Forwards', 12)
insert into players values (424, 'David McDuling', 'Forwards', 12)
insert into players values (425, 'Quade Cooper', 'Backs', 12)
insert into players values (426, 'Rod Davies', 'Backs', 12)
insert into players values (427, 'Anthony Faingaa', 'Backs', 12)
insert into players values (428, 'Chris Feauai-Sautia', 'Backs', 12)
insert into players values (429, 'Nick Frisby', 'Backs', 12)
insert into players values (430, 'Will Genia', 'Backs', 12)
insert into players values (431, 'Mike Harris', 'Backs', 12)
insert into players values (432, 'Digby Ioane', 'Backs', 12)
insert into players values (433, 'Jono Lance', 'Backs', 12)
insert into players values (434, 'Ben Lucas', 'Backs', 12)
insert into players values (435, 'Luke Morahan', 'Backs', 12)
insert into players values (436, 'Dom Shipperley', 'Backs', 12)
insert into players values (437, 'Ben Tapuai', 'Backs', 12)
insert into players values (438, 'Aidan Toua', 'Backs', 12)
insert into players values (439, 'Willem Alberts', 'Forwards', 13)
insert into players values (440, 'Jacques Botes', 'Forwards', 13)
insert into players values (441, 'Anton Bresler', 'Forwards', 13)
insert into players values (442, 'Craig Burden', 'Forwards', 13)
insert into players values (443, 'Marcell Coetzee', 'Forwards', 13)
insert into players values (444, 'Kyle Cooper', 'Forwards', 13)
insert into players values (445, 'Keegan Daniel', 'Forwards', 13)
insert into players values (446, 'Jean Deysel', 'Forwards', 13)
insert into players values (447, 'Bismarck du Plessis', 'Forwards', 13)
insert into players values (448, 'Jannie du Plessis', 'Forwards', 13)
insert into players values (449, 'Pieter-Steph du Toit', 'Forwards', 13)
insert into players values (450, 'Wiehahn Herbst', 'Forwards', 13)
insert into players values (451, 'Edwin Hewitt', 'Forwards', 13)
insert into players values (452, 'JC Janse van Rensburg', 'Forwards', 13)
insert into players values (453, 'Ryan Kankowski', 'Forwards', 13)
insert into players values (454, 'Jandré Marais', 'Forwards', 13)
insert into players values (455, 'Danie Mienie', 'Forwards', 13)
insert into players values (456, 'Derick Minnie', 'Forwards', 13)
insert into players values (457, 'Tendai Mtawarira', 'Forwards', 13)
insert into players values (458, 'Tera Mtembu', 'Forwards', 13)
insert into players values (459, 'Franco van der Merwe', 'Forwards', 13)
insert into players values (460, 'Dale Chadwick', 'Forwards', 13)
insert into players values (461, 'Allan Dell', 'Forwards', 13)
insert into players values (462, 'Monde Hadebe', 'Forwards', 13)
insert into players values (463, 'Peet Marais', 'Forwards', 13)
insert into players values (464, 'Meyer Bosman', 'Backs', 13)
insert into players values (465, 'Andries Coetzee', 'Backs', 13)
insert into players values (466, 'Butch James', 'Backs', 13)
insert into players values (467, 'Paul Jordaan', 'Backs', 13)
insert into players values (468, 'Patrick Lambie', 'Backs', 13)
insert into players values (469, 'Piet Lindeque', 'Backs', 13)
insert into players values (470, 'Louis Ludik', 'Backs', 13)
insert into players values (471, 'Charl McLeod', 'Backs', 13)
insert into players values (472, 'Lwazi Mvovo', 'Backs', 13)
insert into players values (473, 'Odwa Ndungane', 'Backs', 13)
insert into players values (474, 'JP Pietersen', 'Backs', 13)
insert into players values (475, 'Cobus Reinach', 'Backs', 13)
insert into players values (476, 'Sean Robinson', 'Backs', 13)
insert into players values (477, 'S bura Sithole', 'Backs', 13)
insert into players values (478, 'François Steyn', 'Backs', 13)
insert into players values (479, 'Jaco van Tonder', 'Backs', 13)
insert into players values (480, 'Riaan Viljoen', 'Backs', 13)
insert into players values (481, 'Fred Zeilinga', 'Backs', 13)
insert into players values (482, 'Tian Meyer', 'Backs', 13)
insert into players values (483, 'Tim Whitehead', 'Backs', 13)
insert into players values (484, 'Don Armand', 'Forwards', 14)
insert into players values (485, 'Andries Bekker', 'Forwards', 14)
insert into players values (486, 'Martin Bezuidenhout', 'Forwards', 14)
insert into players values (487, 'Nizaam Carr', 'Forwards', 14)
insert into players values (488, 'Patric Cilliers', 'Forwards', 14)
insert into players values (489, 'Marius Coetzer', 'Forwards', 14)
insert into players values (490, 'Rynhardt Elstadt', 'Forwards', 14)
insert into players values (491, 'Eben Etzebeth', 'Forwards', 14)
insert into players values (492, 'Deon Fourie', 'Forwards', 14)
insert into players values (493, 'Gerbrandt Grobler', 'Forwards', 14)
insert into players values (494, 'Brok Harris', 'Forwards', 14)
insert into players values (495, 'Rohan Kitshoff', 'Forwards', 14)
insert into players values (496, 'Steven Kitshoff', 'Forwards', 14)
insert into players values (497, 'Siya Kolisi', 'Forwards', 14)
insert into players values (498, 'Tiaan Liebenberg', 'Forwards', 14)
insert into players values (499, 'Frans Malherbe', 'Forwards', 14)
insert into players values (500, 'Scarra Ntubeni', 'Forwards', 14)
insert into players values (501, 'Michael Rhodes', 'Forwards', 14)
insert into players values (502, 'De Kock Steenkamp', 'Forwards', 14)
insert into players values (503, 'Duane Vermeulen', 'Forwards', 14)
insert into players values (504, 'Ruan Botha', 'Forwards', 14)
insert into players values (505, 'Schalk Burger', 'Forwards', 14)
insert into players values (506, 'Deon Carstens', 'Forwards', 14)
insert into players values (507, 'Ross Geldenhuys', 'Forwards', 14)
insert into players values (508, 'Chris Heiberg', 'Forwards', 14)
insert into players values (509, 'Gio Aplon', 'Backs', 14)
insert into players values (510, 'Kurt Coleman', 'Backs', 14)
insert into players values (511, 'Damian de Allende', 'Backs', 14)
insert into players values (512, 'Juan de Jongh', 'Backs', 14)
insert into players values (513, 'Jean de Villiers', 'Backs', 14)
insert into players values (514, 'Dewaldt Duvenage', 'Backs', 14)
insert into players values (515, 'Peter Grant', 'Backs', 14)
insert into players values (516, 'Nic Groom', 'Backs', 14)
insert into players values (517, 'Bryan Habana', 'Backs', 14)
insert into players values (518, 'Elton Jantjies', 'Backs', 14)
insert into players values (519, 'Joe Pietersen', 'Backs', 14)
insert into players values (520, 'Louis Schreuder', 'Backs', 14)
insert into players values (521, 'Jaco Taute', 'Backs', 14)
insert into players values (522, 'Gary van Aswegen', 'Backs', 14)
insert into players values (523, 'Gerhard van den Heever', 'Backs', 14)
insert into players values (524, 'Cheslin Kolbe', 'Backs', 14)
insert into players values (525, 'Richard Aho', 'Forwards', 15)
insert into players values (526, 'Ollie Atkins', 'Forwards', 15)
insert into players values (527, 'Mitchell Chapman', 'Forwards', 15)
insert into players values (528, 'Adam Coleman', 'Forwards', 15)
insert into players values (529, 'Dave Dennis', 'Forwards', 15)
insert into players values (530, 'Kane Douglas', 'Forwards', 15)
insert into players values (531, 'AJ Gilbert', 'Forwards', 15)
insert into players values (532, 'Jed Holloway', 'Forwards', 15)
insert into players values (533, 'Luke Holmes', 'Forwards', 15)
insert into players values (534, 'Michael Hooper', 'Forwards', 15)
insert into players values (535, 'Sekope Kepu', 'Forwards', 15)
insert into players values (536, 'Pat McCutcheon', 'Forwards', 15)
insert into players values (537, 'Wycliff Palu', 'Forwards', 15)
insert into players values (538, 'Greg Peterson', 'Forwards', 15)
insert into players values (539, 'Tatafu Polota-Nau', 'Forwards', 15)
insert into players values (540, 'Benn Robinson', 'Forwards', 15)
insert into players values (541, 'Paddy Ryan', 'Forwards', 15)
insert into players values (542, 'Will Skelton', 'Forwards', 15)
insert into players values (543, 'Jeremy Tilse', 'Forwards', 15)
insert into players values (544, 'Lopeti Timani', 'Forwards', 15)
insert into players values (545, 'Sitaleki Timani', 'Forwards', 15)
insert into players values (546, 'John Ulugia', 'Forwards', 15)
insert into players values (547, 'Liam Winton', 'Forwards', 15)
insert into players values (548, 'Damien Fitzpatrick', 'Forwards', 15)
insert into players values (549, 'Adam Ashley-Cooper', 'Backs', 15)
insert into players values (550, 'Berrick Barnes', 'Backs', 15)
insert into players values (551, 'Peter Betham', 'Backs', 15)
insert into players values (552, 'Tom Carter', 'Backs', 15)
insert into players values (553, 'Cam Crawford', 'Backs', 15)
insert into players values (554, 'Israel Folau', 'Backs', 15)
insert into players values (555, 'Bernard Foley', 'Backs', 15)
insert into players values (556, 'Terrence Hepetema', 'Backs', 15)
insert into players values (557, 'Rob Horne', 'Backs', 15)
insert into players values (558, 'Tom 10ton', 'Backs', 15)
insert into players values (559, 'Matt Lucas', 'Backs', 15)
insert into players values (560, 'Brendan McKibbin', 'Backs', 15)
insert into players values (561, 'Drew Mitchell', 'Backs', 15)
insert into players values (562, 'Lachlan Turner', 'Backs', 15)
insert into players values (563, 'Ben Volavola', 'Backs', 15)
insert into players values (564, 'Grayson Hart', 'Backs', 15)
insert into players values (565, 'Michael Hodge', 'Backs', 15)
Go
insert into results values (1,'2013-02-16',2,12,24,6,2,0,'Canberra')
insert into results values (1,'2013-02-15',11,7,30,23,3,3,'Melbourne')
insert into results values (2,'2013-02-23',4,13,22,29,3,2,'Bloemfontein')
insert into results values (2,'2013-02-23',10,7,22,10,2,2,'Port Elizabeth')
insert into results values (2,'2013-02-23',12,15,25,17,3,2,'Brisbane')
insert into results values (2,'2013-02-23',9,1,20,34,2,4,'Wellington')
insert into results values (2,'2013-02-22',3,14,25,17,1,2,'Pretoria')
insert into results values (2,'2013-02-22',11,2,13,30,1,4,'Melbourne')
insert into results values (2,'2013-02-22',8,5,27,41,3,4,'Dunedin')
insert into results values (3,'2013-03-02',3,7,36,26,4,2,'Pretoria')
insert into results values (3,'2013-03-02',5,4,45,3,6,0,'Hamilton')
insert into results values (3,'2013-03-01',12,9,18,12,2,0,'Brisbane')
insert into results values (3,'2013-03-01',15,11,31,26,3,2,'Sydney')
insert into results values (3,'2013-03-01',1,6,34,15,5,0,'Auckland')
insert into results values (3,'2013-03-02',13,14,12,6,0,0,'Durban')
insert into results values (4,'2013-03-10',1,3,21,28,2,3,'Auckland')
insert into results values (4,'2013-03-09',10,13,12,21,0,0,'Port Elizabeth')
insert into results values (4,'2013-03-09',14,5,36,34,3,4,'Cape Town')
insert into results values (4,'2013-03-09',2,15,35,6,4,0,'Canberra')
insert into results values (4,'2013-03-09',8,4,19,36,3,3,'Invercargill')
insert into results values (4,'2013-03-08',11,12,13,23,1,2,'Melbourne')
insert into results values (4,'2013-03-08',9,6,29,28,2,4,'Wellington')
insert into results values (5,'2013-03-16',13,2,10,29,1,4,'Durban')
insert into results values (5,'2013-03-15',15,4,26,27,2,3,'Sydney')
insert into results values (5,'2013-03-16',12,7,12,19,0,1,'Brisbane')
insert into results values (5,'2013-03-16',6,3,41,19,6,1,'Christchurch')
insert into results values (5,'2013-03-15',10,5,24,35,2,4,'Port Elizabeth')
insert into results values (5,'2013-03-15',8,9,19,23,1,3,'Dunedin')
insert into results values (6,'2013-03-24',15,1,30,27,3,3,'Sydney')
insert into results values (6,'2013-03-23',14,2,35,22,4,1,'Cape Town')
insert into results values (6,'2013-03-23',13,11,64,7,10,1,'Durban')
insert into results values (6,'2013-03-23',7,4,10,19,1,1,'Perth')
insert into results values (6,'2013-03-23',12,3,23,18,2,0,'Brisbane')
insert into results values (6,'2013-03-23',6,10,55,20,7,2,'Christchurch')
insert into results values (6,'2013-03-22',5,8,19,7,1,1,'Hamilton')
insert into results values (7,'2013-03-31',15,7,23,19,1,1,'Sydney')
insert into results values (7,'2013-03-30',14,6,14,19,1,1,'Cape Town')
insert into results values (7,'2013-03-30',4,11,34,16,5,1,'Bloemfontein')
insert into results values (7,'2013-03-30',2,3,23,20,1,2,'Canberra')
insert into results values (7,'2013-03-30',5,1,23,16,2,1,'Mount Maunganui')
insert into results values (7,'2013-03-30',9,10,46,30,6,3,'Wellington')
insert into results values (7,'2013-03-29',8,12,33,34,3,4,'Dunedin')
insert into results values (8,'2013-04-06',4,14,26,24,2,2,'Bloemfontein')
insert into results values (8,'2013-04-06',7,11,23,30,3,4,'Perth')
insert into results values (8,'2013-04-06',9,15,41,29,4,3,'Wellington')
insert into results values (8,'2013-04-05',13,6,21,17,0,1,'Durban')
insert into results values (8,'2013-04-05',2,10,28,28,2,4,'Canberra')
insert into results values (8,'2013-04-05',1,8,29,18,4,2,'Auckland')
insert into results values (9,'2013-04-13',3,4,26,20,2,1,'Pretoria')
insert into results values (9,'2013-04-13',14,13,22,15,1,0,'Cape Town')
insert into results values (9,'2013-04-13',7,6,16,14,1,1,'Perth')
insert into results values (9,'2013-04-13',11,10,27,30,3,3,'Melbourne')
insert into results values (9,'2013-04-13',1,9,28,6,4,0,'Auckland')
insert into results values (9,'2013-04-13',5,12,23,31,2,4,'Hamilton')
insert into results values (9,'2013-04-12',8,2,19,30,1,3,'Dunedin')
insert into results values (10,'2013-04-20',10,3,0,34,0,4,'Port Elizabeth')
insert into results values (10,'2013-04-20',13,4,6,12,0,2,'Durban')
insert into results values (10,'2013-04-20',12,2,19,19,3,1,'Brisbane')
insert into results values (10,'2013-04-20',6,8,24,8,2,1,'Christchurch')
insert into results values (10,'2013-04-19',15,5,25,20,3,2,'Sydney')
insert into results values (10,'2013-04-19',9,7,22,16,3,1,'Wellington')
insert into results values (11,'2013-04-26',9,14,16,18,2,2,'Palmerston North')
insert into results values (11,'2013-04-26',12,1,12,11,0,1,'Brisbane')
insert into results values (11,'2013-04-27',5,13,37,29,4,4,'Hamilton')
insert into results values (11,'2013-04-27',2,7,41,7,6,1,'Canberra')
insert into results values (11,'2013-04-27',3,15,30,19,2,3,'Pretoria')
insert into results values (11,'2013-04-27',4,10,26,12,3,0,'Bloemfontein')
insert into results values (11,'2013-04-28',6,11,30,26,2,3,'Christchurch')
insert into results values (12,'2013-05-05',2,6,23,30,2,3,'Canberra')
insert into results values (12,'2013-05-04',3,9,48,14,6,2,'Pretoria')
insert into results values (12,'2013-05-04',10,15,10,72,1,11,'Port Elizabeth')
insert into results values (12,'2013-05-04',7,12,11,11,1,1,'Perth')
insert into results values (12,'2013-05-04',8,13,25,22,3,3,'Dunedin')
insert into results values (12,'2013-05-03',11,5,33,39,5,6,'Melbourne')
insert into results values (12,'2013-05-03',1,14,18,17,0,2,'Albany')
insert into results values (13,'2013-05-11',10,8,34,27,4,4,'Port Elizabeth')
insert into results values (13,'2013-05-11',15,14,21,15,2,0,'Sydney')
insert into results values (13,'2013-05-11',1,11,36,32,6,5,'Auckland')
insert into results values (13,'2013-05-10',4,9,34,39,3,4,'Bloemfontein')
insert into results values (13,'2013-05-10',12,13,32,17,4,2,'Brisbane')
insert into results values (13,'2013-05-10',5,7,22,21,1,2,'Pukekohe')
insert into results values (14,'2013-05-18',4,12,27,13,2,1,'Bloemfontein')
insert into results values (14,'2013-05-18',3,8,35,18,4,2,'Pretoria')
insert into results values (14,'2013-05-18',15,2,28,22,3,2,'Sydney')
insert into results values (14,'2013-05-18',6,1,23,3,2,0,'Christchurch')
insert into results values (14,'2013-05-17',7,13,13,23,1,2,'Perth')
insert into results values (14,'2013-05-17',11,14,30,21,3,3,'Melbourne')
insert into results values (14,'2013-05-17',9,5,12,17,0,1,'Wellington')
insert into results values (15,'2013-05-25',13,3,16,18,1,0,'Durban')
insert into results values (15,'2013-05-25',14,12,20,15,1,0,'Cape Town')
insert into results values (15,'2013-05-25',10,4,22,34,1,4,'Port Elizabeth')
insert into results values (15,'2013-05-25',7,8,19,18,1,0,'Perth')
insert into results values (15,'2013-05-25',1,2,13,20,1,1,'Auckland')
insert into results values (15,'2013-05-24',5,6,28,19,3,1,'Hamilton')
insert into results values (15,'2013-05-24',11,15,24,22,2,1,'Melbourne')
insert into results values (16,'2013-05-31',6,15,23,22,2,3,'Christchurch')
insert into results values (16,'2013-05-31',2,9,30,23,2,2,'Canberra')
insert into results values (16,'2013-06-01',8,1,38,28,4,4,'Dunedin')
insert into results values (16,'2013-06-01',12,11,33,20,4,2,'Brisbane')
insert into results values (16,'2013-06-01',14,10,19,11,1,1,'Cape Town')
insert into results values (16,'2013-06-01',4,3,25,30,3,3,'Bloemfontein')
insert into results values (17,'2013-06-07',2,11,39,17,6,2,'Canberra')
insert into results values (17,'2013-06-09',7,15,13,28,2,3,'Perth')
insert into results values (18,'2013-06-28',5,9,34,22,4,3,'Hamilton')
insert into results values (18,'2013-06-29',8,6,12,40,2,4,'Dunedin')
insert into results values (18,'2013-06-29',13,1,22,20,3,3,'Durban')
insert into results values (18,'2013-06-29',3,10,48,18,6,2,'Pretoria')
insert into results values (18,'2013-06-29',14,4,28,3,3,0,'Cape Town')
insert into results values (19,'2013-07-06',3,13,20,19,2,2,'Pretoria')
insert into results values (19,'2013-07-06',10,14,12,24,0,2,'Port Elizabeth')
insert into results values (19,'2013-07-06',4,1,34,13,3,1,'Bloemfontein')
insert into results values (19,'2013-07-06',9,8,44,49,5,6,'Wellington')
insert into results values (19,'2013-07-05',6,5,43,15,5,2,'Christchurch')
insert into results values (20,'2013-07-13',14,3,30,13,3,1,'Cape Town')
insert into results values (20,'2013-07-13',13,10,58,13,10,2,'Durban')
insert into results values (20,'2013-07-13',7,2,21,15,3,2,'Perth')
insert into results values (20,'2013-07-13',15,12,12,14,2,1,'Sydney')
insert into results values (20,'2013-07-13',1,5,16,26,1,4,'Auckland')
insert into results values (20,'2013-07-12',11,8,38,37,6,4,'Melbourne')
insert into results values (20,'2013-07-12',6,9,25,17,3,2,'Christchurch')
insert into results values (21,'2013-07-20',6,12,38,9,4,0,'Christchurch')
insert into results values (21,'2013-07-21',2,4,15,13,0,2,'Canberra')
insert into results values (22,'2013-07-27',5,6,20,19,2,1,'Hamilton')
insert into results values (22,'2013-07-27',3,2,23,26,1,2,'Pretoria')
insert into results values (23,'2013-08-03',5,2,27,22,2,1,'Hamilton')

Select * from teams
Select * from players
Select * from results

--Name: Bruce Tan	
--Id: 1260430

--Q1
go
create view Finals as
select gamedate as 'date', tname as hometeam, homescore, awayscore, gamecity as location from results as r, teams as t
where roundnumber in (21,22,23) and tnum = hometeam

select * from Finals
--Q2
go
create view Above50 as
	select tname as team , country from results,teams where homescore >= 50 and hometeam = tnum
	union
	select tname, country from results,teams where awayscore >= 50 and awayteam = tnum

--Q3
go
create view Coaches_Captains
select coach, pname as capatain from teams, players where captain_id = pnum and country in ('NZ','AU')

--Q4
go
create proc Player_search @name varchar(50) = null as
if @name is null begin print 'you must supply a players name' end
if exists (select l.pnum from( select pnum from players where @name = pname) as l,teams as t where l.pnum = t.captain_id
)
	begin print @name + 'was found as a captain' end
else select pname as player, tname as team from players, teams where team_id = tnum and pname = @name

exec Player_Search
exec Player_Search 'Luke Watson'
exec Player_Search 'Rene Ranger'
--Q5
go
drop proc team_backs
go
create proc team_backs @team varchar(20) = null,@count int output as
if @team is null begin print 'you must enter a team name' end
if not exists (select tname from teams where tname = @team) begin print 'you must enter one of the valid team names' end
else select @count = count(pnum) from (select tnum from teams where tname = @team) as l, players as p where tnum = team_id and position = 'backs'

go
declare @count int
exec team_backs Chiefs, @count output
print 'there are ' + str(@count,2) + ' backs in this team'
--Q6
go
create proc Happy_Months @month int = null as
if @month is null begin print 'you must supply a month number' end
else if @month not between 2 and 8 begin print 'you must enter a valid month number (2-8)' end 
else select coach as coach 
from (
	select awayteam from results 
	where month(gamedate) = 4 and awayscore > homescore) as l
	,teams
where l.awayteam = tnum

exec Happy_Months
exec Happy_Months 1
exec Happy_Months 4

--Q7
go
drop trigger nomoreteam
go
create trigger nomoreteam on teams for insert, update as
DECLARE @RC int = @@ROWCOUNT
IF @RC=0 RETURN
else  BEGIN
  RAISERROR('you cannot insert any more players to the table now',16,1)
  ROLLBACK TRANSACTION
  RETURN
END


--Q8
begin transaction
insert into teams values (16, 'Waratahs', 'AU', 'Michael Cheika', 0, 529)
rollback transaction

--Q9
go
create trigger NegativeScore on results for insert, update as
DECLARE @RC int = @@ROWCOUNT
IF @RC=0 RETURN
else if exists (select homescore from results where homescore < 0 union
				select awayscore from results where awayscore < 0) begin 
  RAISERROR('you cannot enter a negative score',16,1)
  ROLLBACK TRANSACTION
  RETURN
END

--Q10
begin transaction
insert into results values (23,'2013-08-03',4,2,-1,22,2,1,'Hamilton')
rollback transaction

begin transaction
insert into results values (23,'2013-08-03',3,2,27,-22,2,1,'Hamilton')
rollback transaction

begin transaction
update results set homescore = homescore - 100
rollback transaction

--Q11
go
create trigger deleteFinal on results for delete as
DECLARE @RC int = @@ROWCOUNT
IF @RC=0 RETURN
if exists (select roundnumber from deleted where roundnumber in (21,22,23)) begin
RAISERROR('you cannot delete these rounds now',16,1)
  ROLLBACK TRANSACTION
  RETURN
END

--Q12
begin transaction
delete from results where roundnumber = 21
rollback transaction

begin transaction
delete from results where roundnumber = 20
rollback transaction

begin transaction
delete from results where roundnumber in (21,22,23)
rollback transaction

--Q13 (Bonus Question)

go
drop proc WinCountry
go
CREATE PROC WinCountry @roundnumber int = null AS
if @roundnumber is null begin print 'please provide a round number' end
declare @country char(2)
DECLARE table_results CURSOR FOR
  (select country from (select hometeam as teamno from results
					  where homescore > awayscore AND
					  roundnumber = @roundnumber
					 Union
					  select awayteam from results
					  where awayscore > homescore AND
					  roundnumber = @roundnumber) as l, teams
   where teamno = tnum
  )
OPEN table_results
FETCH table_results INTO @country
WHILE @@FETCH_STATUS=0 BEGIN
  
  PRINT @country
  FETCH table_results INTO @country
END  
close table_results
DEALLOCATE table_results
go

exec WinCountry 5






