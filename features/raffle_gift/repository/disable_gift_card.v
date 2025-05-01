module repository

import infradb
import features.gift_cards.entities as gift_cards_entities

// disable_gift_card disativa um cartão de presente
pub fn disable_gift_card(gift_card gift_cards_entities.GiftCard)! {
	mut db := infradb.ConnectionDb.new()!

	defer {
		db.close()
	}

	sql db.conn {
		update gift_cards_entities.GiftCard set is_active = false where id == gift_card.id
	}!
}