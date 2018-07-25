package LoginTask.service;

import java.sql.SQLException;

public class ServiceException extends Exception {

	public ServiceException(String message) {
		super(message);
		// TODO Auto-generated constructor stub
	}

	public ServiceException(String string, SQLException e) {
		// TODO Auto-generated constructor stub
	}
}
