module entities

import time
import features.raffle_gift.models

// RaffleGift represents a tabela que vincula um cartão de presente a um contato <br/>
// Deve-se estar atento que o cartão de presente deve estar ativo <br/>
// E não pode haver mais de um cartão de presente vinculado a um contato
@[table: 'RaffleGifts']
pub struct RaffleGift {
pub:
	id           int @[primary; sql: serial]
	gift_card_id int @[unique]
	contact_id   int
	updated_at   time.Time = time.now() @[omitempty; sql_type: 'TIMESTAMP']
}

pub fn (rg RaffleGift) to_model() models.RaffleGift {
	return models.RaffleGift{
		id: rg.id
		gift_card_id: rg.gift_card_id
		contact_id: rg.contact_id
		updated_at: rg.updated_at
	}
}
