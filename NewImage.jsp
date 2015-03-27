<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<body>
	<br>
	<h1 align="center">Add New Image</h1>
	<br>
	<form action="Upload" method="post" enctype="multipart/form-data">
	<table align="center" border=\"1\">
		<!-- 		<tr> -->
		<!-- 			<td>Artist ID</td> -->
		<!-- 			<td></td> -->
		<!-- 		</tr> -->
		<tr>
			<td>Title</td>
			<td><input type="text" name="title">
			</td>
		</tr>
		<tr>
			<td>Link</td>
			<td><input type="text" name="link">
			</td>
		</tr>
		<tr>
			<td>Gallery ID</td>
			<td><input type="text" name="gallery">
			</td>
		</tr>
		<tr>
			<td>Artist ID</td>
			<td><input type="text" name="artist">
			</td>
		</tr>
<!-- 		<tr> -->
<!-- 			<td>Detail ID</td> -->
<!-- 			<td><input type="text" id="detail"> -->
<!-- 			</td> -->
<!-- 		</tr> -->
		<tr>
			<td>Year</td>
			<td><input type="text" name="year">
			</td>
		</tr>
		<tr>
			<td>Type</td>
			<td><input type="text" name="type">
			</td>
		</tr>
		<tr>
			<td>Width</td>
			<td><input type="text" name="width">
			</td>
		</tr>
		<tr>
			<td>Height</td>
			<td><input type="text" name="height">
			</td>
		</tr>
		<tr>
			<td>Location</td>
			<td><input type="text" name="loc">
			</td>
		</tr>
		<tr>
			<td>Description</td>
			<td><input type="text" name="des">
			</td>
		</tr>
		<tr>
			<td>Image</td>
			<td><input type="file" name="image">
			</td>
		</tr>
	</table>
	
	
<!-- 	<table align="center"> -->
<!-- 	<tr> -->
<!-- 	<td>Link</td> -->
<!-- 	<td><input type="submit" id="submit" value="Browse"></td> -->
<!-- 	</tr> -->
<!-- 	</table> -->

	<br>
	<table align="center">
		<tr>
			<td><input type="button" value="Back" onClick=call1()></td>
			<td><input type="submit" value="Submit">
			</td>
		</tr>
	</table>


	<script type="text/javascript">
		function call1() {
			window.location = ("Index.jsp");
		}
		function funct() {
// 			var title = document.getElementById('title').value;
// 			var gallery = document.getElementById('gallery').value;
// 			var artist = document.getElementById('artist').value;
// 			var detail = document.getElementById('detail').value;
// 			var year = document.getElementById('year').value;
// 			var type = document.getElementById('type').value;
// 			var width = document.getElementById('width').value;
// 			var height = document.getElementById('height').value;
// 			var loc = document.getElementById('loc').value;
// 			var des = document.getElementById('description').value;
// 			window.location = "ImageAdded.jsp?title=" + title + "&gallery=" + gallery
// 					+ "&artist=" + artist + "&year=" + year+ "&type=" + type+ "&width=" + width
// 					+ "&height=" + height+ "&loc=" + loc+ "&des=" + des;
		}
	</script>
</form>
</body>
</html>
