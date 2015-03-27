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

			if (option.equals("country")) {

				stmt = con.createStatement(); // Statements allow to issue SQL queries to the database
				//String sql = "SELECT * FROM detail where type=?";

				out.println("<table border=\"1\" align=center>");
				out.println("<tr>");
				out.println("<th>Artist ID</th>");
				out.println("<th>Name</th>");
				out.println("<th>Birth Year</th>");
				out.println("<th>Country</th>");
				out.println("<th>Description</th>");
				out.println("</tr>");

				pstmt = con
						.prepareStatement("SELECT * FROM artist where country=?");
				pstmt.setString(1, query);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					out.println("<tr>");
					String temp = rs.getString("artist_id");
					String name = rs.getString("name");
					out.println("<td>" + temp + "</td>");
					out.print("<td>"
							+ "<a href = ArtistDetails.jsp?artist_id="
							+ temp + "&name=" + name + ">");
					out.print(name);
					out.println("</a>" + "</td>");
					out.println("<td>" + rs.getString("birth_year")
							+ "</td>");
					out.println("<td>" + rs.getString("country") + "</td>");
					out.println("<td>" + rs.getString("description")
							+ "</td>");
					out.println("</tr>");
				}
				out.println("</table>");
				stmt.close();
				con.close();
			}

			else if (option.equals("year")) {

				stmt = con.createStatement();

				out.println("<table border=\"1\" align=center>");
				out.println("<tr>");
				out.println("<th>Artist ID</th>");
				out.println("<th>Name</th>");
				out.println("<th>Birth Year</th>");
				out.println("<th>Country</th>");
				out.println("<th>Description</th>");
				out.println("</tr>");

				pstmt = con
						.prepareStatement("SELECT * FROM artist where birth_year=?");
				pstmt.setString(1, query);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					out.println("<tr>");
					String temp = rs.getString("artist_id");
					String name = rs.getString("name");
					out.println("<td>" + temp + "</td>");
					out.print("<td>"
							+ "<a href = ArtistDetails.jsp?artist_id="
							+ temp + "&name=" + name + ">");
					out.print(name);
					out.println("</a>" + "</td>");
					out.println("<td>" + rs.getString("birth_year")
							+ "</td>");
					out.println("<td>" + rs.getString("country") + "</td>");
					out.println("<td>" + rs.getString("description")
							+ "</td>");
					out.println("</tr>");
				}
				out.println("</table>");
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
			window.location = ("SearchArtist.jsp");
		}

		function call2() {
			window.location = ("Index.jsp");
		}
	</script>
</body>
</html>
