module repository

import infradb
import features.netflix.entities

pub fn import(entitie entities.NetflixProduct) ! {
	mut db := infradb.ConnectionDb.new()!
	defer {
		db.close()
	}

	sql db.conn {
		insert entitie into entities.NetflixProduct
	}!
}
