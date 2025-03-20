<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<title>table</title>
<body>
<%
		String myday = request.getParameter("Day");
		String myhour = request.getParameter("Hour");
		String myfullname = request.getParameter("Fullname");
		String myphoneno = request.getParameter("Phoneno");
		String mynperson = request.getParameter("Nperson");
		

		Connection con = null;
		Statement stmt = null;
		boolean dbinserted = false;
		
		String DBPassword = "";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sitora", "root", "root");
			stmt = con.createStatement();
			int count = stmt.executeUpdate("insert into tablebook(Day,Hour,Fullname,Phoneno,Nperson)VALUES('"+myday+"','"+myhour+"','"+myfullname+"','"+myphoneno+"','"+mynperson+"')");
			if(count > 0){
				dbinserted = true;
			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			if (stmt != null)
				stmt.close();
			if (con != null)
				con.close();
		}

		if (dbinserted) {
			response.sendRedirect("payment.html");
		} else {
			out.print("Table not booked.");
			%> <a href="table.html">Try Again here </a><%
		}
	%>

</body>
</html>
