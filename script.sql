drop database  if exists gestionShop;
create database gestionShop;
use gestionShop;

drop table if exists Client;
create table Client(
    idClient char(10) primary key auto_increment,
	nom varchar(50),
	prenom varchar(50),
	adresse varchar(200),
	courriel varchar(20),
	password varchar(10)
);

insert into Client values
(null, "Petit", "Esprit", "1 rue Hochelaga, Montreal, QC, H1V1C1", "petitesprit@gmail.com", "petit"),
(null, "Enfantin", "Yannis", "202 rue Ontario, Montreal, QC, H2C2Q1", "enfantinyannis@gmail.com", "enfantin"),
(null, "Paul", "Walker", "30 Roadisland, Miami", "paulwalker@gmail.com", "paul"),
(null, "Vin", "Diesel", "14 Road, Washington, DC", "vindiesel@gmail.com", "vin"),
(null, "Joly", "Angelina", "826 Ocean Drive, Miami Beach, FL, 33139", "angelinajoly@gmail.com", "joly");


drop table if exists Administrateur;
create table Administrateur(
    idAdmin char(10) primary key,
	nom varchar(50),
    prenom varchar(50),
	courriel varchar(20),
	password varchar(10)
);

insert into Administrateur values
("100", "Pierre", "Julien", "56 boul Létourneux, Montreal, QC, H6B5S3", "pierrejulien@gmail.com", "pierrejul");


drop table if exists Produit;
create table Produit(
	idProduit char(10) primary key,
	nomProduit varchar(50),
	image varchar (50),
	description (200),
	categorie varchar (100),
	prixReel decimal(10,2)
);

insert into Produit values
(10001, "Thé vert détox", "1.jpg", "Désintoxique et purifie le corps", "Gestion du poids", 12.99),
(10002, "Thé noir stimulant", "2.jpg", "Réduit le risque de cancer", "Santé cardiaque", 10.99),
(10003, "Thé détente à la camomille", "3.jpg", "Aide à calmer le stress et l’anxiété", "Sommeil", 15.99),
(10004, "Thé riche Roiboos", "4.jpg", "Réduit l’inflammation", "Santé cardiaque", 14.99),
(10005, "Thé citron et gingembre", "5.jpg", "Favorise le transit intestinal", "Systeme immunitaire", 12.99),
(10006, "Thé canelle magique", "6.jpg", "Soulage les douleurs menstruelles", "Douleurs menstruelles" 18.99),
(10007, "Thé douceur au miel", "7.jpg", "Aide la stimulation du métabolisme", "Gestion du poids", 16.99),
(10008, "Thé à la menthe", "8.jpg", "Apaise le syndrome du côlon irritable", "Digestion", 10.99),
(10009, "Thé girogle anesthésiant", "9.jpg", "Soulage les troubles digestifs", "Digestion", 14.99);


drop table if exists Categorie;
create table Categorie(
	idCategorie varchar(20),
	nomCategorie varchar(50)
);

insert into Categorie values
(1, "Sommeil"),
(2, "Systeme immunitaire"),
(3, "Gestion du poids"),
(4, "Santé cardiaque"),
(5, "Digestion"),
(6, "Douleurs menstruelles");


drop table if exists Commande;
create table Commande(
	idClient char(10),
	idCommande char(10),
	idProduit char (10),
	dateCommande date(YYYY-MM-DD),
	statut varchar (50),
	adresseLivraison varchar (200)
);

insert into Commande values
(null, 20001, 10001, "2022-04-06", "Commande recue", "6000 chemin de la Côte-des-Neiges, Montréal, QC, H3S 1Z8"),
(null, 20002, 10002, "2022-10-15", "Commande annulée", "200 Bay Street, Toronto, ON M5J 2T6"),
(null, 20003, 10003, "2022-01-01", "Commande recue", "1300-300, rue West Georgia, Vancouver, CB, V6B 6B4"),
(null, 20004, 10004, "2022-12-15", "Commande recue", "220-4 Avenue SE, Calgary, AL, T2G 4X3"),
(null, 20005, 10005, "2022-08-07", "Commande annulée", "400 Rue Laverdure, Sainte-agathe-des-monts, QC, J8C 0A2");

drop table if exists ligneCommande;
create table ligneCommande(
	idCommande char(10),
	quantite char(10),
	prixReel decimal(10,2)
);

insert into ligneCommande values
(20001, 10, 12.99),
(20002, 20, 10.99),
(20003, 30, 15.99),
(20004, 40, 14.99),
(20005, 50, 12.99);


drop table if exists Panier;
create table Panier(
	idProduit char(10),
	quantite char(30)
);

insert into Panier values
(10001, 10),
(10002, 20),
(10003, 30),
(10004, 40),
(10005, 50);

drop table if exists Stock;
create table Stock(
	idStock char(10),
	quantite char(30),
	seuil char(500)
);

insert into Stock values
(30001, 450, 500),
(30002, 350, 500),
(30003, 250, 500),
(30004, 150, 500),
(30005, 50, 500),
(30006, 60, 500),
(30007, 40, 500),
(30008, 30, 500),
(30009, 300, 500);

drop table if exists Facture;
create table Facture(
	noFacture varchar(15),
	idProduit char (10),
	nomProduit varchar(50),
	prixReel decimal (10,2),
	quantite char(30),
	fraisExpedition char(5)
);

insert into Facture values
(CA2022THEVERT, 10001, "Thé vert détox", 12.99, 10, 9.99),
(CA2022THENOIR, 10002, "Thé noir stimulant", 10.99, 20, 9.99),
(CA2022THERELAX, 10003, "Thé détente à la camomille", 15.99, 30, 9.99),
(CA2022THEROIBO, 10004, "Thé riche Roiboos", 14.99, 40, 9.99),
(CA2022THELEMON, 10005, "Thé citron et gingembre", 12.99, 50, 9.99);
