DROP DATABASE IF EXISTS PARTAGE_LE;
CREATE DATABASE PARTAGE_LE;


USE PARTAGE_LE;
/*Utilisateur ( Id_U, Nom, Prenom, Code_postal_U, Email, Hash_pw, Path_photo_U, Tel)*/
CREATE TABLE UTILISATEUR (
	Id_U	        			VARCHAR2 (5)	NOT NULL ,
        CONSTRAINT chk_Id_U CHECK(Id_U IN('U[[:digit:]]{5}')),  /* alpha should be U */
		
	Prénom          		VARCHAR2 (15)   NOT NULL,
	Nom	            		VARCHAR2 (15)   NOT NULL,

	Code_postal_U 	VARCHAR2 (7) 	NOT NULL,     
		CONSTRAINT chk_Code_P_U CHECK(Code_postal_U IN ('[[:alpha:]]{1}[[:digit:]]{1}[[:alpha:]]{1}[[:digit:]]{1}[[:alpha:]]{1}[[:digit:]]{1}')),
		
    Email           			VARCHAR2 (320)  NOT NULL,
        CONSTRAINT chk_Email  CHECK (Email IN ('[[:alnum:]]+@[[:alnum:]]+\.[[:alnum:]]{2,3})')),
		
		/*[A-z]*(.[A-z]*)?@[A-z]*(.[a-z]{2,3})?.[a-z]{2,3}*/
		
    Hash_pw         	VARCHAR2 (16)   NOT NULL, 
    Path_photo_U   VARCHAR2 (100),
	
    Tel             			VARCHAR2 (15)    
        CONSTRAINT chk_Tel CHECK (Tel IN('([[:digit:]]{3}-[[:digit:]]{3}-[[:digit:]]{4}')),
	PRIMARY KEY(Id_U)
);

INSERT INTO UTILISATEUR VALUES 
	('U00001','Bill','Lewis','H4X1B1','bill@lewis.com','000000','img.bill.jpg','438-123-4567'), 

	('U00002','John','Hill','H4A1B1','john@hill.com','111111','img.john.jpg','438-321-4567'), 
 
	('U00003','Ruth','Lewis','H4B1B1','ruth@lewis.com','222222','img.ruth.jpg','438-123-5555'), 

	('U00004','Carol','Evans','H4X1C1','carol@evans.com','333333','img.carol.jpg','514-123-4567'), 

	('U00005','Jeff','Lee','H4D1B1','jeff@lee.com','444444','img.jeff.jpg','438-514-4567'), 

	('U00006','David','Lewis','H4X1E1','david@lewis.com','555555','img.david.jpg','438-415-4567'), 

	('U00007','Mary','Garcia','H4F1B1','mary@garcia.com','666666','img.mary.jpg','438-123-6666'), 

	('U00008','James','Lewis','H4X1G1','james@lewis.com','777777','img.james.jpg','438-123-0101'), 

	('U00009','Paul','Young','H4H1B1','paul@young.com','888888','img.paul.jpg','514-010-4567'),
	
	('U00010','Cristina','Mendez','H4X1B1','cristina@mendez.com','999999','img.cristina.jpg','514-111-4567'), 

	('U00011','Danny','Rand','H4A1B1','danny@rand.com','101010','img.danny.jpg','438-222-4567'), 
 
	('U00012','Joy','Evans','H4B1B1','joy@lewis.com','202020','img.joy.jpg','438-333-5555'), 

	('U00013','Harold','McDonald','H4X1C1','harold@mcdonald.com','303030','img.harold.jpg','514-444-4567'), 

	('U00014','Barry','Alen','H4D1B1','barry@alen.com','404040','img.barry.jpg','438-555-4567'), 

	('U00015','Iris','West','H4X1E1','iris@west.com','505050','img.iris.jpg','438-666-4567'), 

	('U00016','Ronna','Rand','H4F1B1','ronna@rand.com','606060','img.ronna.jpg','438-777-6666'), 

	('U00017','Arian','Azmoudeh','H4X1G1','arian@azmoudeh.com','707070','img.arian.jpg','438-888-0101'), 

	('U00018','Vivianne','Young','H4H1B1','vivianne@young.com','808080','img.vivianne.jpg','514-999-4567'),
	
	('U00019','Bill','Smith','H4M1B1','bill@smith.com','909090','img.smith.jpg','438-000-4567'), 

	('U00020','Scarlette','Johansson','H4A1B1','john@scarlette.com','121212','img.scarlette.jpg','438-321-1111'), 
 
	('U00021','Rayan','Razmi','H4B1B1','rayan@razmi.com','131313','img.rayan.jpg','438-123-2222'), 

	('U00022','Jesus','Evans','H4X1C1','jesus@evans.com','141414','img.jesus.jpg','514-123-3333'), 

	('U00023','Jeniffer','Lee','H4D1B1','jeniffer@lee.com','151515','img.jeniffer.jpg','438-514-4444'), 

	('U00024','Yazdan','Hormozi','H4X1E1','yazdan@hormozi.com','161616','img.yazdan.jpg','438-415-5555'), 

	('U00025','Dave','Stanford','H4H1B1','dave@stanford.com','171717','img.dave.jpg','514-010-6666');

