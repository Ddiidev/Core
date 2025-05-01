module models

import time

pub struct RaffleGift {
pub:
	id           int
	gift_card_id int
	contact_id   int
	updated_at   time.Time
}