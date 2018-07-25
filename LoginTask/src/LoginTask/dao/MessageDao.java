package LoginTask.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import LoginTask.model.Message;
import jdbc.JdbcUtil;

public class MessageDao {

	// 싱글톤 제작
	private MessageDao() {
	}

	private static MessageDao instance = new MessageDao();

	public static MessageDao getInstance() {
		return instance;
	}

	// Message_ 방명록을 새로 등록하는 메서드
	public int insert(Connection conn, Message message) throws SQLException {

		PreparedStatement pstmt = null;
		int resultCnt = 0;
		String sql = "insert into guestbook_message values (message_id_seq.NEXTVAL, ?, ?, ?)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, message.getId());
			pstmt.setString(2, message.getPassword());
			pstmt.setString(3, message.getMessage());

			resultCnt = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
		}
		return resultCnt;
	}

	// Message_ 전체 방명록 수 가져오는 메서드
	public int selectCount(Connection conn) throws SQLException {

		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from guestbook_message";
		int resultCnt = 0;

		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			if (rs.next()) {
				resultCnt = rs.getInt(1);
			}

		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}

		return resultCnt;
	}

	// Message_해당 페이지의 게시물 리스트 가져오기
	public List<Message> selectList(Connection conn, int firstRow, int endRow) throws SQLException {

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		List<Message> messageList = null;

		String sql = "select message_id, id, password, message  " + 
				"from ( select rownum rnum, message_id, id, password, message  " + 
				"        from ( select *  " + 
				"               from guestbook_message m  " + 
				"               order by m.message_id desc)  " + 
				"        where rownum <= ?)  " + 
				"where rnum >= ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, firstRow);
			rs = pstmt.executeQuery();
		
		if(rs.next()) {
			messageList = new ArrayList<Message>();
			
			do {
				messageList.add(makeMessageFromResultSet(rs));
			}while(rs.next());
		}else {
			messageList = Collections.emptyList();
		}
		return messageList;
		
		}finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
	}

	
		// ResultSet rs의 결과 읽어오는 메서드.
		private Message makeMessageFromResultSet(ResultSet rs) throws SQLException {
			Message message = new Message();

			message.setMessage_id(rs.getInt("message_id"));
			message.setId(rs.getString("id"));
			message.setPassword(rs.getString("password"));
			message.setMessage(rs.getString("message"));

			return message;

		}

		public Message select(Connection conn, int messageId) throws SQLException {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			Message message = null;
			String sql = "select * from guestbook_message where message_id=?";

			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, messageId);

				rs = pstmt.executeQuery();

				if (rs.next()) {
					message = makeMessageFromResultSet(rs);
					// message가 있다면 makeMessageFromResultSet(ResultSet rs) 메서드를 이용하여 결과 읽어온다.
				}

			} finally {
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
			}
			return message;

		}
		
		
		//Delete
		public boolean delete(Connection conn, int messageId) throws SQLException {
			
			PreparedStatement pstmt = null;
			String sql = "delete from guestbook_message where message_id = ?";
			boolean result = false;
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, messageId);
				pstmt.executeUpdate();
				result = true;

			}finally {
				JdbcUtil.close(pstmt);
			}
			return result;
		}

			
}
