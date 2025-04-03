DROP TABLE IF EXISTS PaintType;
DROP TABLE IF EXISTS UnderlyingMaterial;
DROP TABLE IF EXISTS ArtisticStyle;
DROP TABLE IF EXISTS ArtistBiography;
DROP TABLE IF EXISTS painting;
DROP TABLE IF EXISTS PermanentCollection;
DROP TABLE IF EXISTS LoanCollection;
DROP TABLE IF EXISTS Exhibition;
DROP TABLE IF EXISTS PaintingAssigned;

CREATE TABLE PaintType
    (PaintID INT(4),
        TypeOfPaint VARCHAR(15)
    );
ALTER TABLE PaintType ADD CONSTRAINT pk_PaintType_PaintID PRIMARY KEY (PaintID);

INSERT into PaintType (PaintID,TypeOfPaint) values (0001, "oil");
INSERT into PaintType (PaintID,TypeOfPaint) values (0002, "watercolour");


CREATE TABLE UnderlyingMaterial
    (MaterialID INT(4),
        TypeOfMaterial VARCHAR(10)
    );
ALTER TABLE UnderlyingMaterial ADD CONSTRAINT pk_UnderlyingMaterial_MaterialID PRIMARY KEY (MaterialID);

INSERT into UnderlyingMaterial (MaterialID,TypeOfMaterial) values (1000,"paper");
INSERT into UnderlyingMaterial (MaterialID,TypeOfMaterial) values (2000,"canvas");
INSERT into UnderlyingMaterial (MaterialID,TypeOfMaterial) values (3000,"wood");


CREATE TABLE ArtisticStyle
    (ArtisticStyleID INT(3),
        Style VARCHAR(20)
    );
ALTER TABLE ArtisticStyle ADD CONSTRAINT pk_ArtisticStyle_ArtisticStyleID PRIMARY KEY (ArtisticStyleID);

INSERT into ArtisticStyle (ArtisticStyleID,Style) values (100,"Spanning Modern");
INSERT into ArtisticStyle (ArtisticStyleID,Style) values (200,"Abstract");
INSERT into ArtisticStyle (ArtisticStyleID,Style) values (300,"Impressionism");
INSERT into ArtisticStyle (ArtisticStyleID,Style) values (400,"Expressionism");
INSERT into ArtisticStyle (ArtisticStyleID,Style) values (500,"Cubism");


CREATE TABLE ArtistBiography
    (ArtistID INT(3),
        Epoch INT(4),
        FirstName VARCHAR(15),
        LastName VARCHAR(15),
        DateOfBirth DATE,
        DateOfDeath DATE,
        CountryOfBirth VARCHAR(20),
        PrimaryStyleID INT(3)
    );
ALTER TABLE ArtistBiography ADD CONSTRAINT pk_ArtistBiography_ArtistID PRIMARY KEY (ArtistID);
ALTER TABLE ArtistBiography ADD CONSTRAINT fk_ArtistBiography_PrimaryStyleID FOREIGN KEY (PrimaryStyleID) REFERENCES ArtisticStyle (ArtisticStyleID);

