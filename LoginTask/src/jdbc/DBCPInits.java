package jdbc;

import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.commons.dbcp2.ConnectionFactory;
import org.apache.commons.dbcp2.DriverManagerConnectionFactory;
import org.apache.commons.dbcp2.PoolableConnection;
import org.apache.commons.dbcp2.PoolableConnectionFactory;
import org.apache.commons.dbcp2.PoolingDriver;
import org.apache.commons.pool2.impl.GenericObjectPool;
import org.apache.commons.pool2.impl.GenericObjectPoolConfig;

public class DBCPInits extends HttpServlet {

	@Override
	public void init() throws ServletException {
		loadJDBCDriver();
		initConnectionPool();

	}
	//
	private void loadJDBCDriver() {
		try {
			//而ㅻ꽖�뀡 ���씠 �궡遺��뿉�꽌 �궗�슜�븷 jdbc �뱶�씪�씠踰꾨�� 濡쒕뵫�븿.
			//Class.forName("com.mysql.jdbc.Driver");
			Class.forName("oracle.jdbc.driver.OracleDriver");
			} catch (ClassNotFoundException ex) {
			throw new RuntimeException("fail to load JDBC Driver", ex);			}
		
	}
	
	
	//POOL �뱶�씪�씠踰� 濡쒕뱶, �꽕�젙, �� �벑濡� 
	private void initConnectionPool() {
		
		 String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
		 String id ="student";
		 String pw ="1234";
		
		 
		 try {
			
			//而ㅻ꽖�뀡���씠 �깉濡쒖슫 而ㅻ꽖�뀡�쓣 �깮�꽦�븷 �븣 �궗�슜�븷 而ㅻ꽖�뀡�뙥�넗由щ�� �깮�꽦.
			ConnectionFactory connFactory = new DriverManagerConnectionFactory(jdbcUrl, id, pw);
			// PoolableConnection�쓣 �깮�꽦�븯�뒗 �뙥�넗由� �깮�꽦.
			// DBCP�뒗 而ㅻ꽖�뀡�쓣 蹂닿��븷 �븣 PoolableConnection �쓣 �궗�슜
			// �떎�젣 而ㅻ꽖�뀡�쓣 �떞怨� �엳�엳�쑝硫�, 而ㅻ꽖�뀡 ���쓣 愿�由ы븯�뒗�뜲 �븘�슂�븳 湲곕뒫�쓣 �젣怨듯븳�떎.
			// 而ㅻ꽖�뀡�쓣 close�븯硫� 醫낅즺�븯吏� �븡怨� 而ㅻ꽖�뀡 ���뿉 諛섑솚
			PoolableConnectionFactory poolableConnFactory = new PoolableConnectionFactory(connFactory, null);
			//而ㅻ꽖�뀡�씠 �쑀�슚�븳吏� �뿬遺�瑜� 寃��궗�븷 �븣 �궗�슜�븯�뒗 荑쇰━瑜� 吏��젙�븳�떎.
			poolableConnFactory.setValidationQuery("select 1");
			//而ㅻ꽖�뀡 ���쓽 �꽕�젙 �젙蹂대�� �깮�꽦�븳�떎.
			GenericObjectPoolConfig poolConfig = new GenericObjectPoolConfig();
			//�쑀�쑕 而ㅻ꽖�뀡 寃��궗 二쇨린
			poolConfig.setTimeBetweenEvictionRunsMillis(1000L * 60L * 5L);
			//���뿉 蹂닿�以묒씤 而ㅻ꽖�뀡�씠 �쑀�슚�븳吏� 寃��궗�븷吏� �쑀臾� �꽕�젙
			poolConfig.setTestWhileIdle(true);
			
			//而ㅻ꽖�뀡 理쒖냼 媛쒖닔
			poolConfig.setMinIdle(4);
			//而ㅻ꽖�뀡 理쒕� 媛쒖닔
			poolConfig.setMaxTotal(50);
			//而ㅻ꽖�뀡 ���쓣 �깮�꽦. �깮�꽦�옄�뒗 PoolabeConnectionFactory�� GenericObjectPoolConfig瑜� �궗�슜
			GenericObjectPool<PoolableConnection> connectionPool =
			new GenericObjectPool<>(poolableConnFactory, poolConfig);
			//PoolabeConnectionFactory�뿉�룄 而ㅻ꽖�뀡 ���쓣 �뿰寃�
			poolableConnFactory.setPool(connectionPool);
			//而ㅻ꽖�뀡 ���쓣 �젣怨듯븯�뒗 jdbc �뱶�씪�씠踰꾨�� �벑濡�.
			Class.forName("org.apache.commons.dbcp2.PoolingDriver");
			PoolingDriver driver = (PoolingDriver)DriverManager.getDriver("jdbc:apache:commons:dbcp:");
			//�쐞�뿉�꽌 而ㅻ꽖�뀡 �� �뱶�씪�씠踰꾩뿉 �깮�꽦�븳 而ㅻ꽖�뀡 ���쓣 �벑濡앺븳�떎. �씠由꾩� chap14 �씠�떎.
			driver.registerPool("pooltest", connectionPool);
			
			System.out.println("pooltest connected successfully");
			
			
			} catch (Exception e) {
			throw new RuntimeException(e);
			}
	}
}
