<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<body background="http://4vector.com/i/free-vector-gallery-show-background-03-vector_017002_3.jpg" style="
    background-position-x: 50%;
">
	<br>
	<h1 align="center">Add New Gallery</h1>
	<br>
	<table align="center" border=\"1\">
<!-- 		<tr> -->
<!-- 			<td>Gallery ID</td> -->
<!-- 			<td></td> -->
<!-- 		</tr> -->
		<tr>
			<td>Name</td>
			<td><input type="text" id="name">
			</td>
		</tr>
		<tr>
			<td>Description</td>
			<td><input type="text" id="description">
			</td>
		</tr>
	</table>
	<br>
	<table align="center">
		<tr>
			<td><input type="button" value="Back" onClick=call2()></td>
			<td align="center" width=50%><input type="button" value="Submit"
				onClick=funct()>
			</td>
		</tr>
	</table>

	<script type="text/javascript">
		function funct() {
			var des = document.getElementById('description').value;
			var nam = document.getElementById('name').value;
			window.location = "GalleryAdded.jsp?val=" + des + "&name=" + nam;
		}
		
		function call2() {
			window.location = ("Index.jsp");
		}
	</script>

</body>
</html>
