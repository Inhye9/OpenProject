package LoginTask.service;

import java.sql.Connection;
import java.sql.SQLException;

import LoginTask.dao.JoinerDao;
import LoginTask.model.Joiner;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class selectMypageService {
	
	//싱글톤 
	private selectMypageService() {
	}
	
	private static selectMypageService instance = new selectMypageService();
	
	public static selectMypageService getInstance() {
		return instance;
	}
	
	//마이페이지 출력 메서드 
	public Joiner printMypage(String id) throws ServiceException{
		
		Connection conn = null;
		int resultCnt = 0;
		Joiner joiner = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			JoinerDao dao = JoinerDao.getInstance();
			
			joiner = dao.selectOne(conn, id);

		}catch (SQLException e) {
			e.printStackTrace();
		
		}finally {
			JdbcUtil.close(conn);
		}
		return joiner;
	}
}
