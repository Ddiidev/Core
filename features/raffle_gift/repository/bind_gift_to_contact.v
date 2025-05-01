module repository

import infradb
import features.contacts.entities as contact_entities
import features.raffle_gift.entities as raffle_gift_entities
import features.gift_cards.entities as gift_cards_entities
import features.gift_cards.repository as gift_cards_repository

// bind_gift_to_contact Vincula um cartão de presente a um contato
// Retorna o cartão de presente vinculado ou none se não houver cartão de presente disponível ou se ocorrer algum erro na inclusão dos dados na tabela "RaffleGift"
pub fn bind_gift_to_contact(contact contact_entities.Contact) ?gift_cards_entities.GiftCard {
	mut db := infradb.ConnectionDb.new() or { return none }

	defer {
		db.close()
	}

	gift_card := gift_cards_repository.get_first_active() or { return none }

	data := raffle_gift_entities.RaffleGift{
		contact_id:   contact.id
		gift_card_id: gift_card.id
	}

	sql db.conn {
		insert data into raffle_gift_entities.RaffleGift
	} or { return none }

	return gift_card
}
