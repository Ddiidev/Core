module models

import time

pub struct GiftCard {
pub:
	id            int
	code          string
	plataform     string
	updated_at    time.Time
}