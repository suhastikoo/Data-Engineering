<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<body>

	<%
		String ID = request.getParameter("id");
		String TITLE = request.getParameter("title").replaceAll("%20", " ")
				.replaceAll("/", " ");
		String LINK = request.getParameter("link");
		String YEAR = request.getParameter("year").replaceAll("%20", " ")
				.replaceAll("/", " ");
		String TYPE = request.getParameter("type").replaceAll("%20", " ")
				.replaceAll("/", " ");
		String LOC = request.getParameter("loc").replaceAll("%20", " ")
				.replaceAll("/", " ");
		String DES = request.getParameter("des").replaceAll("%20", " ")
				.replaceAll("/", " ");
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

			out.println("<br>");
			out.println("<h1 align=center>Image Updated</h1>");
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
					.prepareStatement("update image set title=?,link=? where image_id=?");
			pstmt.setString(1, TITLE);
			pstmt.setString(2, LINK);
			pstmt.setString(3, ID);
			pstmt.executeUpdate();

			pstmt = con
					.prepareStatement("update detail set year=?, type=?, location=?, description=? where image_id=?");
			pstmt.setString(1, YEAR);
			pstmt.setString(2, TYPE);
			pstmt.setString(3, LOC);
			pstmt.setString(4, DES);
			pstmt.setString(5, ID);
			pstmt.executeUpdate();

			pstmt = con
					.prepareStatement("SELECT * FROM image as i, detail as d where i.image_id="
							+ ID + " and d.image_id=" + ID);
			//pstmt.setInt(1, ID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				out.println("<tr>");
				String link = rs.getString("link");
				out.println("<td>" + rs.getString("image_id") + "</td>");
				out.println("<td>" + rs.getString("title") + "</td>");
				out.print("<td>" + "<a href =" + link + ">");
				out.print(link);
				out.println("</a>" + "</td>");
				//out.println("<td>" + rs.getString("link") + "</td>");
				out.println("<td>" + rs.getString("year") + "</td>");
				out.println("<td>" + rs.getString("type") + "</td>");
				out.println("<td>" + rs.getString("location") + "</td>");
				out.println("<td>" + rs.getString("description") + "</td>");
				out.println("</tr>");
			}
			out.println("</table>");

			pstmt.close();

			con.close();
		} catch (Exception e) {
			out.println(e.toString());
		}
	%>
	<br>
	<table align="center">
		<tr>
			<!-- 			<td><input type="button" value="Back" onClick=call1()> -->
			<!-- 			</td> -->
			<td><input type="button" value="Home" onClick=call2()>
			</td>
		</tr>
	</table>

	<script>
		function call1() {
			window.location = ("GalleryListDelete.jsp");
		}

		function call2() {
			window.location = ("Index.jsp");
		}
	</script>
</body>
</html>
