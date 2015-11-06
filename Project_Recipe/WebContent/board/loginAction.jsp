<%@page import="com.util.DBConnectionMgr"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
		String p_id = request.getParameter("id");
		String p_pw = request.getParameter("passwd");
		
		DBConnectionMgr dbMgr = DBConnectionMgr.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuilder sb_sql = new StringBuilder();
		sb_sql.append("SELECT nickname FROM join");
		sb_sql.append(" WHERE id=? AND passwd=?");
		String nickname = null;
		try{
			con = dbMgr.getConnectionPool();
			pstmt = con.prepareStatement(sb_sql.toString());
			pstmt.setString(1,p_id);
			pstmt.setString(2,p_pw);
			//pstmt.executeQuery();
			rs = pstmt.executeQuery();
			//out.print(rs.next());
			rs.next();
			nickname = rs.getString("nickname");
			System.out.println(nickname);
			session.setAttribute("s_name", nickname);
			
		}catch(SQLException se){
			out.print("SQLException: "+sb_sql.toString());
		}catch(Exception e){
			e.printStackTrace();
		}
		response.sendRedirect("/Project_Recipe/board/MainDisplay.do");
%>
<script type="text/javascript">
//location.href="/Project_Recipe/board/MainDisplay.do";

</script>