module service

import conf_env
import handle_email.interfaces
import handle_email.implementations

pub fn get() interfaces.IEmail {
	return implementations.EmailSMTPRepositoryBrevo{conf_env.load_env()}
}
