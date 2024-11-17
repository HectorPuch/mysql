USE db_buffet_advocats;

SHOW CREATE TABLE assumptes;
SHOW CREATE TABLE assumptes_procuradors;

ALTER TABLE assumptes DROP CONSTRAINT assumptes_ibfk_1;
ALTER TABLE assumptes_procuradors DROP CONSTRAINT assumptes_procuradors_ibfk_1;
ALTER TABLE assumptes_procuradors DROP CONSTRAINT assumptes_procuradors_ibfk_2;

SHOW CREATE TABLE assumptes;
SHOW CREATE TABLE assumptes_procuradors;
