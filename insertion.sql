DECLARE
	tmp	NUMBER(5);
BEGIN

tmp := seq_util.NEXTVAL;
INSERT INTO UTILISATEUR
       (Id_U, Prenom,	     Nom,	Code_postal_U, Email,			Tel)
VALUES (tmp,  'Lous-Félix',  'Vachon',	'H4A2L5',      'lfa-sav@hotmail.com',	'514-123-1221');

tmp := seq_util.NEXTVAL;
INSERT INTO UTILISATEUR
       (Id_U, Prenom,	Nom,		Code_postal_U, Email,			Tel)
VALUES (tmp,  'Jean',	'Jacques',	'H2A9N3',      'jj@hotmail.com',	'514-323-9281');

tmp := seq_util.NEXTVAL;
INSERT INTO UTILISATEUR
       (Id_U, Prenom,	Nom,		Code_postal_U, Email,			Tel)
VALUES (tmp,  'Marc',	'Arcand',	'H3B2K4',      'marco@hotmail.com',	'514-902-1923');

END;
/
