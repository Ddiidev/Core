module models

import json
import context_service.models as ctx_models

@[params]
pub struct ContractTypeServerAction {
mut:
	error string @[omitempty]
pub mut:
	type        string             = 'SERVER_ACTION'                 @[omitempty]
	method      MethodServerAction = .read     @[omitempty]
	status_text string             = 'success'                 @[json: 'statusText'; omitempty]
	path        string                 @[omitempty]
	response    map[string]string      @[omitempty]
	list_error  map[string]string      @[json: '-'; omitempty]
	duration    string                 @[omitempty]
	additional  ctx_models.DataContext @[omitempty]
}

pub fn ContractTypeServerAction.new(contract ContractTypeServerAction) ContractTypeServerAction {
	return contract
}

pub fn (cta ContractTypeServerAction) sanitize() ContractTypeServerAction {
	return ContractTypeServerAction{
		...cta
		error: json.encode(cta.list_error)
	}
}
