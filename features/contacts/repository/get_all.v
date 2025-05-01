module repository

import orm
import rand
import utils
import infradb
import features.contacts.entities

// get_all returona todos os contatos que não foram atualizados do dia de ontem até a hora atual.
pub fn get_all_non_updated(current_id int) []entities.Contact {
	mut db := infradb.ConnectionDb.new() or { return [] }

	defer {
		db.close()
	}

	// max := current_id + 100
	start, _ := utils.get_date_start_and_end()

	return sql db.conn {
		select from entities.Contact where (latest_recomendation_at is none
		|| latest_recomendation_at < start)
	} or { return [] }
}

// get_rand retorna um contato aleatório.
// Utilizado apenas para realizar sorteio.
pub fn get_rand() ?entities.Contact {
	mut db := infradb.ConnectionDb.new() or { return none }

	defer {
		db.close()
	}

	rand_id := db.get_pg().q_int('SELECT * FROM "Contacts" ORDER BY RANDOM() LIMIT 1;') or { return none }

	res := sql db.conn {
		select from entities.Contact where id == rand_id limit 1
	} or { return none }

	return res[0] or { none }
}
