module log_observoo

import json
import conf_env
import net.http
import log_observoo.models
import log_observoo.types

@[unsafe]
fn url() string {
	mut static url := ''
	return if url != '' {
		url
	} else {
		env := conf_env.load_env()
		url = 'https://observoo.com/api/register/log/${env.logger_api_slug}'
		url
	}
}

pub struct ObservooServiceLog {}

pub fn (_ ObservooServiceLog) log_api(contract models.ContractTypeApi) {
	env := conf_env.load_env()
	auth := env.logger_api_key

	http.fetch(http.FetchConfig{
		url:    unsafe { url() }
		method: .post
		data:   json.encode(models.ContractTypeApi{
			...contract.sanitize()
			type: 'API'
		})
		header: http.new_header_from_map({
			.authorization: 'Bearer ${auth}'
		})
	}) or {
		eprintln('LOG FAIL API: ${err.msg()}')
		return
	}
}

pub fn (_ ObservooServiceLog) log_server_action(contract models.ContractTypeServerAction) {
	env := conf_env.load_env()
	auth := env.logger_api_key

	http.fetch(http.FetchConfig{
		url:    unsafe { url() }
		method: .post
		data:   json.encode(models.ContractTypeServerAction{
			...contract.sanitize()
			type: 'SERVER_ACTION'
		})
		header: http.new_header_from_map({
			.authorization: 'Bearer ${auth}'
		})
	}) or {
		eprintln('LOG FAIL SERVER ACTION: ${err.msg()}')
		return
	}
}

pub fn (_ ObservooServiceLog) log_register(contract models.ContractTypeRegister) {
	env := conf_env.load_env()
	auth := env.logger_api_key

	http.fetch(http.FetchConfig{
		url:    unsafe { url() }
		method: .post
		data:   json.encode(models.ContractTypeRegister{
			...contract.sanitize()
			type: 'REGISTER'
		})
		header: http.new_header_from_map({
			.authorization: 'Bearer ${auth}'
		})
	}) or {
		eprintln('LOG FAIL REGISTER: ${err.msg()}')
		return
	}
}

pub fn (_ ObservooServiceLog) log_other(contract map[string]types.LogOtherType) {
	env := conf_env.load_env()
	auth := env.logger_api_key

	http.fetch(http.FetchConfig{
		url:    unsafe { url() }
		method: .post
		data:   json.encode(contract)
		header: http.new_header_from_map({
			.authorization: 'Bearer ${auth}'
		})
	}) or {
		eprintln('LOG FAIL REGISTER: ${err.msg()}')
		return
	}
}
