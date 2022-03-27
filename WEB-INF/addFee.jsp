
<%@ page import ="java.sql.*,java.lang.ClassNotFoundException" %>
<html>
	<head>
	</head>
	<body>
		
		<%
			Connection con = null;
			PreparedStatement ps = null;
			
		
			String selectID = request.getParameter("stdtxt");
			int amount = Integer.parseInt(request.getParameter("amounttxt"));
			int paid = Integer.parseInt(request.getParameter("pfeetxt"));
			String dat = request.getParameter("datetxt");
			String month = request.getParameter("monthtxt");
			int total = Integer.parseInt(request.getParameter("totaltxt"));
			int balance = Integer.parseInt(request.getParameter("blancetxt"));
			
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");
				
				if(con != null)
				{
					String query ="insert into feetbl values(?,?,?,?,?,?,?)";
					
					ps = con.prepareStatement(query);
					ps.setString(1,selectID);
					ps.setInt(2,amount);
					ps.setInt(3,paid);
					ps.setString(4,dat);
					ps.setString(5,month);
					ps.setInt(6,total);
					ps.setInt(7,balance);
					
					int result = ps.executeUpdate();
					if(result != 0)
					{
						out.print("Data Successfully Inserted");
					}
					else
					{
						out.print("Sorry,Data Not Insert");
					}
				}
				else
				{
					out.print("Sorry,No Connection Done");
				}
			}
			catch(ClassNotFoundException cnfe)
			{
				out.print("Sorry,Class of connection have problem");
			}
			catch(SQLException sqlexp)
			{
				out.print("Sorry, SQL Exception done");
			}
		%>
	</body>
</html>