/*Objet ( Id_O, #IdAcheteur[Utilisateur], #IdAnnonceur[Utilisateur], Nom_O,Code_postal_O, Etat, Prix , #Nom_Type)*/
CREATE TABLE OBJET (
	Id_O	        			VARCHAR2 (5)	NOT NULL,
       CONSTRAINT chk_Id_O CHECK (Id_O IN ('O[[:digit:]]{5}')), /* alpha should be 'O' */
		
	Id_Acheteur		VARCHAR2 (5)	  NOT NULL,    
		CONSTRAINT Id_Acheteur REFERENCES PARTAGE_LE.UTILISATEUR(Id_U) AND 
		chk_Id_Achteur CHECK(Id_Acheteur IN('U[[:digit:]]{5}')), /* alpha should be 'U' */
		
	Path_photo_O   VARCHAR2 (100),
		
	Id_Annonceur	VARCHAR2 (5)		NOT NULL,
		CONSTRAINT Id_Annonceur REFERENCES PARTAGE_LE.UTILISATEUR(Id_U) AND
		chk_Id_Annonceur CHECK (Id_Annonceur IN('U[[:digit:]]{5}')), /* alpha should be 'U' */
		
	Nom_O	        		VARCHAR2 (15)   	NOT NULL,
	
	Code_postal_O 	VARCHAR2 (7)      	NOT NULL,
		CONSTRAINT chk_Code_P_O CHECK (Code_postal_O IN('[[:alpha:]]{1}[[:digit:]]{1}[[:alpha:]]{1}[[:digit:]]{1}[[:alpha:]]{1}[[:digit:]]{1}')),
		
    Etat		        		VARCHAR2 (5)   		NOT NULL,
		CONSTRAINT chk_Etat CHECK (Etat IN ('Neuf', 'Usagé')),
		
	Prix						NUMBER(10,2)		NOT NULL, /* how to add $ at the end? */
	
	Nom_Type			VARCHAR2(15)		NOT NULL,
		CONSTRAINT Nom_Type REFERENCES PARTAGE_LE.TYPE_OBJ(Nom_Type),  /*Utiliser TYPE_OBJ au lieu de TYPE */
	PRIMARY KEY (Id_O)
	);

/*Path_photo_O (#Id[Object], path_img_O)*/	
CREATE TABLE Path_photo_O(
	Id_Photo	VARCHAR2 (5)		NOT NULL,
		CONSTRAINT Id_Photo REFERENCES PARTAGE_LE.OBJET(Id_O) AND 
		chk_Id_Photo CHECK (Id_Photo IN('O[[:digit:]]{5}')), /* alpha should be 'U' */
		
	Path_img_O 		VARCHAR2(500),
	PRIMARY KEY (Id_Photo)
);
	
