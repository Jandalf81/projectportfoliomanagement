CREATE VIEW v_ppm AS 
SELECT
	p.id,
	p.vorgänger,
	p.name,
	p.startdatum,
	p.enddatum,
	p.auftraggeber,
	p.projektleiter,
	p.mitglieder,
	pr.name [priorität],
	k.name [komplexität],
	s.name [status],
	p.fortschritt
FROM
	t_data_projekt p
	INNER JOIN t_list_priorität pr ON p.fk_priorität = pr.id
	INNER JOIN t_list_komplexität k ON p.fk_komplexität = k.id
	INNER JOIN t_list_status s ON p.fk_status = s.id
;

CREATE VIEW v_ppm_php AS
SELECT
	p.id,
	p.vorgänger,
	p.name,
	p.startdatum,
	strftime('%Y, ', p.startdatum) || (strftime('%m', p.startdatum)-1) || strftime(', %d', p.startdatum) startdatum_php,
	p.enddatum,
	strftime('%Y, ', p.enddatum) || (strftime('%m', p.enddatum)-1) || strftime(', %d', p.enddatum) enddatum_php,
    COALESCE(julianday(enddatum) - julianday(startdatum), 0) dauer,
	(SELECT liste FROM v_personen2projekt p2p WHERE fk_projekt = p.id AND fk_rolle = 1) [auftraggeber],
	(SELECT liste FROM v_personen2projekt p2p WHERE fk_projekt = p.id AND fk_rolle = 2) [projektleiter],
	(SELECT liste FROM v_personen2projekt p2p WHERE fk_projekt = p.id AND fk_rolle = 3) [mitglieder],
	pr.name [priorität],
	k.name [komplexität],
	s.name [status],
	p.fortschritt
FROM
	t_data_projekt p
	INNER JOIN t_list_priorität pr ON p.fk_priorität = pr.id
	INNER JOIN t_list_komplexität k ON p.fk_komplexität = k.id
	INNER JOIN t_list_status s ON p.fk_status = s.id
GROUP BY
	p.id,
	p.vorgänger,
	p.name,
	p.startdatum,
	strftime('%Y, ', p.startdatum) || (strftime('%m', p.startdatum)-1) || strftime(', %d', p.startdatum),
	p.enddatum,
	strftime('%Y, ', p.enddatum) || (strftime('%m', p.enddatum)-1) || strftime(', %d', p.enddatum),
    COALESCE(julianday(enddatum) - julianday(startdatum), 0),
	pr.name,
	k.name,
	s.name,
	p.fortschritt
;

CREATE VIEW v_personen2projekt AS
SELECT 
	fk_projekt,
	fk_rolle,
	GROUP_CONCAT(nachname || ', ' || vorname, ',<br />') [liste]
FROM (
	SELECT
		p2p.fk_projekt,
		p2p.fk_rolle,
		p.nachname,
		p.vorname
	FROM 
		t_rel_person2projekt p2p
		INNER JOIN t_data_person p ON p2p.fk_person = p.id
	ORDER BY
		p.nachname,
		p.vorname
)
GROUP BY
	fk_projekt,
	fk_rolle
;