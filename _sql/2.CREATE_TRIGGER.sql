CREATE TRIGGER trg_dataProjekt_insert
AFTER INSERT ON t_data_projekt
BEGIN
	INSERT INTO t_hist_projekt (event, projektID, vorgänger, name, startdatum, enddatum, auftraggeber, projektleiter, mitglieder, fk_priorität, fk_komplexität, fk_status, fortschritt)
	VALUES ('insert', new.id, new.vorgänger, new.name, new.startdatum, new.enddatum, new.auftraggeber, new.projektleiter, new.mitglieder, new.fk_priorität, new.fk_komplexität, new.fk_status, new.fortschritt);
END;

CREATE TRIGGER trg_dataProjekt_update
AFTER UPDATE ON t_data_projekt
BEGIN
	INSERT INTO t_hist_projekt (event, projektID, vorgänger, name, startdatum, enddatum, auftraggeber, projektleiter, mitglieder, fk_priorität, fk_komplexität, fk_status, fortschritt)
	VALUES ('update', new.id, new.vorgänger, new.name, new.startdatum, new.enddatum, new.auftraggeber, new.projektleiter, new.mitglieder, new.fk_priorität, new.fk_komplexität, new.fk_status, new.fortschritt);
END;

CREATE TRIGGER trg_dataProjekt_delete
AFTER DELETE ON t_data_projekt
BEGIN
	INSERT INTO t_hist_projekt (event, projektID, vorgänger, name, startdatum, enddatum, auftraggeber, projektleiter, mitglieder, fk_priorität, fk_komplexität, fk_status, fortschritt)
	VALUES ('delete', old.id, old.vorgänger, old.name, old.startdatum, old.enddatum, old.auftraggeber, old.projektleiter, old.mitglieder, old.fk_priorität, old.fk_komplexität, old.fk_status, old.fortschritt);
END;