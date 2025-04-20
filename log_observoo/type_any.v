module log_observoo

pub type Any = map[string]Any | []Any | f64 | bool | string

@[unsafe]
pub struct AnyMapBuilder {
	mut:
		data map[string]Any
}

@[unsafe]
pub fn AnyMapBuilder.new() &AnyMapBuilder {
	return &AnyMapBuilder{
		data: map[string]Any{}
	}
}

@[unsafe]
pub fn (b &AnyMapBuilder) add(key string, value Any) &AnyMapBuilder {
	b.data[key] = value
	return b
}

pub fn (b &AnyMapBuilder) build() Any {
	return b.data
}