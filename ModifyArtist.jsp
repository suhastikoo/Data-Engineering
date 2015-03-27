<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<body>
	<%
		String ID = request.getParameter("id");
		String first = Character.toString(ID.charAt(0));
		//out.println(first);
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
			out.println("<h1 align=center>Modify Artist</h1>");
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
					.prepareStatement("SELECT * FROM artist where artist_id="
							+ ID);
			//pstmt.setInt(1, ID);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				out.println("<tr>");
				String temp = rs.getString("artist_id");
				String name = rs.getString("name").replaceAll(" ", "/");
				String year = rs.getString("birth_year");
				String country = rs.getString("country").replaceAll(" ",
						"/");
				String des = rs.getString("description").replaceAll(" ",
						"/");

				out.println("<td><input type=text id=myid  readonly value=" + temp + "></td>");
				out.println("<td><input type=text id=myname value=" + name
						+ ">" + "</td>");
				out.println("<td><input type=text id=myyear value=" + year
						+ ">" + "</td>");
				out.println("<td><input type=text id=mycountry value="
						+ country + ">" + "</td>");
				out.println("<td><input type=text id=mydes value=" + des
						+ ">" + "</td>");
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
			<td><input type="button" value="Home" onClick=call2()></td>
			<td><input type="button" value="Update" onClick=call1()>
			</td>
		</tr>
	</table>

	<script>
		function call1() {
			var id = document.getElementById('myid').value;
			var name = document.getElementById('myname').value;
			var year = document.getElementById('myyear').value;
			var country = document.getElementById('mycountry').value;
			var des = document.getElementById('mydes').value;
			window.location = ("Confirmation.jsp?id="+id+"&name="+name+"&year="+year+"&coun="+country+"&des="+des);
		}

		function call2() {
			window.location = "Index.jsp";
		}
	</script>
</body>
</html>
