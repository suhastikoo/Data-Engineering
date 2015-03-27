<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<!--   <head>     -->
<!--     <title>Bank Application</title>	 -->
<!--   </head> -->
<body background="http://4vector.com/i/free-vector-gallery-show-background-03-vector_017002_3.jpg" style="
    background-position-x: 50%;
">
	<%
		String funcID = request.getParameter("id");
		String name = request.getParameter("name");
		//out.println(funcID);
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
			out.println("</tr>");
			out.println("</table>");
			out.println("<br>");

			Statement stmt;
			PreparedStatement pstmt;
			ResultSet rs;
			stmt = con.createStatement(); // Statements allow to issue SQL queries to the database
			String sql = "SELECT * FROM image where gallery_id=" + funcID;
			rs = stmt.executeQuery(sql); // Result set get the result of the SQL query
			out.println("<table border=\"1\" align=center>");
			out.println("<tr>");
			out.println("<th>Image ID</th>");
			out.println("<th>Title</th>");
			out.println("<th>Link</th>");
			out.println("<th>Gallery ID</th>");
			out.println("<th>Artist ID</th>");
			out.println("<th>Detail ID</th>");
			out.println("<th>Image</th>");
			// 				out.println("<th>City</th>");
			out.println("</tr>");
			int count=0;
			while (rs.next()) {
				out.println("<tr>");
				String temp = rs.getString("image_id");
				String link = rs.getString("link");
				String title = rs.getString("title").replaceAll(" ","/");
				String artist_id = rs.getString("artist_id");
				String detail_id = rs.getString("detail_id");
				String URL = rs.getString("image");
				
				out.print("<td>" + "<a href = Details.jsp?title="+title+"&artist_id="+artist_id+"&detail_id="+detail_id+">");
				out.print(temp);
				out.println("</a>" + "</td>");
				
				out.println("<td>" + rs.getString("title") + "</td>");
				
				out.print("<td>" + "<a href ="+link+">");
				out.print(link);
				out.println("</a>" + "</td>");
				out.println("<td>" + rs.getString("gallery_id") + "</td>");
				out.println("<td>" + artist_id + "</td>");
				out.println("<td>" + detail_id + "</td>");
				
				out.println("<td><a href = Details.jsp?title="+title+"&artist_id="+artist_id+"&detail_id="+detail_id+">"+"<img src=Image?imgid=" + temp +" width=100px height=100px>"+ "</td>");
				
				out.println("</tr>");
				count++;
			}
			out.println("<h4 align=center><I>Total number of images: " + count+"</I></h4>");
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
<td><input type="button" value="Back" onClick=call1()></td>
<td><input type="button" value="Home" onClick=call2()></td>
</tr>
</table>

<script>
function call1(){
	window.location=("GalleryList.jsp");
}

function call2(){
	window.location=("Index.jsp");
}
</script>
</body>
</html>
