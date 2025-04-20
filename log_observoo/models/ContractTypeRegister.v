module models

import json
import context_service.models as ctx_models

@[params]
pub struct ContractTypeRegister {
mut:
	error string @[omitempty]
pub mut:
	@type      string                 @[omitempty]
	path       string                 @[omitempty]
	response   map[string]string      @[omitempty]
	list_error map[string]string      @[json: '-'; omitempty]
	additional ctx_models.DataContext @[omitempty]
}

pub fn ContractTypeRegister.new(contract ContractTypeRegister) ContractTypeRegister {
	return contract
}

pub fn (cta ContractTypeRegister) sanitize() ContractTypeRegister {
	return ContractTypeRegister{
		...cta
		error: json.encode(cta.list_error)
	}
}
