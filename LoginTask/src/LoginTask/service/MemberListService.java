package LoginTask.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import LoginTask.dao.JoinerDao;
import LoginTask.model.Joiner;
import LoginTask.model.MemberListView;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class MemberListService {

	// 싱글톤
	private MemberListService() {
	}

	private static MemberListService instance = new MemberListService();

	public static MemberListService getInstance() {
		return instance;
	}

	// 한 페이지당 보여줄 회원 수
	private static final int MEMBER_COUNT_PER_PAGE = 5;

	public MemberListView getMemberList(int pageNumber) throws ServiceException {

		Connection conn = null;
		JoinerDao dao = null;
		MemberListView memberListView = null;

		// 현재 페이지 넘버 구하기
		int currentPageNumber = 1;

		if (pageNumber > 0) {
			currentPageNumber = pageNumber;
		}

		// 본격 메서드 구하기
		try {
			conn = ConnectionProvider.getConnection();
			dao = JoinerDao.getInstance();

			// 전체 게시물 수
			int memberTotalCount = dao.selectCount(conn);

			List<Joiner> memberList = null;
			int firstRow = 0;
			int endRow = 0;

			if (memberTotalCount > 0) {

				firstRow = (currentPageNumber - 1) * MEMBER_COUNT_PER_PAGE;
				endRow = firstRow + MEMBER_COUNT_PER_PAGE - 1;
				memberList = dao.selectList(conn, firstRow, endRow);

			} else {
				currentPageNumber = 0;
				memberList = Collections.emptyList();
			}

			memberListView = new MemberListView(memberTotalCount, memberList, currentPageNumber, MEMBER_COUNT_PER_PAGE,
					firstRow, endRow);

			return memberListView;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
		}

		return memberListView;
	}

	// xml/json 파일을 만들기 위한 메서드
	public List<Joiner> getMemberList2() throws SQLException {

		Connection conn = null;
		JoinerDao dao = null;
		try {

			conn = ConnectionProvider.getConnection();
			dao = JoinerDao.getInstance();

			// 전체 게시물 수
			List<Joiner> memberList = dao.selectAll(conn);

			return memberList;

		} finally {
			JdbcUtil.close(conn);
		}

	}

}
