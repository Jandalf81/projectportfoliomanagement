INSERT INTO t_list_priorität (id, name) VALUES
(1, 'niedrig'),
(2, 'mittel'),
(3, 'hoch'),
(4, 'kritisch');

INSERT INTO t_list_komplexität (id, name) VALUES
(1, 'XXS'),
(2, 'XS'),
(3, 'S'),
(4, 'M'),
(5, 'L'),
(6, 'XL'),
(7, 'XXL');

INSERT INTO t_list_status (id, name) VALUES
(1, 'Vorschlag'),
(2, 'abgewiesen'),
(3, 'freigegeben'),
(4, 'eingeplant'),
(5, 'in Arbeit'),
(6, 'abgeschlossen');

INSERT INTO t_list_rolle (id, name) VALUES
(1, 'Auftraggeber'),
(2, 'Projektleiter'),
(3, 'Team-Mitglied');

INSERT INTO t_data_projekt (vorgänger, name, startdatum, enddatum, fk_priorität, fk_komplexität, fk_status, fortschritt) VALUES
(NULL, '[helpLine] Scope 3a', '2020-01-01', '2020-06-30', 2, 3, 5, 40),
(1, '[helpLine] Scope 3b', '2020-03-01', '2020-08-30', 1, 4, 5, 20),
(2, '[helpLine] Scope 3c', '2020-09-01', '2020-12-31', 1, 3, 4, 0),
(NULL, '[Applikation] Ablösung inLoox', NULL, NULL, 1, 3, 3, 0)

INSERT INTO t_rel_projekt2projekt (fk_parent, fk_sub) VALUES
(1, 2),
(2, 3);