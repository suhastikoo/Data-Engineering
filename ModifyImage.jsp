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
			out.println("<h1 align=center>Modify Image</h1>");
			stmt = con.createStatement();
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
					.prepareStatement("SELECT * FROM image as i, detail as d where i.image_id="+ID+" and d.image_id="+ID);
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

				out.println("<td><input type=text id=myid  readonly value=" + temp + "></td>");
				out.println("<td><input type=text id=mytitle value=" + title
						+ ">" + "</td>");
				//out.println("<td><img src=Image?imgid=" + temp +" width=60px height=60px>"+ "</td>");
				out.println("<td><input type=text id=mylink value=" + link
						+ ">" + "</td>");
				out.println("<td><input type=text id=myyear value=" + year
						+ ">" + "</td>");
				out.println("<td><input type=text id=mytype value="
						+ type + ">" + "</td>");
				out.println("<td><input type=text id=mylocation value="
						+ location + ">" + "</td>");
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
			var title = document.getElementById('mytitle').value;
			var year = document.getElementById('myyear').value;
			var type = document.getElementById('mytype').value;
			var loc = document.getElementById('mylocation').value;
			var des = document.getElementById('mydes').value;
			var link = document.getElementById('mylink').value;
			window.location = ("ModConf.jsp?id="+id+"&title="+title+"&link="+link+"&year="+year+"&type="+type+"&loc="+loc+"&des="+des);
		}

		function call2() {
			window.location = "Index.jsp";
		}
	</script>
</body>
</html>
