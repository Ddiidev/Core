module repository

import infradb
import features.mercado_livre_play.entities

pub fn import(entitie entities.MercadoLivrePlayProduct) ! {
	mut db := infradb.ConnectionDb.new()!
	defer {
		db.close()
	}

	sql db.conn {
		insert entitie into entities.MercadoLivrePlayProduct
	}!
}
