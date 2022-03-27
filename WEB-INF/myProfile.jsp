
<%@page import ="java.sql.*;java.lang.ClassNotFoundException" %>
<html>
	<head>
	</head>
	<body>
		
		<%
			Connection con = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			
			String search = request.getParameter("searchtxt");
			String id = request.getParameter("logIDtxt");
			String name = request.getParameter("nametxt");
			String last = request.getParameter("lnametxt");
			String gender = request.getParameter("gendertxt");
			String dob = request.getParameter("DOBirthtxt");
			String phone = request.getParameter("phonetxt");
			
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");
				if(con != null)
				{
					String query ="select * from profiletbl where id = ?";
					ps = con.prepareStatement(query);
					ps.setString(1,search);
					
					rs = ps.executeQuery();
					while(rs.next())
					{
						<!--rs = response.setParameter("logIDtxt"); -->
						String idStr = rs.getString(2);
						String nameStr = rs.getString(3);
						String lastStr = rs.getString(4);
						String genderStr = rs.getString(5);
						String dobStr = rs.getString(6);
						String phoneStr = rs.getString(7);
						
						<!--id = request.getAttribute(idStr); -->
						
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
				out.print("Oh no SQL Exception accord");				
			}
			
		%>
	</body>
</html>