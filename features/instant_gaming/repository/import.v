module repository

import infradb
import features.instant_gaming.entities

pub fn import(entitie entities.InstantGamingProduct) ! {
	mut dbase := infradb.ConnectionDb.new()!
	defer {
		dbase.close()
	}

	sql dbase.conn {
		insert entitie into entities.InstantGamingProduct
	}!
}
