<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<body background="http://4vector.com/i/free-vector-gallery-show-background-03-vector_017002_3.jpg" style="
    background-position-x: 50%;
">

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

			if (Character.toString(ID.charAt(0)).equals("1")
					&& ID.length() >= 3) {

				String NAME = request.getParameter("name").replaceAll("%20", " ")
				.replaceAll("/", " ");
				String DES = request.getParameter("des").replaceAll("%20", " ")
				.replaceAll("/", " ");

				out.println("<br>");
				out.println("<h1 align=center>Updated Gallery details</h1>");
				pstmt = con
						.prepareStatement("update gallery set name=?, description=? where gallery_id=?");
				pstmt.setString(1, NAME);
				pstmt.setString(2, DES);
				pstmt.setString(3, ID);
				pstmt.executeUpdate();

				out.println("<table border=\"1\" align=center>");
				out.println("<tr>");
				out.println("<th>Gallery ID</th>");
				out.println("<th>Name</th>");
				out.println("<th>Description</th>");
				out.println("</tr>");

				pstmt = con
						.prepareStatement("SELECT * FROM gallery where gallery_id="
								+ ID);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					out.println("<tr>");
					String temp = rs.getString("gallery_id");
					String name = rs.getString("name");
					String des = rs.getString("description");

					out.println("<td>" + temp + "</td>");
					out.println("<td>" + name + "</td>");
					out.println("<td>" + des + "</td>");
					out.println("</tr>");
				}
				out.println("</table>");
				pstmt.close();

			}

			else if (ID.length() >= 1 && ID.length()<3) {
				String NAME = request.getParameter("name").replaceAll("%20", " ")
				.replaceAll("/", " ");
				String YEAR = request.getParameter("year").replaceAll("%20", " ")
				.replaceAll("/", " ");
				String COUNTRY = request.getParameter("coun").replaceAll("%20", " ")
				.replaceAll("/", " ");
				
				String DES = request.getParameter("des").replaceAll("%20", " ")
				.replaceAll("/", " ");

				out.println("<br>");
				out.println("<h1 align=center>Updated Artist details</h1>");
				pstmt = con
						.prepareStatement("update artist set name=?, birth_year=?, country=?, description=? where artist_id=?");
				pstmt.setString(1, NAME);
				pstmt.setString(2, YEAR);
				pstmt.setString(3, COUNTRY);
				pstmt.setString(4, DES);
				pstmt.setString(5, ID);
				pstmt.executeUpdate();

				out.println("<table border=\"1\" align=center>");
				out.println("<tr>");
				out.println("<th>Artist ID</th>");
				out.println("<th>Name</th>");
				out.println("<th>Birth Year</th>");
				out.println("<th>Country</th>");
				out.println("<th>Description</th>");
				out.println("</tr>");

				pstmt = con
						.prepareStatement("SELECT * FROM artist where artist_id="
								+ ID);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					out.println("<tr>");
					String temp = rs.getString("artist_id");
					String name = rs.getString("name");
					String year = rs.getString("birth_year");
					String country = rs.getString("country");
					String des = rs.getString("description");

					out.println("<td>" + temp + "</td>");
					out.println("<td>" + name + "</td>");
					out.println("<td>" + year + "</td>");
					out.println("<td>" + country + "</td>");
					out.println("<td>" + des + "</td>");
					out.println("</tr>");
				}
				out.println("</table>");
				pstmt.close();

			}

			else if (Character.toString(ID.charAt(0)).equals("2")
					&& ID.length() >= 3) {

				out.println("<br>");
				out.println("<h1 align=center>Image Deleted</h1>");
				out.println("<table border=\"1\" align=center>");
				out.println("<tr>");
				out.println("<th>Image ID</th>");
				out.println("<th>Title</th>");
				out.println("<th>Gallery ID</th>");
				out.println("<th>Artist ID</th>");
				out.println("<th>Year</th>");
				out.println("<th>Type</th>");
				out.println("<th>Location</th>");
				out.println("</tr>");

				pstmt = con
						.prepareStatement("select * from image as i,detail as d where i.image_id="
								+ ID + " and d.image_id=" + ID);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					out.println("<tr>");

					out.println("<td>" + rs.getString("image_id") + "</td>");
					out.println("<td>" + rs.getString("title") + "</td>");
					out.println("<td>" + rs.getString("gallery_id")
							+ "</td>");
					out.println("<td>" + rs.getString("artist_id")
							+ "</td>");
					out.println("<td>" + rs.getString("year") + "</td>");
					out.println("<td>" + rs.getString("type") + "</td>");
					out.println("<td>" + rs.getString("location") + "</td>");
					out.println("</tr>");
				}
				out.println("</table>");

				pstmt = con
						.prepareStatement("delete from image where image_id="
								+ ID);
				pstmt.executeUpdate();

				pstmt = con
						.prepareStatement("delete from detail where image_id=" + ID);
				pstmt.executeUpdate();
				pstmt.close();

			}

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
			<td><input type="button" value="Home" onClick=call2()></td>
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