/*Messagerie (#IdDestinataire[Utilisateur], #IdExpediteur[Utilisateur], Date_heure_mess, Contenu_M)*/
CREATE TABLE Messagerie(
	Id_Destinataire	VARCHAR2 (5)		NOT NULL,
		CONSTRAINT Id_Destinataire REFERENCES PARTAGE_LE.UTILISATEUR(Id_U) AND
		chk_Id_Destinataire CHECK (Id_Destinataire IN('U[[:digit:]]{5}')), /* alpha should be 'U' */
		
	Id_Expediteur		VARCHAR2 (5)		NOT NULL,
		CONSTRAINT Id_Expediteur REFERENCES PARTAGE_LE.UTILISATEUR(Id_U) AND
		chk_Id_Expediteur CHECK (Id_Expediteur IN('U[[:digit:]]{5}')), /* alpha should be 'U' */
	
	Date_heure_mess	DATE						NOT NULL,
		TO_CHAR(Date_heure_mess, 'YYYY-MM-DD-HH-MM') >= 'CURRENT DATE', /* CURRENT DATE/ HOUR AND MINUTES!!*/
	
	Contenu_M			VARCHAR2(1000)		NOT NULL,
	PRIMARY KEY(Id_Destinataire, Id_Expediteur, Date_heure_mess)
);

/*Annonce (#IdAnnonce, Description, Prix_Vente, Date_heure_affichage, Durée, Date_heure_vente)*/
CREATE TABLE Annonce(
	Id_Anc				VARCHAR2 (5)		NOT NULL,
		CONSTRAINT chk_Id_Anc CHECK (Id_Anc IN('A[[:digit:]]{5}')), /* alpha should be 'A' */
	
	Description	VARCHAR2(1000)	NOT NULL,
	Prix_Vente		NUMBER(10,2)		NOT NULL, /* how to add $ at the end? */
	
	Date_heure_affichage	DATE		NOT NULL,
		TO_CHAR(Date_heure_affichage, 'YYYY-MM-DD-HH-MM')<= 'CURRENT DATE', /* CURRENT DATE/ HOUR AND MINUTES!!*/
	
	Durée			VARCHAR2(3)				NOT NULL,
		CONSTRAINT chk_Durée CHECK (Id_Durée IN('[[:digit:]]{2}','Mois','[[:digit:]]{2}','Jours')), 
	
	Date_heure_vente	DATE				NOT NULL,
		TO_CHAR(Date_heure_vente, 'YYYY-MM-DD-HH-MM') <= 'CURRENT DATE',/* CURRENT DATE/ HOUR AND MINUTES!!*/
	PRIMARY KEY(Id_Anc, Date_heure_affichage,Date_heure_vente)
);

/*Intéressé_a (#Nom_type[Type] , #Id[Utilisateur] )*/
CREATE TABLE Interesse_a(
	Nom_Type	VARCHAR2 (5)		NOT NULL,
		CONSTRAINT Nom_Type REFERENCES PARTAGE_LE.TYPE_OBJ(Nom_Type),
	
	Id_I		VARCHAR2 (5)				NOT NULL,
		CONSTRAINT Id_I REFERENCES PARTAGE_LE.OBJET(Id_O) AND
		chk_Id_I CHECK (Id_I IN('O[[:digit:]]{5}')), /* alpha should be 'U' */
	PRIMARY KEY(Nom_Type,Id_I)
);

/*Type (Nom_Type)*/
CREATE TABLE TYPE_OBJ(
	Nom_Type	VARCHAR2 (5)		NOT NULL, PRIMARY KEY(Nom_Type)
);

/*Marque (Nom_Marque, #Nom_type[Type])*/
CREATE TABLE Marque(
	Nom_Marque	VARCHAR2 (15)		NOT NULL,
	
	Nom_Type	VARCHAR2 (5)				NOT NULL,
		CONSTRAINT Nom_Type REFERENCES PARTAGE_LE.TYPE_OBJ(Nom_Type),
	PRIMARY KEY(Nom_Marque,Nom_Type)
);

/*Telephone (#Id[Object], Couleur )*/
CREATE TABLE Telephone(
	Id_Tel		VARCHAR2 (5)		NOT NULL,
		CONSTRAINT Id_Tel REFERENCES PARTAGE_LE.OBJET(Id_O) AND
		chk_Id_Tel CHECK (Id_Tel IN('O[[:digit:]]{5}')), 
	Color		VARCHAR2(7)				NOT NULL,
		CONSTRAINT Color IS('NOIR' OR 'BLANC' OR 'GRIS' OR 'OR' OR 'ARGEN'),
	PRIMARY KEY(Id_Tel)
);