INSERT into ArtistBiography (ArtistID,Epoch,FirstName,LastName,DateOfBirth,DateOfDeath,CountryOfBirth,PrimaryStyleID) values (110,1965,"Mona","Lisa",STR_TO_DATE('03-01-1935','%d-%m-%Y'),STR_TO_DATE('04-06-1995','%d-%m-%Y'),"France",400);
INSERT into ArtistBiography (ArtistID,Epoch,FirstName,LastName,DateOfBirth,DateOfDeath,CountryOfBirth,PrimaryStyleID) values (120,1995,"Tom","Frankfurt",STR_TO_DATE('04-06-1965','%d-%m-%Y'),STR_TO_DATE('06-02-2014','%d-%m-%Y'),"Spain",300);
INSERT into ArtistBiography (ArtistID,Epoch,FirstName,LastName,DateOfBirth,DateOfDeath,CountryOfBirth,PrimaryStyleID) values (130,2000,"Salvador","Dali",STR_TO_DATE('06-02-2004','%d-%m-%Y'),STR_TO_DATE('10-01-2022','%d-%m-%Y'),"Germany",200);
INSERT into ArtistBiography (ArtistID,Epoch,FirstName,LastName,DateOfBirth,DateOfDeath,CountryOfBirth,PrimaryStyleID) values (140,1985,"Vincent","Goh",STR_TO_DATE('10-01-1955','%d-%m-%Y'),STR_TO_DATE('23-10-2017','%d-%m-%Y'),"Italy",200);
INSERT into ArtistBiography (ArtistID,Epoch,FirstName,LastName,DateOfBirth,DateOfDeath,CountryOfBirth,PrimaryStyleID) values (150,1800,"Pablo","Picasso",STR_TO_DATE('23-10-1790','%d-%m-%Y'),STR_TO_DATE('17-01-1850','%d-%m-%Y'),"Spain",300);
INSERT into ArtistBiography (ArtistID,Epoch,FirstName,LastName,DateOfBirth,DateOfDeath,CountryOfBirth,PrimaryStyleID) values (160,1850,"Frida","Kahlo",STR_TO_DATE('17-01-1820','%d-%m-%Y'),STR_TO_DATE('13-12-1875','%d-%m-%Y'),"Spain",400);
INSERT into ArtistBiography (ArtistID,Epoch,FirstName,LastName,DateOfBirth,DateOfDeath,CountryOfBirth,PrimaryStyleID) values (170,1865,"Claude","Monet",STR_TO_DATE('13-12-1835','%d-%m-%Y'),STR_TO_DATE('22-11-1870','%d-%m-%Y'),"Italy",500);
INSERT into ArtistBiography (ArtistID,Epoch,FirstName,LastName,DateOfBirth,DateOfDeath,CountryOfBirth,PrimaryStyleID) values (180,1870,"Hokusai","Katsushika",STR_TO_DATE('22-11-1860','%d-%m-%Y'),STR_TO_DATE('22-11-1925','%d-%m-%Y'),"France",100);
INSERT into ArtistBiography (ArtistID,Epoch,FirstName,LastName,DateOfBirth,DateOfDeath,CountryOfBirth,PrimaryStyleID) values (190,1845,"Ben","Franklin",STR_TO_DATE('22-11-1835','%d-%m-%Y'),STR_TO_DATE('15-09-1920','%d-%m-%Y'),"Germany",100);
INSERT into ArtistBiography (ArtistID,Epoch,FirstName,LastName,DateOfBirth,DateOfDeath,CountryOfBirth,PrimaryStyleID) values (111,1840,"Yayoi","Kusama",STR_TO_DATE('15-09-1830','%d-%m-%Y'),STR_TO_DATE('03-01-1915','%d-%m-%Y'),"Spain",300);


CREATE TABLE painting 
    (PaintingID INT(2),
        Title VARCHAR(25), 
        CreationYear INT(4), 
        DetailedDescription VARCHAR (50), 
        PaintID INT(4), 
        MaterialID INT(4), 
        ArtisticStyleID INT(3),
        ArtistID INT(3)
     );

ALTER TABLE painting ADD CONSTRAINT pk_painting_PaintingID PRIMARY KEY (PaintingID);
ALTER TABLE painting ADD CONSTRAINT fk_painting_PaintID FOREIGN KEY (PaintID) REFERENCES PaintType (PaintID);
ALTER TABLE painting ADD CONSTRAINT fk_painting_MaterialID FOREIGN KEY (MaterialID) REFERENCES UnderlyingMaterial (MaterialID);
ALTER TABLE painting ADD CONSTRAINT fk_painting_ArtisticStyleID FOREIGN KEY (ArtisticStyleID) REFERENCES ArtisticStyle (ArtisticStyleID);
ALTER TABLE painting ADD CONSTRAINT fk_painting_ArtistID FOREIGN KEY (ArtistID) REFERENCES ArtistBiography (ArtistID);

