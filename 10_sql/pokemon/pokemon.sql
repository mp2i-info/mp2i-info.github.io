

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
