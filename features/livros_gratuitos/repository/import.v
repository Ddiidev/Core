module repository

import infradb
import features.livros_gratuitos.entities

pub fn import(entitie entities.LivrosGratuitosProduct) ! {
	mut dbase := infradb.ConnectionDb.new()!
	defer {
		dbase.close()
	}

	sql dbase.conn {
		insert entitie into entities.LivrosGratuitosProduct
	}!
}
