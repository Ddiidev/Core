module repository

import infradb
import features.contacts.errors
import features.contacts.entities

// contornando bug

pub fn insert(entitie entities.Contact) ! {
	mut dbase := infradb.ConnectionDb.new()!

	defer {
		dbase.close()
	}

	error_already_exist := errors.ErrorAlreadyExist{}
	sql dbase.conn {
		insert entitie into entities.Contact
	} or {
		if err.msg().contains('UNIQUE') {
			return error_already_exist
		}
	}
}
