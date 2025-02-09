USE [ASM1]
GO
CREATE TABLE MaturitySize_DIM (
	MaturitySizeID int IDENTITY(1,1) NOT NULL,
	MaturitySize varchar(13) NOT NULL,
	CONSTRAINT PK_MaturitySize_DIM PRIMARY KEY CLUSTERED (MaturitySizeID)
)
GO
CREATE TABLE Type_DIM (
	TypeID int IDENTITY(1,1) NOT NULL,
	Type varchar(3) NOT NULL,
	CONSTRAINT PK_Type_DIM PRIMARY KEY CLUSTERED (TypeID)
)
GO
CREATE TABLE Breed_DIM (
	BreedID int IDENTITY(1,1) NOT NULL,
	Breed varchar(255) NOT NULL,
	CONSTRAINT PK_Breed_DIM PRIMARY KEY CLUSTERED (BreedID)
)
GO
CREATE TABLE Gender_DIM (
	GenderID int IDENTITY(1,1) NOT NULL,
	Gender varchar(6) NOT NULL,
	CONSTRAINT PK_Gender_DIM PRIMARY KEY CLUSTERED (GenderID)
)
GO
CREATE TABLE Color_DIM (
	ColorID int IDENTITY(1,1) NOT NULL,
	Color varchar(255) NOT NULL,
	CONSTRAINT PK_Color_DIM PRIMARY KEY CLUSTERED (ColorID)
)
GO
CREATE TABLE FurLength_DIM (
	FurLengthID int IDENTITY(1,1) NOT NULL,
	FurLength varchar(13) NOT NULL,
	CONSTRAINT PK_FurLength_DIM PRIMARY KEY CLUSTERED (FurLengthID)
)
GO
CREATE TABLE State_DIM (
	StateID int IDENTITY(1,1) NOT NULL,
	State varchar(255) NOT NULL,
	CONSTRAINT PK_State_DIM PRIMARY KEY CLUSTERED (StateID)
)
GO
CREATE TABLE Health_DIM (
	HealthID int IDENTITY(1,1) NOT NULL,
	Vaccinated varchar(8) NOT NULL,
	Dewormed varchar(8) NOT NULL,
	Sterilized varchar(8) NOT NULL,
	Health varchar(14) NOT NULL,
	CONSTRAINT PK_Health_DIM PRIMARY KEY CLUSTERED (HealthID)
)
GO
 -- Fact table
CREATE TABLE Pet_Fact (
	-- Surrogate primary key
	PeturID int IDENTITY(1,1) NOT NULL,
	-- Foreign key
	TypeID int NOT NULL,
	Breed1ID int NOT NULL,
	Breed2ID int NOT NULL,
	GenderID int NOT NULL,
	Color1ID int NOT NULL,
	Color2ID int NOT NULL,
	Color3ID int NOT NULL,
	MaturitySizeID int NOT NULL,
	FurLengthID int NOT NULL,
	HealthID int NOT NULL,
	StateID int NOT NULL,
	-- Fact
	PetID int NOT NULL,
	Age int NOT NULL,
	Quantity int NOT NULL,
	Fee int NOT NULL,
	RescuerID int NOT NULL
	-- constraint PK
	CONSTRAINT PK_Pet_Fact PRIMARY KEY CLUSTERED (PeturID),
	-- constraint FK
	CONSTRAINT PK_Pet_Fact_Type_DIM FOREIGN KEY (TypeID)
		REFERENCES Type_DIM (TypeID)
		ON DELETE CASCADE
		ON UPDATE CASCADE , 
	CONSTRAINT PK_Pet_Fact_Breed1ID FOREIGN KEY (Breed1ID)
		REFERENCES Breed_DIM (BreedID)
		ON DELETE CASCADE
		ON UPDATE CASCADE , 
	CONSTRAINT PK_Pet_Fact_Breed2ID FOREIGN KEY (Breed2ID)
		REFERENCES Breed_DIM (BreedID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION ,
	CONSTRAINT PK_Pet_Fact_GenderID FOREIGN KEY (GenderID)
		REFERENCES Gender_DIM (GenderID)
		ON DELETE CASCADE
		ON UPDATE CASCADE , 
	CONSTRAINT PK_Pet_Fact_Color1ID FOREIGN KEY (Color1ID)
		REFERENCES Color_DIM (ColorID)
		ON DELETE CASCADE
		ON UPDATE CASCADE , 
	CONSTRAINT PK_Pet_Fact_Color2ID FOREIGN KEY (Color2ID)
		REFERENCES Color_DIM (ColorID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION , 
	CONSTRAINT PK_Pet_Fact_Color3ID FOREIGN KEY (Color3ID)
		REFERENCES Color_DIM (ColorID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION , 
	CONSTRAINT PK_Pet_Fact_MaturitySizeID FOREIGN KEY (MaturitySizeID)
		REFERENCES MaturitySize_DIM (MaturitySizeID)
		ON DELETE CASCADE
		ON UPDATE CASCADE , 
	CONSTRAINT PK_Pet_Fact_FurLengthID FOREIGN KEY (FurLengthID)
		REFERENCES FurLength_DIM (FurLengthID)
		ON DELETE CASCADE
		ON UPDATE CASCADE , 
	CONSTRAINT PK_Pet_Fact_HealthID FOREIGN KEY (HealthID)
		REFERENCES Health_DIM (HealthID)
		ON DELETE CASCADE
		ON UPDATE CASCADE , 
	CONSTRAINT PK_Pet_Fact_StateID FOREIGN KEY (StateID)
		REFERENCES State_DIM (StateID)
		ON DELETE CASCADE
		ON UPDATE CASCADE ,  
)
GO
