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
	GROUP_CONCAT(ag.nachname, ',<br />') [auftraggeber],
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
	LEFT OUTER JOIN t_rel_person2projekt per2pro1 ON p.id = per2pro1.fk_projekt AND per2pro1.fk_rolle = 1
	LEFT OUTER JOIN t_data_person ag ON per2pro1.fk_person = ag.id
GROUP BY
	p.id,
	p.vorgänger,
	p.name,
	p.startdatum,
	strftime('%Y, ', p.startdatum) || (strftime('%m', p.startdatum)-1) || strftime(', %d', p.startdatum),
	p.enddatum,
	strftime('%Y, ', p.enddatum) || (strftime('%m', p.enddatum)-1) || strftime(', %d', p.enddatum),
    COALESCE(julianday(enddatum) - julianday(startdatum), 0),
	p.projektleiter,
	p.mitglieder,
	pr.name,
	k.name,
	s.name,
	p.fortschritt
;