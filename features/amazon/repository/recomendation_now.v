module repository

import infradb
import utils
import features.amazon.entities

pub fn get_recomendation() ![]entities.AmazonProduct {
	mut dbase := infradb.ConnectionDb.new()!
	defer {
		dbase.close()
	}
	start, end := utils.get_date_start_and_end()

	mut res := []entities.AmazonProduct{}
	$if debug ? || debug_without_cache ? {
		res = sql dbase.conn {
			select from entities.AmazonProduct limit 2
		}!
	} $else {
		res = sql dbase.conn {
			select from entities.AmazonProduct where current_date >= start && current_date <= end limit 2
		}!
	}
	dump(start)
	dump(end)

	res_parsed := if res.len > 1 {
		res[0..2].clone()
	} else {
		res.clone()
	}

	return res_parsed
}
