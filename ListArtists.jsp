<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String funcID = request.getParameter("funcID");
		String name = request.getParameter("name");
		
	%>
	<%
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		} catch (Exception e) {
			out.println("can't load mysql driver");
			out.println(e.toString());
		}
	%>

	<h1 align="center">List of Artists</h1>

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
			String sql = "SELECT * FROM artist";
			rs = stmt.executeQuery(sql); // Result set get the result of the SQL query
			out.println("<table border=\"1\" align=center>");
			out.println();
			out.println();
			out.println();
			out.println("<tr>");
			out.println("<th>Modify</th>");
			out.println("<th>Artist ID</th>");
			out.println("<th>Name</th>");
			out.println("<th>Birth Year</th>");
			out.println("<th>Country</th>");
			out.println("<th>Description</th>");
			out.println("</tr>");
			while (rs.next()) {
				out.println("<tr>");
				String temp = rs.getString("artist_id");
				String temp2 = rs.getString("name");
				String temp3 = rs.getString("description");
				out.print("<td>" + "<a href = ModifyArtist.jsp?id=" + temp
						+ "&name=" + temp2 + ">");
				out.print("Select");
				out.println("</a>" + "</td>");
				out.println("<td>" + temp + "</td>");
				out.println("<td>" + temp2 + "</td>");
				out.println("<td>" + rs.getString("birth_year") + "</td>");
				out.println("<td>" + rs.getString("country") + "</td>");
				out.println("<td>" + temp3 + "</td>");
				out.println("</tr>");
			}
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
			window.location = ("Index.jsp");
		}

		function call2() {
			window.location = ("Index.jsp");
		}
	</script>
</body>
</html>