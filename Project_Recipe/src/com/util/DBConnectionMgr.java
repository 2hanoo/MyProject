package com.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBConnectionMgr {
	//선언부
	private final String _DRIVER = "oracle.jdbc.driver.OracleDriver";//드라이버 클래스
	private final String _URL  	 = "jdbc:oracle:thin:@192.168.0.51:1521:orcl";
	private final String _USER	 = "project";
	private final String _PW	 = "1234";
	private static DBConnectionMgr instance = null;
	//생성자
	
	//DBConnectionMgr 객체 메모리에 올리기
	public static DBConnectionMgr getInstance(){
		if(instance == null){
			synchronized(DBConnectionMgr.class){//synchronized가 있으면 intercept 방지
				if(instance == null){
					instance = new DBConnectionMgr();
				}
			}
		} //////////// end of if
		return instance;
	}//////////// end of getInstance
	//JEUS에서 제공하는 커넥션 풀을 이용하여 Connection 생성하기
	public Connection getConnectionPool(){//jdbc와 관련된 클래스는 sql
		Connection con = null;
		try {
			Context initCtx = new InitialContext();
			DataSource ds 	= (DataSource)initCtx.lookup("java:comp/env/jdbc/Oracle11g");//JEUSMain.xml의 export name
			con = ds.getConnection();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return con;
			//전령의 역할을 하는 인터페이스
		}
		
	//사용한 자원 반납하기.
	//생성한 역순으로 반납한다.(순서가 중요) Connection, Statement, ResultSet
	public void freeConnection(Connection con, Statement stmt){
		try {
			if(stmt !=null) stmt.close();
			if(con !=null) con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void freeConnection(Connection con, PreparedStatement pstmt){
		try {
			if(pstmt !=null) pstmt.close();
			if(con !=null) con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void freeConnection(Connection con, Statement stmt, ResultSet rs){
		try {
			if(rs != null) rs.close();
			if(stmt !=null) stmt.close();
			if(con !=null) con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void freeConnection(Connection con, PreparedStatement pstmt, ResultSet rs){
		try {
			if(rs != null) rs.close();
			if(pstmt !=null) pstmt.close();
			if(con !=null) con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
