<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<body>
	<%
		String option = request.getParameter("option");
		String query = request.getParameter("query");
	%>
	<%
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		} catch (Exception e) {
			out.println("can't load mysql driver");
			out.println(e.toString());
		}
	%>
	<br>
	<h1 align="center">Search Results</h1>

	<%
		try {
			String url = "jdbc:mysql://127.0.0.1:3306/gallery";
			String id = "gallery";
			String pwd = "eecs221";
			Connection con = DriverManager.getConnection(url, id, pwd);

			Statement stmt;
			PreparedStatement pstmt;
			ResultSet rs;

			if (option.equals("type")) {

				stmt = con.createStatement(); // Statements allow to issue SQL queries to the database
				//String sql = "SELECT * FROM detail where type=?";

				pstmt = con
						.prepareStatement("SELECT * FROM detail where type=?");
				pstmt.setString(1, query);
				rs = pstmt.executeQuery(); // Result set get the result of the SQL query
				ArrayList<Integer> list = new ArrayList<Integer>();
				while (rs.next()) {
					list.add(rs.getInt("image_id"));

				}
				//rs.close();
				out.println("<table border=\"1\" align=center>");
				out.println("<tr>");
				out.println("<th>Image ID</th>");
				out.println("<th>Title</th>");
				out.println("<th>Gallery ID</th>");
				out.println("<th>Artist ID</th>");
				out.println("<th>Detail ID</th>");
				out.println("</tr>");
				for (int a : list) {
					pstmt = con
							.prepareStatement("SELECT * FROM image where image_id=?");
					//String sql1 = "SELECT * FROM image where image_id=" + a;
					pstmt.setInt(1, a);
					rs = pstmt.executeQuery();
					while (rs.next()) {
						out.println("<tr>");
						String temp = rs.getString("image_id");
						String title = rs.getString("title").replaceAll(
								" ", "/");
						String artist_id = rs.getString("artist_id");
						String detail_id = rs.getString("detail_id");
						out.print("<td>" + "<a href = Details.jsp?title="
								+ title + "&artist_id=" + artist_id
								+ "&detail_id=" + detail_id + ">");
						out.print(temp);
						out.println("</a>" + "</td>");
						out.println("<td>" + rs.getString("title")
								+ "</td>");
						out.println("<td>" + rs.getString("gallery_id")
								+ "</td>");
						out.println("<td>" + artist_id + "</td>");
						out.println("<td>" + detail_id + "</td>");
						out.println("</tr>");
					}
				}
				out.println("</table>");
				stmt.close();
				con.close();
			}

			else if (option.equals("name")) {

				stmt = con.createStatement(); // Statements allow to issue SQL queries to the database

				pstmt = con
						.prepareStatement("SELECT artist_id FROM artist where name=?");
				pstmt.setString(1, query);
				rs = pstmt.executeQuery(); // Result set get the result of the SQL query
				int ID = 0;
				while (rs.next()) {
					ID = (rs.getInt("artist_id"));

				}
				out.println("<table border=\"1\" align=center>");
				out.println("<tr>");
				out.println("<th>Image ID</th>");
				out.println("<th>Title</th>");
				out.println("<th>Gallery ID</th>");
				out.println("<th>Artist ID</th>");
				out.println("<th>Detail ID</th>");
				out.println("</tr>");

				pstmt = con
						.prepareStatement("SELECT * FROM image where artist_id=?");

				pstmt.setInt(1, ID);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					out.println("<tr>");
					String temp = rs.getString("image_id");
					String title = rs.getString("title").replaceAll(" ",
							"/");
					String artist_id = rs.getString("artist_id");
					String detail_id = rs.getString("detail_id");
					out.print("<td>" + "<a href = Details.jsp?title="
							+ title + "&artist_id=" + artist_id
							+ "&detail_id=" + detail_id + ">");
					out.print(temp);
					out.println("</a>" + "</td>");
					out.println("<td>" + rs.getString("title") + "</td>");
					out.println("<td>" + rs.getString("gallery_id")
							+ "</td>");
					out.println("<td>" + artist_id + "</td>");
					out.println("<td>" + detail_id + "</td>");
					out.println("</tr>");
				}
				out.println("</table>");
				stmt.close();
				con.close();
			}

			else if (option.equals("location")) {

				stmt = con.createStatement(); // Statements allow to issue SQL queries to the database

				pstmt = con
						.prepareStatement("SELECT image_id FROM detail where location=?");
				pstmt.setString(1, query);
				rs = pstmt.executeQuery(); // Result set get the result of the SQL query
				ArrayList<Integer> list = new ArrayList<Integer>();
				while (rs.next()) {
					list.add(rs.getInt("image_id"));

				}
				out.println("<table border=\"1\" align=center>");
				out.println("<tr>");
				out.println("<th>Image ID</th>");
				out.println("<th>Title</th>");
				out.println("<th>Gallery ID</th>");
				out.println("<th>Artist ID</th>");
				out.println("<th>Detail ID</th>");
				out.println("<th>Location</th>");
				out.println("</tr>");

				for (int a : list) {
					pstmt = con
							.prepareStatement("SELECT * FROM image where image_id=?");

					pstmt.setInt(1, a);
					rs = pstmt.executeQuery();
					while (rs.next()) {
						out.println("<tr>");
						String temp = rs.getString("image_id");
						String title = rs.getString("title").replaceAll(
								" ", "/");
						String artist_id = rs.getString("artist_id");
						String detail_id = rs.getString("detail_id");
						out.print("<td>" + "<a href = Details.jsp?title="
								+ title + "&artist_id=" + artist_id
								+ "&detail_id=" + detail_id + ">");
						out.print(temp);
						out.println("</a>" + "</td>");
						out.println("<td>" + rs.getString("title")
								+ "</td>");
						out.println("<td>" + rs.getString("gallery_id")
								+ "</td>");
						out.println("<td>" + artist_id + "</td>");
						out.println("<td>" + detail_id + "</td>");
						out.println("<td>" + query + "</td>");
						out.println("</tr>");
					}
				}
				out.println("</table>");
				stmt.close();
				con.close();
			}

			else if (option.equals("year")) {
				
				String start = query.substring(0,4);
				String end = query.substring(query.length()-4,query.length());
				stmt = con.createStatement(); // Statements allow to issue SQL queries to the database

				pstmt = con
						.prepareStatement("SELECT image_id FROM detail where year between ? and ?");
				pstmt.setString(1, start);
				pstmt.setString(2, end);
				rs = pstmt.executeQuery(); // Result set get the result of the SQL query
				ArrayList<Integer> list = new ArrayList<Integer>();
				while (rs.next()) {
					list.add(rs.getInt("image_id"));

				}
				out.println("<table border=\"1\" align=center>");
				out.println("<tr>");
				out.println("<th>Image ID</th>");
				out.println("<th>Title</th>");
				out.println("<th>Gallery ID</th>");
				out.println("<th>Artist ID</th>");
				out.println("<th>Detail ID</th>");
				//out.println("<th>Location</th>");
				out.println("</tr>");

				for (int a : list) {
					pstmt = con
							.prepareStatement("SELECT * FROM image where image_id=?");

					pstmt.setInt(1, a);
					rs = pstmt.executeQuery();
					while (rs.next()) {
						out.println("<tr>");
						String temp = rs.getString("image_id");
						String title = rs.getString("title").replaceAll(
								" ", "/");
						String artist_id = rs.getString("artist_id");
						String detail_id = rs.getString("detail_id");
						out.print("<td>" + "<a href = Details.jsp?title="
								+ title + "&artist_id=" + artist_id
								+ "&detail_id=" + detail_id + ">");
						out.print(temp);
						out.println("</a>" + "</td>");
						out.println("<td>" + rs.getString("title")
								+ "</td>");
						out.println("<td>" + rs.getString("gallery_id")
								+ "</td>");
						out.println("<td>" + artist_id + "</td>");
						out.println("<td>" + detail_id + "</td>");
						//out.println("<td>" + rs.getString("location") + "</td>");
						out.println("</tr>");
					}
					
				}
				out.println("</table>");
				//out.println("<br>");
				stmt.close();
				con.close();
			}

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
			window.location = ("SearchImage.jsp");
		}

		function call2() {
			window.location = ("Index.jsp");
		}
	</script>

</body>
</html>
