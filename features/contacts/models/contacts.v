module models

import time

pub struct Contact {
pub:
	id                      int
	whatsapp                ?string
	email                   ?string
	updated_at              time.Time
	latest_recomendation_at ?time.Time
	uuid_confirm_cancel     ?string
}