/*Pièce mécanique ( #Id[Object] )*/
CREATE TABLE Piece_Mecanique(
	Id_PMec	VARCHAR2 (5)		NOT NULL,
		CONSTRAINT Id_PMec REFERENCES PARTAGE_LE.OBJET(Id_O) AND
		chk_Id_PMec CHECK (Id_PMec IN('O[[:digit:]]{5}')) ,
	PRIMARY KEY(Id_PMec)
);

/*Jeux ( #Id[Object] , Categorie_d’age , Nb_joueurs )*/
CREATE TABLE Jeux(
	Id_J		VARCHAR2 (5)		NOT NULL,
		CONSTRAINT Id_J REFERENCES PARTAGE_LE.OBJET(Id_O) AND
		chk_Id_J CHECK (Id_J IN('O[[:digit:]]{5}')), 
	Categorie_d’age		NUMBER(2),
	Nb_joueurs				NUMBER(2),
	PRIMARY KEY(Id_J)
);

/*Automobile ( #Id[Object] , Année , Kilométrage , Nb_places, Couleur)*/
CREATE TABLE Automobile(
	Id_Auto		VARCHAR2 (5)		NOT NULL,
		CONSTRAINT Id_Auto REFERENCES PARTAGE_LE.OBJET(Id_O) AND
		chk_Id_Auto CHECK (Id_Auto IN('O[[:digit:]]{5}')), 
	Annee			NUMBER(4)				NOT NULL,
	Kilometre	NUMBER(6)				NOT NULL,
	Nb_places	NUMBER(1)				NOT NULL,
	Color				VARCHAR2(10)		NOT NULL,
	PRIMARY KEY(Id_Auto)
);

/*Musique ( #Id[Object] , Sorte , Groupe , Type_musique )*/
CREATE TABLE Musique(
	Id_Msq		VARCHAR2 (5)		NOT NULL,
		CONSTRAINT Id_Msq REFERENCES PARTAGE_LE.OBJET(Id_O) AND
		chk_Id_Msq CHECK (Id_Msq IN('O[[:digit:]]{5}')), 
		
	Sorte			VARCHAR2(10)		NOT NULL,
		CONSTRAINT Sorte IS('POP' OR 'JAZZ' OR 'ROCK' OR 'CLASSIC' OR 'BLUES'),
	Groupe	VARCHAR2(15),
	Type_musique	VARCHAR2(10),	
	PRIMARY KEY(Id_Msq)
);

/*Meuble ( #Id[Object] , Couleur , Dimension , Matériau )*/
CREATE TABLE Meuble(
	Id_Mub		VARCHAR2 (5)		NOT NULL,
		CONSTRAINT Id_Mub REFERENCES PARTAGE_LE.OBJET(Id_O) AND
		chk_Id_Mub CHECK (Id_Mub IN('O[[:digit:]]{5}')), 
	Color		VARCHAR2(10)				NOT NULL,
		CONSTRAINT Color IS('NOIR' OR 'BLANC' OR 'BRUNE' OR 'ROUGE' OR 'BLUE' OR 'GREEN' OR 'GRIS' OR 'JEUNE' OR 'VERT'),
	Dimension	VARCHAR2(15),		
		CONSTRAINT chk_Dimension CHECK (Dimension IN('[[:digit:]]{2} x  [[:digit:]]{2} x [[:digit:]]{2}','feet')), 
	Materiau	VARCHAR2(10),			
		CONSTRAINT Color IS('BOIS' OR 'CUIR' OR 'ACIER'),
	PRIMARY KEY(Id_Mub)
);

