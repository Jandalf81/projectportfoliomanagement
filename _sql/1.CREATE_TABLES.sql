CREATE TABLE t_data_projekt (
	id INTEGER PRIMARY KEY,
	vorgänger TEXT,
	name TEXT,
	startdatum DATE,
	enddatum DATE,
	auftraggeber TEXT,
	projektleiter TEXT,
	mitglieder TEXT,
	fk_priorität INTEGER NULL,
	fk_komplexität INTEGER NULL,
	fk_status INTEGER NULL,
	fortschritt INTEGER DEFAULT 0,
	
	FOREIGN KEY(fk_priorität) REFERENCES t_list_priorität(id),
	FOREIGN KEY(fk_komplexität) REFERENCES t_list_komplexität(id),
	FOREIGN KEY(fk_status) REFERENCES t_list_status(id)
);

CREATE TABLE t_hist_projekt (
	id INTEGER PRIMARY KEY,
	event TEXT,
	timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
	projektID INTEGER,
	vorgänger TEXT,
	name TEXT,
	startdatum DATE,
	enddatum DATE,
	auftraggeber TEXT,
	projektleiter TEXT,
	mitglieder TEXT,
	fk_priorität INTEGER NULL,
	fk_komplexität INTEGER NULL,
	fk_status INTEGER NULL,
	fortschritt INTEGER DEFAULT 0,
	
	FOREIGN KEY(fk_priorität) REFERENCES t_list_priorität(id),
	FOREIGN KEY(fk_komplexität) REFERENCES t_list_komplexität(id),
	FOREIGN KEY(fk_status) REFERENCES t_list_status(id)
);

CREATE TABLE t_list_priorität (
	id INTEGER PRIMARY KEY,
	name TEXT
);

CREATE TABLE t_list_komplexität (
	id INTEGER PRIMARY KEY,
	name TEXT
);

CREATE TABLE t_list_status (
	id INTEGER PRIMARY KEY,
	name TEXT
);

CREATE TABLE t_rel_person2projekt (
	id INTEGER PRIMARY KEY,
	fk_person INTEGER NOT NULL,
	fk_projekt INTEGER NOT NULL,
	fk_rolle INTEGER NOT NULL,
	
	FOREIGN KEY(fk_person) REFERENCES t_data_person(id),
	FOREIGN KEY(fk_projekt) REFERENCES t_data_projekt(id),
	FOREIGN KEY(fk_rolle) REFERENCES t_list_rolle(id)
);

CREATE TABLE t_data_person (
	id INTEGER PRIMARY KEY,
	vorname TEXT,
	nachname TEXT NOT NULL
);

CREATE TABLE t_list_rolle (
	id INTEGER PRIMARY KEY,
	name TEXT NOT NULL
);

CREATE TABLE t_rel_projekt2projekt (
	id INTEGER PRIMARY KEY,
	fk_parent INTEGER NOT NULL,
	fk_sub INTEGER NOT NULL,
	
	FOREIGN KEY(fk_parent) REFERENCES t_data_projekt(id),
	FOREIGN KEY(fk_sub) REFERENCES t_data_projekt(id)
);

CREATE TABLE t_conf_nummer (
   jahr INTEGER NOT NULL,
   lastNumber INTEGER NOT NULL
);