package LoginTask.messageService;

import java.sql.Connection;
import java.sql.SQLException;

import LoginTask.dao.MessageDao;
import LoginTask.model.Message;
import LoginTask.service.ServiceException;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class DeleteMessageService {
	
	//싱글톤
	private DeleteMessageService() {
	}
	
	private static DeleteMessageService instance = new DeleteMessageService();

	public static DeleteMessageService getInstance() {
		return instance;
	}
	
	//메세지 삭제 메서드
	public boolean deleteMessage(String id, int messageId) throws ServiceException{
		
		Connection conn = null;
		boolean result = false;
		try {
			
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			MessageDao dao = MessageDao.getInstance();
			
			Message message = dao.select(conn, messageId);
			
			if (message == null) {
				result = false;
			}
			
			if (!message.hasId()) {
				result = false;
			}
			
			if(message.getId().equals(id)) {
				if(dao.delete(conn, messageId)){
					result = true;
					conn.commit();
				}else {
					result = false;
				}
			}

			
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);

		} finally {
			if (conn != null) {
				try {
					conn.setAutoCommit(false);
				} catch (SQLException e) {
				}
				JdbcUtil.close(conn);
			}
		}
		return result;
	}
}
