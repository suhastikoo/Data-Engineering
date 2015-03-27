<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<!--   <head>     -->
<!--     <title>Bank Application</title>	 -->
<!--   </head> -->
<body>
	<!-- <img src = "D:/EclipseEE/Data/Images/EscapeIntoReality.jpg" style="width:304px;height:228px"> -->
	<%
		
	%>
	<%
		String b = request.getParameter("myradio");
		//out.println("Your department is "+b);
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
			String sql = "SELECT * FROM gallery where gallery_id=" + b;
			rs = stmt.executeQuery(sql); // Result set get the result of the SQL query
			out.println("<table border=\"1\" align=center>");
			out.println("<tr>");
			out.println("<th>Gallery ID</th>");
			out.println("<th>Gallery ID</th>");
			out.println("<th>Gallery ID</th>");
			out.println("<th>Name</th>");
			out.println("<th>Description</th>");
			out.println("</tr>");
			while (rs.next()) {
				out.println("<tr>");
				String temp = rs.getString("name");
				out.println("<td>" + rs.getString("image_id") + "</td>");
// 				out.print("<td>" + "<a href = ArtistDetails.jsp?artist_id="
// 						+ artist + "&name=" + temp + ">");
// 				out.print(temp);
				out.println("</a>" + "</td>");
				out.println("<td>" + rs.getString("year") + "</td>");
				out.println("<td>" + rs.getString("type") + "</td>");
				out.println("<td>" + rs.getString("height") + "</td>");
				out.println("<td>" + rs.getString("location") + "</td>");
				out.println("<td>" + rs.getString("description") + "</td>");
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

	<!-- } %>   -->
</body>
</html>
