module entities

import time
import features.gift_cards.models

@[table: 'GiftCards']
pub struct GiftCard {
pub:
	id            int @[primary; serial]
	code          string
	plataform     string
	description   string
	image_link    string
	is_active     bool
	updated_at    time.Time = time.now() @[omitempty; sql_type: 'TIMESTAMP']
}

pub fn (gc GiftCard) to_model() models.GiftCard {
	return models.GiftCard{
		id: gc.id
		code: gc.code
		plataform: gc.plataform
		updated_at: gc.updated_at
	}
}
