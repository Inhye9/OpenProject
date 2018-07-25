package LoginTask.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import LoginTask.model.Joiner;
import LoginTask.service.ServiceException;
import jdbc.JdbcUtil;

public class JoinerDao {

	// 싱글톤
	private JoinerDao() {
	}

	private static JoinerDao instance = new JoinerDao();

	public static JoinerDao getInstance() {
		return instance;
	}

	// 회원가입 insert 메서드
	public int insert(Connection conn, Joiner joiner) throws SQLException {

		PreparedStatement pstmt = null;
		String sql = "insert into member values(?,?,?,?,?,?,?,?)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, joiner.getId());
			pstmt.setString(2, joiner.getPwd());
			pstmt.setString(3, joiner.getName());

			String birth = joiner.getBirth_year() + "-" + joiner.getBirth_mon() + "-" + joiner.getBirth_day();

			pstmt.setString(4, birth);
			pstmt.setString(5, joiner.getGender());
			pstmt.setString(6, joiner.getEmail());
			pstmt.setInt(7, joiner.getPhone());
			pstmt.setString(8, joiner.getPhoto());

			return pstmt.executeUpdate();

		} finally {
			JdbcUtil.close(pstmt);
		}

	}

	//login하기 위해 불러오는 메서드
	public Joiner selectOne(Connection conn, String id) throws SQLException  {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Joiner joiner = null;
		String sql = "select * from member where id= ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();

			if (rs.next()) {
				joiner = makeMessageFromResultSet(rs);
			}

			return joiner;
			
		
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	

	//ResultSet rs의 결과가 있다면 읽어오는 메서드.
	private Joiner makeMessageFromResultSet(ResultSet rs) throws SQLException {
		
		Joiner joiner = new Joiner();
		
		joiner.setId(rs.getString("ID"));
		joiner.setPwd(rs.getString("PWD"));
		joiner.setName(rs.getString("NAME"));
		
		//1.
	/*	String birth = rs.getString("BIRTH");
		String[] birthArray = birth.split("/");*/
		
		//0. 
		Date Datebirth = rs.getDate("BIRTH");
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		String birth = transFormat.format(Datebirth);
		String[] birthArray = birth.split("-");
		
		joiner.setBirth_year(birthArray[0]);
		joiner.setBirth_mon(birthArray[1]);
		joiner.setBirth_day(birthArray[2]);
		
/*		System.out.println(joiner.getBirth_year());
		System.out.println(joiner.getBirth_mon());
		System.out.println(joiner.getBirth_day());*/

		joiner.setGender(rs.getString("GENDER"));
		joiner.setEmail(rs.getString("EMAIL"));
		joiner.setPhone(rs.getInt("PHONE"));
		joiner.setPhoto(rs.getString("PHOTO"));
		
		return joiner;
		
	}

	//Joiner_ 전체 회원 수를 가져오는 메서드
	public int selectCount(Connection conn) throws SQLException {
		
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from member";
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

	//Joiner_해당 페이지의 회원 리스트 가져오기
	public List<Joiner> selectList(Connection conn, int firstRow, int endRow) throws SQLException  {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<Joiner> memberList = null;
		
		String sql = "select id, pwd, name, birth, gender, email, phone, photo " + 
				"from (select rownum rnum, id, pwd, name, birth, gender, email, phone, photo " + 
				"      from(select *  " + 
				"           from member m " + 
				"           order by m.name desc) " + 
				"       where rownum <= ?) " + 
				"where rnum >= ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, firstRow);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				memberList = new ArrayList<Joiner>();
				
				do {
					memberList.add(makeMessageFromResultSet(rs));
				}while(rs.next());
			}else {
				memberList = Collections.emptyList();
			}
			return memberList;
			
		}finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
	}
	
	//xml,json 파일과 ajax를 사용하여 회원 리스트를 부르기 위한 메서드
	public List<Joiner> selectAll(Connection conn) throws SQLException{
		
		Statement stmt = null;
		ResultSet rs = null;
		List<Joiner> memberList = null;
		String sql = "select * from member";

		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
	
			if(rs.next()) {
				memberList = new ArrayList<Joiner>();
				
				do {
					memberList.add(makeMessageFromResultSet(rs));
				}while(rs.next());
			}else {
				memberList = Collections.emptyList();
			}
			return memberList;
			
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}
		

}
