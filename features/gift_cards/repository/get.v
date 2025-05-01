module repository

import infradb
import features.gift_cards.entities

// get_first_active returns Pega o primeiro cartão de presente ativo.
// Retorna none se não houver cartões de presente ativos.
pub fn get_first_active() ?entities.GiftCard {
	mut db := infradb.ConnectionDb.new() or { return none }

	defer {
		db.close()
	}

	res := sql db.conn {
		select from entities.GiftCard where is_active == true limit 1
	} or { return none }

	return res[0] or { return none }
}
