module entities

import time
import features.contacts.models

@[table: 'Contacts']
pub struct Contact {
pub:
	id                      int     @[primary; serial]
	whatsapp                ?string @[unique]
	email                   ?string @[unique]
	updated_at              time.Time = time.now()
	latest_recomendation_at ?time.Time
	uuid_confirm_cancel     ?string
}

pub fn (c Contact) to_model() models.Contact {
	return models.Contact{
		id:                      c.id
		whatsapp:                c.whatsapp
		email:                   c.email
		updated_at:              c.updated_at
		latest_recomendation_at: c.latest_recomendation_at
		uuid_confirm_cancel:     c.uuid_confirm_cancel
	}
}
