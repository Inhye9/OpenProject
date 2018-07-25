package LoginTask.service;

import java.sql.Connection;
import java.sql.SQLException;

import org.apache.catalina.valves.JDBCAccessLogValve;

import LoginTask.dao.JoinerDao;
import LoginTask.model.Joiner;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class insertJoinerService {

	//싱글톤
	private insertJoinerService() {	
	}
	
	private static insertJoinerService instance = new insertJoinerService();
	
	public static insertJoinerService getInstance() {
		return instance;
	}
	
	//데이터 삽입 메서드_회원가입
	public int insertJoiner(Joiner joiner) throws ServiceException{
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			JoinerDao dao = JoinerDao.getInstance();
			
			int resultCnt = dao.insert(conn, joiner);
			
			return resultCnt;
			
		} catch (SQLException e) {
			
			throw new ServiceException("메시지 등록 실패: " + e.getMessage(), e);

		}finally {
			JdbcUtil.close(conn);
		}
	}
	
}
