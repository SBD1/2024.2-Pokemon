CREATE OR REPLACE FUNCTION verifica_item_pokebola() 
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.item_id NOT IN (SELECT item_id FROM item) THEN
        RAISE EXCEPTION 'Pokebola não foi inserida na tabela item, insira primeiro em Item e depois em Pokebola';
    ELSE IF NEW.item IN (SELECT item_id FROM Utilitario) THEN
        RAISE EXCEPTION 'Pokebola não pode ser inserida pois item já existem em Utilitario';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER insercao_pokebola
BEFORE INSERT ON Pokebola
FOR EACH ROW
EXECUTE FUNCTION verifica_item_pokebola():

-------------------------------------------------------------
CREATE OR REPLACE FUNCTION verifica_item_utilitario() 
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.item_id NOT IN (SELECT item_id FROM item) THEN
        RAISE EXCEPTION 'Utilitario não foi inserido na tabela item, insira primeiro em Item e depois em Utilitario';
    ELSE IF NEW.item IN (SELECT item_id FROM Pokebola) THEN
        RAISE EXCEPTION 'Utilitario não pode ser inserido pois item já existe em Pokebola';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER insercao_utilitario
BEFORE INSERT ON Utilitario
FOR EACH ROW
EXECUTE FUNCTION verifica_item_utilitario();

-------------------------------------------------------------
CREATE OR REPLACE FUNCTION deleta_item_pokebola()
RETURNS TRIGGER AS $$
BEGIN
    DELETE FROM item WHERE item_id = OLD.item_id;
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER delete_pokebola 
AFTER DELETE ON Pokebola
FOR EACH ROW
EXECUTE FUNCTION deleta_item_pokebola();

---------------------------------------------------------------
CREATE OR REPLACE FUNCTION deleta_item_utilitario()
RETURNS TRIGGER AS $$
BEGIN
    DELETE FROM item WHERE item_id = OLD.item_id;
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER delete_utilitario
AFTER DELETE ON Utilitario 
FOR EACH ROW
EXECUTE FUNCTION deleta_item_utilitario();

-------------------------------------------------------
CREATE OR REPLACE FUNCTION deleta_item()
RETURNS TRIGGER AS $$
BEGIN 
    IF OLD.item_id IN (SELECT item_id FROM Utilitario) THEN 
        DELETE FROM Utilitario WHERE item_id = OLD.item_id;
    ELSE IF OLD.item_id IN (SELECT item_id FROM Pokebola) THEN
        DELETE FROM Pokebola WHERE item_id = OLD.item_id;
    END IF;
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_deleta_intem
AFTER DELETE ON item
FOR EACH ROW
EXECUTE FUNCTION deleta_item();

--------------------------------------------------------
CREATE OR REPLACE FUNCTION verifica_treinador_pc() 
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.treinador_id IN (SELECT treinador_id FROM NPC) THEN
        RAISE EXCEPTION 'PC já existe como NPC';
    ELSIF NEW.treinador_id IN (SELECT treinador_id FROM lider) THEN
        RAISE EXCEPTION 'PC já existe como Líder';
    ELSIF NEW.treinador_id NOT IN (SELECT treinador_id FROM Treinador) THEN
        RAISE EXCEPTION 'PC precisa primeiro ser adicionado a tabela Treinador'
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER insercao_pc
BEFORE INSERT ON PC
FOR EACH ROW
EXECUTE FUNCTION verifica_treinador_pc();