/*Maison ( #Id[Object] , Année_Construction , Nb_Chambres , Garage , Cours_arriere )*/
CREATE TABLE Maison(
	Id_Msn										VARCHAR2 (5)			NOT NULL,
		CONSTRAINT Id_Msn REFERENCES PARTAGE_LE.OBJET(Id_O) AND
		chk_Id_Msn CHECK (Id_Msn IN('O[[:digit:]]{5}')), 
	Annee_Construction			NUMBER(4)				NOT NULL,
	Nb_Chambres						NUMBER(2)				NOT NULL,
	Garage 									CHAR(1) CHECK (Garage in ('OUI','NON')),
	Cours_arriere 						CHAR(1) CHECK (Cours_arriere in ('OUI','NON')),
	PRIMARY KEY(Id_Msn)
);

/*Nourriture ( #Id[Object] , Date_peremption)*/
CREATE TABLE Nourriture(
	Id_N									VARCHAR2 (5)			NOT NULL,
		CONSTRAINT Id_N REFERENCES PARTAGE_LE.OBJET(Id_O) AND
		chk_Id_N CHECK (Id_N IN('O[[:digit:]]{5}')), 
	Date_peremption		DATE,		
		TO_CHAR(Date_peremption, 'YYYY-MM-DD') >= 'CURRENT DATE', /* CURRENT DATE/ HOUR AND MINUTES!!*/
	PRIMARY KEY(Id_N)
);

