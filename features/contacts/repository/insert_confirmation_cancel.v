module repository

import infradb
import features.contacts.entities

pub fn insert_confirmation_cancel(contact string, uuid string) ! {
	mut dbase := infradb.ConnectionDb.new()!

	defer {
		dbase.close()
	}

	sql dbase.conn {
		update entities.Contact set uuid_confirm_cancel = uuid where whatsapp == contact
		|| email == contact
	}!
}
