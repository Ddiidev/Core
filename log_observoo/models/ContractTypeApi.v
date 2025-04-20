module models

import json
import context_service.models as ctx_models

@[params]
pub struct ContractTypeApi {
mut:
	error string @[omitempty]
pub mut:
	type        string                 @[omitempty]
	path        string                 @[omitempty]
	method      string = 'GET'                 @[omitempty]
	status_code int    = 200                    @[json: 'statusCode'; omitempty]
	response    map[string]string      @[omitempty]
	list_error  map[string]string      @[json: '-'; omitempty]
	duration    string                 @[omitempty]
	additional  ctx_models.DataContext @[omitempty]
}

pub fn ContractTypeApi.new(contract ContractTypeApi) ContractTypeApi {
	return contract
}

pub fn (cta ContractTypeApi) sanitize() ContractTypeApi {
	return ContractTypeApi{
		...cta
		error: json.encode(cta.list_error)
	}
}