INSERT into painting (PaintingID,Title,CreationYear,DetailedDescription,PaintID,MaterialID,ArtisticStyleID,ArtistID) values (10,"Procrastination",1975,"Process of time being wasted",0001,3000,500,180);
INSERT into painting (PaintingID,Title,CreationYear,DetailedDescription,PaintID,MaterialID,ArtisticStyleID,ArtistID) values (20,"Anger",2005,"The state one feels",0002,2000,400,110);
INSERT into painting (PaintingID,Title,CreationYear,DetailedDescription,PaintID,MaterialID,ArtisticStyleID,ArtistID) values (30,"Starry Night",2010,"Strong expression of night sky filled with vivid stars",0002,2000,300,120);
INSERT into painting (PaintingID,Title,CreationYear,DetailedDescription,PaintID,MaterialID,ArtisticStyleID,ArtistID) values (40,"Hatred",1965,"Intense dislike fueling negative actions",0001,1000,100,140);
INSERT into painting (PaintingID,Title,CreationYear,DetailedDescription,PaintID,MaterialID,ArtisticStyleID,ArtistID) values (50,"Sleepless Nights",1992,"Silent struggle in the dark where every passing hour feels like an eternity",0001,2000,300,111); 
INSERT into painting (PaintingID,Title,CreationYear,DetailedDescription,PaintID,MaterialID,ArtisticStyleID,ArtistID) values (60,"Seventeen",1999,"Talented and chaotic group depicted in a painting",0002,1000,100,150);
INSERT into painting (PaintingID,Title,CreationYear,DetailedDescription,PaintID,MaterialID,ArtisticStyleID,ArtistID) values (70,"Smile Flower",2000,"Each bloom is burst of happiness sharing warmth",0001,3000,200,180);
INSERT into painting (PaintingID,Title,CreationYear,DetailedDescription,PaintID,MaterialID,ArtisticStyleID,ArtistID) values (80,"Clap",2010,"Expresses the feeling of success, creating a vibrant contagious feeling",0002,2000,300,190);
INSERT into painting (PaintingID,Title,CreationYear,DetailedDescription,PaintID,MaterialID,ArtisticStyleID,ArtistID) values (90,"Super",2021,"The artwork depicts an upbeat feeling while embodying confidence",0001,2000,300,150);
INSERT into painting (PaintingID,Title,CreationYear,DetailedDescription,PaintID,MaterialID,ArtisticStyleID,ArtistID) values (11,"First Snow",2015,"The first snow of the season",0001,3000,200,130);
INSERT into painting (PaintingID,Title,CreationYear,DetailedDescription,PaintID,MaterialID,ArtisticStyleID,ArtistID) values (21,"Growl",1890,"Displays the ferociousness of a wolf",0002,1000,200,180);
INSERT into painting (PaintingID,Title,CreationYear,DetailedDescription,PaintID,MaterialID,ArtisticStyleID,ArtistID) values (31,"Run",1895,"The artwork expresses the feeling of chasing after ones youth and dreams",0002,3000,500,110);
INSERT into painting (PaintingID,Title,CreationYear,DetailedDescription,PaintID,MaterialID,ArtisticStyleID,ArtistID) values (41,"PeterPan",1900,"Whimsical feeling",0001,1000,400,130);
INSERT into painting (PaintingID,Title,CreationYear,DetailedDescription,PaintID,MaterialID,ArtisticStyleID,ArtistID) values (51,"Fighting",1905,"Expresses playfulness yet encouraging perserverance and optimism",0002,3000,300,150);

CREATE TABLE PermanentCollection
    (PermanentID INT(3),
        DateOfAcquisition DATE,
        DisplayStatus VARCHAR(15),
        AcquisitionCost FLOAT(7,2),
        PaintingID INT(2)
    );
ALTER TABLE PermanentCollection ADD CONSTRAINT pk_PermanentCollection_PermanentID PRIMARY KEY (PermanentID);
ALTER TABLE PermanentCollection ADD CONSTRAINT fk_PermanentCollection_PaintingID FOREIGN KEY (PaintingID) REFERENCES painting (PaintingID);

INSERT into PermanentCollection (PermanentID,DateOfAcquisition,DisplayStatus,AcquisitionCost,PaintingID) values (010,STR_TO_DATE('03-01-2018','%d-%m-%Y'),"Displayed",12345.99,10);
INSERT into PermanentCollection (PermanentID,DateOfAcquisition,DisplayStatus,AcquisitionCost,PaintingID) values (020,STR_TO_DATE('03-01-2018','%d-%m-%Y'),"Displayed",23456.75,10);
INSERT into PermanentCollection (PermanentID,DateOfAcquisition,DisplayStatus,AcquisitionCost,PaintingID) values (030,STR_TO_DATE('03-01-2019','%d-%m-%Y'),"Undisplayed",24567.89,40);
INSERT into PermanentCollection (PermanentID,DateOfAcquisition,DisplayStatus,AcquisitionCost,PaintingID) values (040,STR_TO_DATE('03-01-2019','%d-%m-%Y'),"Displayed",25678.91,60);
INSERT into PermanentCollection (PermanentID,DateOfAcquisition,DisplayStatus,AcquisitionCost,PaintingID) values (050,STR_TO_DATE('03-01-2021','%d-%m-%Y'),"Displayed",11345.86,80);
INSERT into PermanentCollection (PermanentID,DateOfAcquisition,DisplayStatus,AcquisitionCost,PaintingID) values (060,STR_TO_DATE('03-01-2023','%d-%m-%Y'),"Displayed",27891.95,90);
INSERT into PermanentCollection (PermanentID,DateOfAcquisition,DisplayStatus,AcquisitionCost,PaintingID) values (070,STR_TO_DATE('03-01-2023','%d-%m-%Y'),"Undisplayed",30000.99,31);
INSERT into PermanentCollection (PermanentID,DateOfAcquisition,DisplayStatus,AcquisitionCost,PaintingID) values (080,STR_TO_DATE('03-01-2019','%d-%m-%Y'),"Undisplayed",35001.75,41);
INSERT into PermanentCollection (PermanentID,DateOfAcquisition,DisplayStatus,AcquisitionCost,PaintingID) values (090,STR_TO_DATE('03-01-2019','%d-%m-%Y'),"Undisplayed",40000.90,51);


CREATE TABLE LoanCollection
    (LendingMuseumID INT(2),
        DateBorrowed DATE,
        ReturnDate DATE,
        PaintingID INT(2)
    );
