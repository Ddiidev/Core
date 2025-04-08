module repository

import infradb
import features.amazon.entities

pub fn import(entitie entities.AmazonProduct) ! {
	mut dbase := infradb.ConnectionDb.new()!

	defer {
		dbase.close()
	}

	sql dbase.conn {
		insert entitie into entities.AmazonProduct
	}!
}
