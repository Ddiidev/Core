module repository

import infradb
import utils
import features.instant_gaming.entities

pub fn get_recomendation() !entities.InstantGamingProduct {
	mut dbase := infradb.ConnectionDb.new()!
	defer {
		dbase.close()
	}

	start, end := utils.get_date_start_and_end()

	mut res := []entities.InstantGamingProduct{}
	$if debug ? || debug_without_cache ? {
		res = sql dbase.conn {
			select from entities.InstantGamingProduct
		}!
	} $else {
		res = sql dbase.conn {
			select from entities.InstantGamingProduct where current_date >= start
			&& current_date <= end
		}!
	}

	return res[0] or { entities.InstantGamingProduct{} }
}
