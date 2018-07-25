package LoginTask.messageService;

import java.sql.Connection;
import java.sql.SQLException;

import LoginTask.dao.MessageDao;
import LoginTask.model.Message;
import LoginTask.service.ServiceException;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class InsertMessageService {
	
	//싱글톤
	private InsertMessageService() {
	}
	
	private static InsertMessageService instance = new InsertMessageService();
	
	public static InsertMessageService getInstance() {
		return instance;
	}
	
	//방명록 삽입 메서드 
	public int write(Message message) throws ServiceException{
		
		Connection conn = null;
		int resultCnt = 0;
		
		try {
			conn = ConnectionProvider.getConnection();
			MessageDao dao = MessageDao.getInstance();
			
			resultCnt = dao.insert(conn, message);
			
		} catch (SQLException e) {
			throw new ServiceException("메시지 등록 실패: " + e.getMessage(), e);
		
		}finally {
			JdbcUtil.close(conn);
		}
		
		return resultCnt;
		
	}
	

}
