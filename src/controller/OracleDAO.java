package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class OracleDAO {


	
	public Connection con;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;
	
	public OracleDAO() {
		try {
			Context initCtx = new InitialContext();
			//Context ctx = (Context)initCtx.lookup("java:comp/env");
			//DataSource source = (DataSource)ctx.lookup("dbcp_myoracle");
			
			DataSource source = (DataSource)initCtx.lookup("java:comp/env/dbcp_myoracle");
					
			con = source.getConnection();
			System.out.println("DB ConnectionPool 연결성공");
		}
		catch (Exception e) {
			e.printStackTrace();
			System.out.println("DB ConnectionPool 연결실패");
		}
	}
	public void close() {
		try {
			if(rs!=null) rs.close();
			if(stmt!=null) stmt.close();
			if(psmt!=null) psmt.close();
			if(con!=null) con.close();
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("DB ConnectionPool 자원반납시 예외발생");
		}
	}
	
	public boolean isMember(String id, String pass) {
		
		String sql = "SELECT COUNT(*) FROM member "
				+ " WHERE id=? AND pass=?";
		int isMember = 0;
		
		try { 
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pass);
			rs = psmt.executeQuery();
			rs.next();
			isMember = rs.getInt(1);
			System.out.println("affected:" + isMember);
			if(isMember==0) return false;
		}
		catch(Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
}
