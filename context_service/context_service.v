module context_service

import time
import log_observoo
import log_observoo.types as log_types
import log_observoo.models as log_models
import context_service.models as ctx_models

pub struct ContextService {
	log_observoo.ObservooServiceLog
mut:
	data_ctx ctx_models.DataContext
pub mut:
	duration time.Duration
}

pub fn (l ContextService) log_api(parametter log_models.ContractTypeApi) {
	l.ObservooServiceLog.log_api(log_models.ContractTypeApi{
		...parametter
		additional: l.data_ctx
	})
}

pub fn (l ContextService) log_server_action(parametter log_models.ContractTypeServerAction) {
	l.ObservooServiceLog.log_server_action(log_models.ContractTypeServerAction{
		...parametter
		additional: l.data_ctx
	})
}

pub fn (l ContextService) log_register(parametter log_models.ContractTypeRegister) {
	l.ObservooServiceLog.log_register(log_models.ContractTypeRegister{
		...parametter
		additional: l.data_ctx
	})
}

pub fn (l ContextService) log_info(parametter map[string]log_types.LogOtherType) {
	mut param_clone := parametter.clone()
	param_clone['type'] = 'OTHER'

	l.ObservooServiceLog.log_other(param_clone)
}

pub fn (mut l ContextService) add_callstack(callstack string) {
	l.data_ctx.callstack << callstack
}
