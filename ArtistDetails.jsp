<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<body background="http://4vector.com/i/free-vector-gallery-show-background-03-vector_017002_3.jpg" style="
    background-position-x: 50%;
">
	<!-- <img src = "D:/EclipseEE/Data/Images/EscapeIntoReality.jpg" style="width:304px;height:228px"> -->
	<%
		
		String artist = request.getParameter("artist_id");
		String name = request.getParameter("name").replaceAll("/"," ");

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

			out.println("<table align=center>");
			out.println("<tr>");
			out.println("<td><h1>" + name + "</h1></td>");
			out.println("<br>");
			out.println("<br>");
			out.println("</tr>");
			out.println("</table>");
			out.println("<br>");

			Statement stmt;
			PreparedStatement pstmt;
			ResultSet rs;
			stmt = con.createStatement(); // Statements allow to issue SQL queries to the database
			String sql = "SELECT * FROM artist where artist_id=" + artist;
			rs = stmt.executeQuery(sql); // Result set get the result of the SQL query
			out.println("<table border=\"1\" align=center>");
			out.println("<tr>");
			out.println("<th>ID</th>");
			out.println("<th>Birth Year</th>");
			out.println("<th>Country</th>");
			out.println("<th>Description</th>");
			out.println("</tr>");
			while (rs.next()) {
				out.println("<tr>");
				String temp = rs.getString("name");
				out.println("<td>" + rs.getString("artist_id") + "</td>");
				out.println("<td>" + rs.getString("birth_year") + "</td>");
				out.println("<td>" + rs.getString("country") + "</td>");
				out.println("<td>" + rs.getString("description") + "</td>");
				out.println("</tr>");
			}
			out.println("</table>");
			
			out.println("<br>");
			
			out.println("<table border=\"1\" align=center>");
			//out.println("<tr>");
			out.println("<caption><I><B>Image Collection</B></I></caption>");
			//out.println("<br>");
			//out.println("</tr>");
			out.println("<tr>");
			out.println("<th>Title</th>");
			out.println("<th>Image</th>");
			out.println("</tr>");
			
			out.println("<br>");
			
			String sql1 = "SELECT * FROM image where artist_id=" + artist;
			rs = stmt.executeQuery(sql1);
			while (rs.next()) {
				out.println("<tr>");
				String temp1 = rs.getString("image_id");
				out.println("<td>" + rs.getString("title") + "</td>");
				out.println("<td><img src=Image?imgid=" + temp1 +" width=200px height=200px></td>");
				out.println("</tr>");
			}
			out.println("</table>");
			rs.close();
			stmt.close();
			

			con.close();
		} catch (Exception e) {
			out.println(e.toString());
		}
	%>

	<br>
	<table align="center">
		<tr>
			<td><input type="button" value="Home" onClick=call2()>
			</td>
		</tr>
	</table>

	<script>
		function call1() {
			window.location = ("Details.jsp");
		}

		function call2() {
			window.location = ("Index.jsp");
		}
	</script>
</body>
</html>
