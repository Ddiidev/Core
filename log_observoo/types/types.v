module types

import context_service.models as ctx_models

pub type LogOtherType = map[string]string | map[string]LogOtherType | string | f64 | map[string]ctx_models.DataContext | ctx_models.DataContext