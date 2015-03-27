<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<body>
<br>
	<h1 align="center">Updated Gallery details</h1>
	<%
		String description = request.getParameter("val").replaceAll("%20"," ").replaceAll("/"," ");
		String name = request.getParameter("name").replaceAll("%20"," ").replaceAll("/"," ");
		//out.println(name);
		//out.println(description);
	%>
	<%
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		} catch (Exception e) {
			out.println("can't load mysql driver");
			out.println(e.toString());
		}
	%>
	<%
		try {
			String url = "jdbc:mysql://127.0.0.1:3306/gallery";
			String id = "gallery";
			String pwd = "eecs221";
			Connection con = DriverManager.getConnection(url, id, pwd);

			Statement stmt;
			PreparedStatement pstmt;
			ResultSet rs;
			stmt = con.createStatement(); // Statements allow to issue SQL queries to the database

			String sql = "insert into gallery(name,description) values(?,?)";
			pstmt = con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			pstmt.setString(1, name);
			pstmt.setString(2, description);
			pstmt.execute();
			rs = pstmt.getGeneratedKeys();
			int ID = 0;
			while (rs.next()) {
				ID = rs.getInt(1);
			}
			out.println("<br>");
			out.println("<table border=\"1\" align=center>");
			out.println("<tr>");
			out.println("<th>Gallery ID</th>");
			out.println("<th>Name</th>");
			out.println("<th>Description</th>");
			out.println("</tr>");
			out.println("<tr>");
			String idStr = Integer.toString(ID);
			out.println("<td>" + idStr + "</td>");
			out.println("<td>" + name + "</td>");
			out.println("<td>" + description + "</td>");
			out.println("</tr>");

			rs.close();
			stmt.close();
			out.println("</table>");

			con.close();
		} catch (Exception e) {
			out.println(e.toString());
		}
	%>
	<br>
	<table align="center">
		<tr>
			<td><input type="button" value="Back" onClick=call1()>
			</td>
			<td><input type="button" value="Home" onClick=call2()>
			</td>
		</tr>
	</table>

	<script>
		function call1() {
			window.location = ("NewGallery.jsp");
		}

		function call2() {
			window.location = ("Index.jsp");
		}
	</script>
</body>
</html>
