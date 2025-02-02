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

---------------------------------------------------------
CREATE OR REPLACE FUNCTION verifica_treinador_npc() 
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.treinador_id IN (SELECT treinador_id FROM PC) THEN
        RAISE EXCEPTION 'Treinador já existe como PC';
    ELSIF NEW.treinador_id IN (SELECT treinador_id FROM lider) THEN
        RAISE EXCEPTION 'Treinador já existe como Líder';
    ELSIF NEW.treinador_id NOT IN (SELECT treinador_id FROM Treinador) THEN
        RAISE EXCEPTION 'Treinador precisa primeiro ser adicionado a tabela Treinador'
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER insercao_npc
BEFORE INSERT ON NPC
FOR EACH ROW
EXECUTE FUNCTION verifica_treinador_npc();

--------------------------------------------------------
CREATE OR REPLACE FUNCTION verifica_treinador_lider() 
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.treinador_id IN (SELECT treinador_id FROM PC) THEN
        RAISE EXCEPTION 'Treinador já existe como PC';
    ELSIF NEW.treinador_id IN (SELECT treinador_id FROM NPC) THEN
        RAISE EXCEPTION 'Treinador já existe como NPC';
    ELSIF NEW.treinador_id NOT IN (SELECT treinador_id FROM Treinador) THEN
        RAISE EXCEPTION 'Treinador precisa primeiro ser adicionado a tabela Treinador'
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER insercao_lider
BEFORE INSERT ON lider
FOR EACH ROW
EXECUTE FUNCTION verifica_treinador_lider();

--------------------------------------------------------
-- Triggers para deletar o treinador quando sua especialização for deletada
CREATE OR REPLACE FUNCTION deleta_treinador_pc()
RETURNS TRIGGER AS $$
BEGIN
    IF OLD.treinador_id IN (SELECT treinador_id FROM PC) THEN
        DELETE FROM treinador WHERE treinador_id = OLD.treinador_id;
    END IF;
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER delete_pc
AFTER DELETE ON PC
FOR EACH ROW
EXECUTE FUNCTION deleta_treinador_pc();

--------------------------------------------------------
CREATE OR REPLACE FUNCTION deleta_treinador_npc()
RETURNS TRIGGER AS $$
BEGIN
    IF OLD.treinador_id IN (SELECT treinador_id FROM NPC) THEN
        DELETE FROM treinador WHERE treinador_id = OLD.treinador_id;
    END IF;
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER delete_npc
AFTER DELETE ON NPC
FOR EACH ROW
EXECUTE FUNCTION deleta_treinador_npc();

--------------------------------------------------------
CREATE OR REPLACE FUNCTION deleta_treinador_lider()
RETURNS TRIGGER AS $$
BEGIN
    IF OLD.treinador_id IN (SELECT treinador_id FROM lider) THEN
        DELETE FROM treinador WHERE treinador_id = OLD.treinador_id;
    END IF;
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER delete_lider
AFTER DELETE ON lider
FOR EACH ROW
EXECUTE FUNCTION deleta_treinador_lider();

-------------------------------------------------------------
-- Trigger para deletar a especialização quando um treinador for deletado
CREATE OR REPLACE FUNCTION deleta_especializacao_treinador()
RETURNS TRIGGER AS $$
BEGIN
    IF OLD.treinador_id IN (SELECT treinador_id FROM PC) THEN
        DELETE FROM PC WHERE treinador_id = OLD.treinador_id;
    ELSIF OLD.treinador_id IN (SELECT treinador_id FROM NPC) THEN
        DELETE FROM NPC WHERE treinador_id = OLD.treinador_id;
    ELSIF OLD.treinador_id IN (SELECT treinador_id FROM lider) THEN
        DELETE FROM lider WHERE treinador_id = OLD.treinador_id;
    END IF;
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER delete_treinador
BEFORE DELETE ON treinador
FOR EACH ROW
EXECUTE FUNCTION deleta_especializacao_treinador();

------------------------------------------------------------

CREATE OR REPLACE FUNCTION verifica_local_pokecenter() 
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.local_id IN (SELECT local_id FROM Ginasio) THEN
        RAISE EXCEPTION 'Local já existe como Ginásio';
    ELSIF NEW.local_id IN (SELECT local_id FROM Pokemart) THEN
        RAISE EXCEPTION 'Local já existe como Pokemart';
    ELSIF NEW.local_id IN (SELECT local_id FROM Caminho) THEN
        RAISE EXCEPTION 'Local já existe como Caminho';
    ELSIF NEW.local_id IN (SELECT local_id FROM Zona_de_captura) THEN
        RAISE EXCEPTION 'Local já existe como Zona de Captura';
    ELSIF NEW.local_id NOT IN (SELECT local_id FROM Local_) THEN
        RAISE EXCEPTION 'Local precisa primeiro ser adicionado a tabela Local_';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER insercao_pokecenter
