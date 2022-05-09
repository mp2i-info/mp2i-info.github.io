

CREATE TABLE pokemons (
	id,
	nom TEXT,
	PRIMARY KEY(id)
);

CREATE TABLE evolue_en (
	pokemon_base_id int NOT NULL,
	pokemon_evol_id int NOT NULL,
	niveau int NOT NULL,
	FOREIGN KEY(pokemon_base_id) REFERENCES pokemons(id),
	FOREIGN KEY(pokemon_evol_id) REFERENCES pokemons(id)
);

CREATE TABLE types (
	id SERIAL NOT NULL,
	libelle varchar(10) NOT NULL,
	PRIMARY KEY(id)
);



CREATE TABLE est_type (
	pokemon_id int NOT NULL,
	type_id int NOT NULL,
	FOREIGN KEY(pokemon_id) REFERENCES pokemons(id),
	FOREIGN KEY(type_id) REFERENCES types(id)
);
	

CREATE TABLE dresseurs (
	id SERIAL NOT NULL,
	nom varchar(25) NOT NULL,
	PRIMARY KEY(id)
);




CREATE TABLE detient_pokemons (
	dresseur_id int NOT NULL, 
	pokemon_id int NOT NULL,  
	niveau int NOT NULL,
	FOREIGN KEY(dresseur_id) REFERENCES dresseurs(id),
	FOREIGN KEY(pokemon_id) REFERENCES pokemons(id)
);



CREATE TABLE attaques (
	id SERIAL NOT NULL,
	libelle varchar(50) NOT NULL,
	type_id int NOT NULL,
	pp int NOT NULL,
	puissance int NULL,
	precision int NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY(type_id) REFERENCES types(id)
);
