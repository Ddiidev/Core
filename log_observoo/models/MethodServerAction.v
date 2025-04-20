module models

pub enum MethodServerAction {
	create
	update
	delete
	read
}

pub fn (action MethodServerAction) str() string {
	return match action {
		.create { 'CREATE' }
		.update { 'UPDATE' }
		.delete { 'DELETE' }
		.read { 'READ' }
	}
}