BEFORE INSERT ON Pokecenter
FOR EACH ROW
EXECUTE FUNCTION verifica_local_pokecenter();

CREATE OR REPLACE FUNCTION verifica_local_ginasio() 
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.local_id IN (SELECT local_id FROM Pokecenter) THEN
        RAISE EXCEPTION 'Local já existe como Pokecenter';
    ELSIF NEW.local_id IN (SELECT local_id FROM Pokemart) THEN
        RAISE EXCEPTION 'Local já existe como Pokemart';
    ELSIF NEW.local_id IN (SELECT local_id FROM Caminho) THEN
        RAISE EXCEPTION 'Local já existe como Caminho';
    ELSIF NEW.local_id IN (SELECT local_id FROM Zona_de_captura) THEN
        RAISE EXCEPTION 'Local já existe como Zona de Captura';
    ELSIF NEW.local_id NOT IN (SELECT local_id FROM Local_) THEN
        RAISE EXCEPTION 'Local precisa primeiro ser adicionado a tabela Local_';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER insercao_ginasio
BEFORE INSERT ON Ginasio
FOR EACH ROW
EXECUTE FUNCTION verifica_local_ginasio();

CREATE OR REPLACE FUNCTION verifica_local_pokemart() 
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.local_id IN (SELECT local_id FROM Pokecenter) THEN
        RAISE EXCEPTION 'Local já existe como Pokecenter';
    ELSIF NEW.local_id IN (SELECT local_id FROM Ginasio) THEN
        RAISE EXCEPTION 'Local já existe como Ginásio';
    ELSIF NEW.local_id IN (SELECT local_id FROM Caminho) THEN
        RAISE EXCEPTION 'Local já existe como Caminho';
    ELSIF NEW.local_id IN (SELECT local_id FROM Zona_de_captura) THEN
        RAISE EXCEPTION 'Local já existe como Zona de Captura';
    ELSIF NEW.local_id NOT IN (SELECT local_id FROM Local_) THEN
        RAISE EXCEPTION 'Local precisa primeiro ser adicionado a tabela Local_';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER insercao_pokemart
BEFORE INSERT ON Pokemart
FOR EACH ROW
EXECUTE FUNCTION verifica_local_pokemart();

CREATE OR REPLACE FUNCTION verifica_local_caminho() 
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.local_id IN (SELECT local_id FROM Pokecenter) THEN
        RAISE EXCEPTION 'Local já existe como Pokecenter';
    ELSIF NEW.local_id IN (SELECT local_id FROM Ginasio) THEN
        RAISE EXCEPTION 'Local já existe como Ginásio';
    ELSIF NEW.local_id IN (SELECT local_id FROM Pokemart) THEN
        RAISE EXCEPTION 'Local já existe como Pokemart';
    ELSIF NEW.local_id IN (SELECT local_id FROM Zona_de_captura) THEN
        RAISE EXCEPTION 'Local já existe como Zona de Captura';
    ELSIF NEW.local_id NOT IN (SELECT local_id FROM Local_) THEN
        RAISE EXCEPTION 'Local precisa primeiro ser adicionado a tabela Local_';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER insercao_caminho
BEFORE INSERT ON Caminho
FOR EACH ROW
EXECUTE FUNCTION verifica_local_caminho();

CREATE OR REPLACE FUNCTION verifica_local_zona_captura() 
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.local_id IN (SELECT local_id FROM Pokecenter) THEN
        RAISE EXCEPTION 'Local já existe como Pokecenter';
    ELSIF NEW.local_id IN (SELECT local_id FROM Ginasio) THEN
        RAISE EXCEPTION 'Local já existe como Ginásio';
    ELSIF NEW.local_id IN (SELECT local_id FROM Pokemart) THEN
        RAISE EXCEPTION 'Local já existe como Pokemart';
    ELSIF NEW.local_id IN (SELECT local_id FROM Caminho) THEN
        RAISE EXCEPTION 'Local já existe como Caminho';
    ELSIF NEW.local_id NOT IN (SELECT local_id FROM Local_) THEN
        RAISE EXCEPTION 'Local precisa primeiro ser adicionado a tabela Local_';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER insercao_zona_captura
BEFORE INSERT ON Zona_de_captura
FOR EACH ROW
EXECUTE FUNCTION verifica_local_zona_captura();



