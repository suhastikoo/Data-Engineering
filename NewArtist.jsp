<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<body>
	<br>
	<h1 align="center">Add New Artist</h1>
	<br>
	<table align="center" border=\"1\">
		<!-- 		<tr> -->
		<!-- 			<td>Artist ID</td> -->
		<!-- 			<td></td> -->
		<!-- 		</tr> -->
		<tr>
			<td>Name</td>
			<td><input type="text" id="name">
			</td>
		</tr>
		<tr>
			<td>Birth Year</td>
			<td><input type="text" id="year">
			</td>
		</tr>
		<tr>
			<td>Country</td>
			<td><input type="text" id="country">
			</td>
		</tr>
		<tr>
			<td>Description</td>
			<td><input type="text" id="description">
			</td>
		</tr>
<!-- 		<tr> -->
<!-- 			<td align="center" width=50%><input type="button" value="Submit" -->
<!-- 				onClick=funct()> -->
<!-- 			</td> -->
<!-- 		</tr> -->
	</table>

	<br>
	<table align="center">
		<tr>
			<td><input type="button" value="Back" onClick=call1()></td>
			<td><input type="button" value="Submit" onClick=funct()>
			</td>
		</tr>
	</table>


	<script type="text/javascript">
		function call1() {
			window.location = ("Index.jsp");
		}
		function funct() {
			var name = document.getElementById('name').value;
			var year = document.getElementById('year').value;
			var country = document.getElementById('country').value;
			var des = document.getElementById('description').value;
			window.location = "ArtistAdded.jsp?name=" + name + "&year=" + year
					+ "&country=" + country + "&des=" + des;
		}
	</script>

</body>
</html>