/*Vêtement ( #Id[Object] , Taille_lettre, Taille_chiffre, Sexe , Categorie_d’age, Matériau)*/
CREATE TABLE Vêtement(
	Id_Vet								VARCHAR2 (5)			NOT NULL,
		CONSTRAINT Id_Vet REFERENCES PARTAGE_LE.OBJET(Id_O) AND
		chk_Id_Vet CHECK (Id_Vet IN('O[[:digit:]]{5}')), 
	Taille_lettre		VARCHAR2(10),				
		CONSTRAINT Taille_lettre IS('XXP' OR 'XP' OR 'P' OR 'M' OR 'L' OR 'XL' OR 'XXL' OR 'XXXL'),
	Taille_chiffre		VARCHAR2(10),			
	Sexe		VARCHAR2(10),				
		CONSTRAINT Sexe IS('HOMME' OR 'FEMME' OR 'UNISEXE'),
	Categorie_d’age		VARCHAR2(10),				
		CONSTRAINT Categorie_d’age IS('TOUT PETIT' OR 'ENFANT' OR 'ADOLESCENCE' OR 'ADULT'),
	Materiau		VARCHAR2(10),				
		CONSTRAINT Materiau IS('Acrylique' OR 'Angora' OR 'Cachemire' OR 'Coton' OR 'Cuir' OR 'Daim' OR 'Denim' OR 'Faux cuir' 
		OR 'Fourrure' OR 'Gore-tex' OR 'Jersey' OR 'Laine' OR 'Lin' OR 'Lycra' OR 'Nylon' OR 'Polaire' OR 'Polyamide' OR 'Polyester' OR 'Soie') ,
	PRIMARY KEY(Id_Vet)
);
/*Électroménager ( #Id[Object])*/
CREATE TABLE Électromenager(
	Id_Elcmngr			VARCHAR2 (5)			NOT NULL,
		CONSTRAINT Id_Elcmngr REFERENCES PARTAGE_LE.OBJET(Id_O) AND
		chk_Id_Elcmngr CHECK (Id_Elcmngr IN('O[[:digit:]]{5}')), 
	PRIMARY KEY(Id_Elcmngr)
);
/*Appareil_Electronique ( #Id[Object])*/
CREATE TABLE Appareil_Electronique(
	Id_Elc			VARCHAR2 (5)			NOT NULL,
		CONSTRAINT Id_Elc REFERENCES PARTAGE_LE.OBJET(Id_O) AND
		chk_Id_Elc CHECK (Id_Elc IN('O[[:digit:]]{5}')), 
	PRIMARY KEY(Id_Elc)
);
/*Bijoux( #Id[Object] , Matériau )*/
CREATE TABLE Bijoux(
	Id_Bij								VARCHAR2 (5)			NOT NULL,
		CONSTRAINT Id_Bij REFERENCES PARTAGE_LE.OBJET(Id_O) AND
		chk_Id_Bij CHECK (Id_Bij IN('O[[:digit:]]{5}')), 
	Materiau		VARCHAR2(10),				
		CONSTRAINT Materiau IS('Or' OR 'Argent' OR 'Cuivre' OR 'Bronze' OR 'Titane' OR 'Laiton' OR 'Zinc' OR 'Palladium' 
		OR 'Platine' OR 'Rhodium') ,
	PRIMARY KEY(Id_Bij)
);
/*Art( #Id[Object] , Dimension)*/
CREATE TABLE Art(
	Id_Art		VARCHAR2 (5)		NOT NULL,
		CONSTRAINT Id_Art REFERENCES PARTAGE_LE.OBJET(Id_O) AND
		chk_Id_Art CHECK (Id_Art IN('O[[:digit:]]{5}')), 
	Dimension	VARCHAR2(15),		
		CONSTRAINT chk_Dimension CHECK (Dimension IN('[[:digit:]]{4} x  [[:digit:]]{4} x [[:digit:]]{4}','pouces')), 
	PRIMARY KEY(Id_Art)
);
/*Nom_Artiste ( #IdArt[Object] , Nom_A )*/
CREATE TABLE Nom_Artiste(
	Id_NomArt		VARCHAR2 (5)		NOT NULL	,
		CONSTRAINT Id_NomArt REFERENCES PARTAGE_LE.Art(Id_Art) AND
		chk_Id_NomArt CHECK (Id_NomArt IN('O[[:digit:]]{5}')), 
	Nom_Art	        VARCHAR2 (15)   	NOT NULL	,
	PRIMARY KEY(Id_NomArt,Nom_Art)
);
/*Livre ( #Id[Object] , Genre , Nb_Pages , Editeur, Titre )*/
CREATE TABLE Livre(
	Id_Livre		VARCHAR2 (5)		NOT NULL	,
		CONSTRAINT Id_Livre REFERENCES PARTAGE_LE.OBJET(Id_O) AND
		chk_Id_Livre CHECK (Id_Livre IN('O[[:digit:]]{5}')), 
	Genre		VARCHAR2(30),				
		CONSTRAINT Genre IS(OR 'Romans & Fictions' OR 'Arts & Culture' OR 'Bande Dessinée, Comics & Manga ' 
		OR 'Documents & Médias' OR 'Enseignement & Education ' OR 'Erotisme' OR 'Esotérisme ' OR 'Santé & Bien-être' 
		OR 'Histoire & Géographie ' OR 'Jeunesse' OR 'Langues ' OR 'Littérature & Lettres' OR 'Loisirs, Vie pratique & Société'
		OR 'Religions & Spiritualité' OR 'Sciences Humaines' OR 'Sciences & Techniques' OR 'Sciences Sociales') ,
	Nb_Pages	NUMBER(5),
	Editeur		VARCHAR2(50),
	Titre				VARCHAR2(50)		NOT NULL,
	PRIMARY KEY(Id_Livre)
);
/*Auteur(#IdLivre[Objet] , Nom_Auteur)*/
​​CREATE TABLE Auteur(
	Id_Auteur		VARCHAR2 (5)				NOT NULL	,
		CONSTRAINT Id_Auteur REFERENCES PARTAGE_LE.Livre(Id_Livre) AND
		chk_Id_Auteur CHECK (Id_Auteur IN('O[[:digit:]]{5}')), 
	Nom_Auteur	        VARCHAR2 (15)   	NOT NULL	,
	PRIMARY KEY(Id_Auteur,Nom_Auteur)
);
​
​​
​ ​​ ​
​​
​ ​
​
​​
​
​
​ ​
​
​ ​
​​
​​ ​
​
​​
​
​
​
​
​
​
​
​ ​
​
​ ​
​​
​​​
​
​
​ ​​
​ ​ ​​
​ ​
​
​​
​ ​ ​​
​
​​ ​ ​
​​
​ ​
​​​
​
​​
​ ​
​​
​​​
​
​
​ ​​
​ ​ ​​
​ ​
​
​​
​ ​ ​​
​
​​ ​ ​
​​
​ ​
​​​
​
​​
	

	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	