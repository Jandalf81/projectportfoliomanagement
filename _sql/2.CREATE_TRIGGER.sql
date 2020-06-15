CREATE TRIGGER trg_dataProjekt_insert
AFTER INSERT ON t_data_projekt
BEGIN
	INSERT INTO t_hist_projekt (event, user, projektID, nummer, kontext, name, startdatum, enddatum, fk_priorität, fk_komplexität, fk_status, fortschritt)
	VALUES ('insert', new.lastUpdatedBy, new.id, new.nummer, new.kontext, new.name, new.startdatum, new.enddatum, new.fk_priorität, new.fk_komplexität, new.fk_status, new.fortschritt);
END;

CREATE TRIGGER trg_dataProjekt_update
AFTER UPDATE ON t_data_projekt
BEGIN
	INSERT INTO t_hist_projekt (event, user, projektID, nummer, kontext, name, startdatum, enddatum, fk_priorität, fk_komplexität, fk_status, fortschritt)
	VALUES ('update', new.lastUpdatedBy, new.id, new.nummer, new.kontext, new.name, new.startdatum, new.enddatum, new.fk_priorität, new.fk_komplexität, new.fk_status, new.fortschritt);
END;

CREATE TRIGGER trg_dataProjekt_delete
AFTER DELETE ON t_data_projekt
BEGIN
	INSERT INTO t_hist_projekt (event, user, projektID, nummer, kontext, name, startdatum, enddatum, fk_priorität, fk_komplexität, fk_status, fortschritt)
	VALUES ('delete', old.lastUpdatedBy, old.id, old.nummer, old.kontext, old.name, old.startdatum, old.enddatum, old.fk_priorität, old.fk_komplexität, old.fk_status, old.fortschritt);
END;