ALTER TABLE LoanCollection ADD CONSTRAINT pk_LoanCollection_LendingMuseumID PRIMARY KEY (LendingMuseumID);
ALTER TABLE LoanCollection ADD CONSTRAINT fk_LoanCollection_PaintingID FOREIGN KEY (PaintingID) REFERENCES painting (PaintingID);

INSERT into LoanCollection (LendingMuseumID,DateBorrowed,ReturnDate,PaintingID) values (11,STR_TO_DATE('01-01-2019','%d-%m-%Y'),STR_TO_DATE('31-12-2021','%d-%m-%Y'),50);
INSERT into LoanCollection (LendingMuseumID,DateBorrowed,ReturnDate,PaintingID) values (12,STR_TO_DATE('01-06-2019','%d-%m-%Y'),STR_TO_DATE('30-10-2020','%d-%m-%Y'),30);
INSERT into LoanCollection (LendingMuseumID,DateBorrowed,ReturnDate,PaintingID) values (13,STR_TO_DATE('01-06-2022','%d-%m-%Y'),STR_TO_DATE('30-05-2023','%d-%m-%Y'),70);
INSERT into LoanCollection (LendingMuseumID,DateBorrowed,ReturnDate,PaintingID) values (14,STR_TO_DATE('01-06-2022','%d-%m-%Y'),STR_TO_DATE('31-10-2023','%d-%m-%Y'),21);
INSERT into LoanCollection (LendingMuseumID,DateBorrowed,ReturnDate,PaintingID) values (15,STR_TO_DATE('01-06-2022','%d-%m-%Y'),STR_TO_DATE('30-12-2023','%d-%m-%Y'),11);

CREATE TABLE Exhibition
    (ExhibitionID INT(2),
        CommencementDate DATE,
        EndDate DATE
    );
ALTER TABLE Exhibition ADD CONSTRAINT pk_Exhibitiom_ExhibitionID PRIMARY KEY (ExhibitionID);

INSERT into Exhibition (ExhibitionID,CommencementDate,EndDate) values (01,STR_TO_DATE('31-01-2019','%d-%m-%Y'),STR_TO_DATE('31-12-2021','%d-%m-%Y'));
INSERT into Exhibition (ExhibitionID,CommencementDate,EndDate) values (02,STR_TO_DATE('31-06-2020','%d-%m-%Y'),STR_TO_DATE('31-12-2020','%d-%m-%Y'));
INSERT into Exhibition (ExhibitionID,CommencementDate,EndDate) values (03,STR_TO_DATE('31-01-2022','%d-%m-%Y'),STR_TO_DATE('31-12-2023','%d-%m-%Y'));
INSERT into Exhibition (ExhibitionID,CommencementDate,EndDate) values (04,STR_TO_DATE('01-06-2022','%d-%m-%Y'),STR_TO_DATE('31-12-2023','%d-%m-%Y'));
INSERT into Exhibition (ExhibitionID,CommencementDate,EndDate) values (05,STR_TO_DATE('01-01-2023','%d-%m-%Y'),STR_TO_DATE('31-12-2023','%d-%m-%Y'));

CREATE TABLE PaintingAssigned
    (ExhibitionID INT(2),
       PaintingID INT(2)
    );
ALTER TABLE PaintingAssigned ADD CONSTRAINT pk_PaintingAssigned_ExhibitionID_PaintingID PRIMARY KEY (ExhibitionID,PaintingID);
ALTER TABLE PaintingAssigned ADD CONSTRAINT fk_PaintingAssigned_PaintingID FOREIGN KEY (PaintingID) REFERENCES painting (PaintingID);
ALTER TABLE PaintingAssigned ADD CONSTRAINT fk_PaintingAssigned_ExhibitionID FOREIGN KEY (ExhibitionID) REFERENCES Exhibition (ExhibitionID);
    
INSERT into PaintingAssigned (ExhibitionID,PaintingID) values (01,20);
INSERT into PaintingAssigned (ExhibitionID,PaintingID) values (01,30);
INSERT into PaintingAssigned (ExhibitionID,PaintingID) values (02,10);
INSERT into PaintingAssigned (ExhibitionID,PaintingID) values (03,20);
INSERT into PaintingAssigned (ExhibitionID,PaintingID) values (03,50);
INSERT into PaintingAssigned (ExhibitionID,PaintingID) values (03,90);
INSERT into PaintingAssigned (ExhibitionID,PaintingID) values (04,30);
INSERT into PaintingAssigned (ExhibitionID,PaintingID) values (04,10);
INSERT into PaintingAssigned (ExhibitionID,PaintingID) values (04,51);
INSERT into PaintingAssigned (ExhibitionID,PaintingID) values (05,40);
INSERT into PaintingAssigned (ExhibitionID,PaintingID) values (05,60);














