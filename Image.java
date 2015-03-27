

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class Image
 */
@WebServlet("/Image")
public class Image extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Image() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("imgid"));
		try {
			System.out.print("Connectin in the servlet of the image.jsp");
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			String url = "jdbc:mysql://127.0.0.1:3306/gallery";
			String ID = "gallery";
			String pwd = "eecs221";
			Connection con = DriverManager.getConnection(url, ID, pwd);
			Statement st = con.createStatement();
			String strQuery = "select image from image where image_id="
					+ id;
			ResultSet rs = st.executeQuery(strQuery);
			System.out.println(strQuery);
			String imgLen = "";
			if (rs.next()) {
				imgLen = rs.getString(1);
			}
			rs = st.executeQuery(strQuery);
			if (rs.next()) {
				int len = imgLen.length();
				byte[] rb = new byte[len];
				InputStream readImg = rs.getBinaryStream(1);
				int index = readImg.read(rb, 0, len);
				st.close();
				response.reset();
				response.getOutputStream().write(rb, 0, len);
				response.getOutputStream().flush();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
