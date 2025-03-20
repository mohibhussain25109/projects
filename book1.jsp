<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<title>Book</title>
<body>
<%
		String mydestination = request.getParameter("destination");
		String mycheckin = request.getParameter("checkin");
		String mycheckout = request.getParameter("checkout");
		String mynroom = request.getParameter("nroom");
		String mynadult = request.getParameter("nadult");
		String mynchild = request.getParameter("nchild");
		String myemail = request.getParameter("email");
		String myphone = request.getParameter("phone");


		Connection con = null;
		Statement stmt = null;
		boolean dbinserted = false;
		
		String DBPassword = "";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sitora", "root", "root");
			stmt = con.createStatement();
			int count = stmt.executeUpdate("insert into book(destination,checkin,checkout,nroom,nadult,nchild,email,phone)VALUES('"+mydestination+"','"+mycheckin+"','"+mycheckout+"','"+mynroom+"','"+mynadult+"','"+mynchild+"','"+myemail+"','"+myphone+"')");
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
			out.print("Room booking has NOT been successfully inserted.");
			%> <a href="book.html">Try Again here </a><%
		}
	%>

</body>
</html>
