<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<body>
	<br>
	<h1 align="center">Updated Artist details</h1>
	<%
		String ID = request.getParameter("id");
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

			out.println("<table border=\"1\" align=center>");
			out.println("<tr>");
			out.println("<th>Image ID</th>");
			out.println("<th>Title</th>");
			out.println("<th>Link</th>");
			out.println("<th>Year</th>");
			out.println("<th>Type</th>");
			out.println("<th>Location</th>");
			out.println("<th>Description</th>");
			out.println("</tr>");
			
			pstmt = con
					.prepareStatement("SELECT * FROM image as i, detail as d where i.image_id="
							+ ID + " and d.image_id=" + ID);
			//pstmt.setInt(1, ID);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				out.println("<tr>");
				String temp = rs.getString("image_id");
				String title = rs.getString("title").replaceAll(" ", "/");
				String link = rs.getString("link");
				String year = rs.getString("year");
				String type = rs.getString("type").replaceAll(" ",
						"/");
				String location = rs.getString("location").replaceAll(" ",
				"/");
				String des = rs.getString("description").replaceAll(" ",
						"/");

				out.println("<td>" + temp + "</td>");
				out.println("<td>" + title
						+  "</td>");
				//out.println("<td><img src=Image?imgid=" + temp +" width=60px height=60px>"+ "</td>");
				out.println("<td><a href="+link+">" + link
						 + "</td>");
				out.println("<td>" + year
						 + "</td>");
				out.println("<td>"
						+ type + "</td>");
				out.println("<td>"
						+ location + "</td>");
				out.println("<td>" + des
						+ "</td>");
// 				out.print("<td>" + "<a href = Confirmation.jsp?id=" + temp
// 						+ "&name=" + name + "&year=" + year + "&country="
// 						+ country + "&des=" + des.replaceAll(" ", "/")
// 						+ ">");
// 				out.print("Update");
// 				out.println("</a>" + "</td>");
				out.println("</tr>");
			}
			out.println("</table>");
			stmt.close();

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
			window.location = ("NewImage.jsp");
		}

		function call2() {
			window.location = ("Index.jsp");
		}
	</script>
</body>
</html>
