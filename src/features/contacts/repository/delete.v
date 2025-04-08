module repository

import infradb
import features.contacts.entities

pub fn delete_whatsapp(number string) ! {
	mut dbase := infradb.ConnectionDb.new()!

	defer {
		dbase.close()
	}

	sql dbase.conn {
		delete from entities.Contact where whatsapp == number
	}!
}

pub fn delete_email(email string) ! {
	mut dbase := infradb.ConnectionDb.new()!

	defer {
		dbase.close()
	}

	sql dbase.conn {
		delete from entities.Contact where email == email
	}!
}
