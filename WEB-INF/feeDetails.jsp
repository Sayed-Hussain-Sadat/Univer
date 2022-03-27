<%@ page import ="java.sql.*" %>
<html>
	<head>
		<link href ="css/bootstrap.min.css" rel ="stylesheet">
		<script src ="js/jquery.min.js"></script>
		<script src ="js/popper.min.js"></script>
		<script src ="js/bootstrap.min.js"></script>
		<title>Fee Details</title>
		<style>
			.par
			{
				position:absolute;
				top:0;
				bottom:0;
				left:0;
				right:0;
				background-image:url('images/harvard/har1.jpg');
				background-color:rgb(200,200,120,0.999);
				background-blend-mode:overlay;				
			}
		</style>
	</head>
	<body>
		<div class ="par">
			<ul class ="nav nav-tabs justify-content-end bg-warning nav-justified">
				<li class ="flex-grow-1">
					<img src ="images/log.png" width ="300" height ="40">
				</li>
				<li class ="nav-item">
					<a href ="adminstrator.html" class ="nav-link" >Home</a>
				</li>
				<li class ="nav-item dropdown">
					<a href ="#" class ="nav-link dropdown-toggle" data-toggle ="dropdown">Administration</a>
					<div class ="dropdown-menu">
						<a href ="attendance.html" class ="dropdown-item">Add Attendance</a>
						<div class ="dropdown-divider"></div>
						<a href ="addSubject.html" class ="dropdown-item">Add Subject</a>
						<div class ="dropdown-divider"></div>
						<a href ="addUser.html" class ="dropdown-item">Add User</a>
						<div class ="dropdown-divider"></div>
						<a href ="feeDetails.html" class ="dropdown-item">Add Fee</a>
					</div>
				</li>
				<li class ="nav-item dropdown">
					<a href ="#" class ="nav-link dropdown-toggle" data-toggle ="dropdown">Details</a>
					<div class ="dropdown-menu">
						<a href ="std" class ="dropdown-item">Student Details</a>
						<div class ="dropdown-divider"></div>
						<a href ="att" class ="dropdown-item">Attendance Details</a>
						<div class ="dropdown-divider"></div>
						<a href ="#" class ="dropdown-item">Subject Details</a>
						<div class ="dropdown-divider"></div>
						<a href ="result" class ="dropdown-item">Result Details</a>
						<div class ="dropdown-divider"></div>
						<a href ="#" class ="dropdown-item">Fee Details</a>
					</div>
				</li>
				<li class ="nav-item dropdown">
					<a href ="#" class ="nav-link dropdown-toggle" data-toggle ="dropdown">My Account</a>
					<div class ="dropdown-menu">
						<a href ="myProfile.html" class ="dropdown-item">My Profile</a>
						<div class ="dropdown-divider"></div>
						<a href ="chengPassword.html" class ="dropdown-item">Change Password</a>
					</div>
				</li>
				<li class ="nav-item">
					<a href ="index.html" class ="nav-link">Log Out</a>
				</li>
			</ul>
			
			
			<div class ="" style ="width:100%;height:50px;background-color:black">
				<h4 class ="text-light" style ="padding-left:6.5%;padding-top:0.5%;">Fee Details :</h4>
			</div>
			
			<div class ="container">
				<div class ="row" style ="width:90%;padding-left:19%;padding-top:1%;">
					<div style ="width:40%;">
						<form action ="fee" method ="POST">
						<div class ="form-gorup">
							<input type ="text" class ="form-control" name ="idtxt" placeholder ="Search By Student ID...">
						</div>
					</div>
					<div style ="width:40%;padding-left:1%">
						<div class ="form-grou">
							<input type ="submit" class ="btn btn-primary btn-block" value ="Search">
						</div>
						</form>
					</div>
				</div>
			</div>
			
		<%
			Connection con = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			
			String idStr = request.getParameter("idtxt");
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");
				if(con != null)
				{
					String query ="select id,month,amount,paid,balance,total,datte from feetbl where id = ?";
					ps = con.prepareStatement(query);
					ps.setString(1,idStr);
					
					rs = ps.executeQuery();
		%>
			<div class ="container">
				<table class ="table table-striped table-sm table-bordered table-dark" style ="margin-top:2%">
					<thead class ="bg-warning">
						<th>S.ID</th>
						<th>Month</th>
						<th>Amount Fee</th>
						<th>Paid Fee</th>
						<th>Balance Fee</th>
						<th>Total Fee</th>
						<th>Date</th>
						<th>Edite</th>
					</thead>
				<%
					while(rs.next())
					{
						%>
					<tbody>
						<tr>
							<td><% out.print(rs.getString("id")); %></td>
							<td><% out.print(rs.getString("month")); %></td>
							<td><% out.print(Integer.parseInt(rs.getString("amount"))); %></td>
							<td><% out.print(Integer.parseInt(rs.getString("paid"))); %></td>
							<td><% out.print(Integer.parseInt(rs.getString("balance"))); %></td>
							<td><% out.print(Integer.parseInt(rs.getString("total"))); %></td>
							<td><% out.print(rs.getString("datte")); %></td>
							<td style ="float:right">
								<a href ="#tableModal" data-toggle ="modal" class ="btn btn-success">Edit</a>
								<button type ="button" class ="btn btn-danger">  delete  </button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
		<div class ="modal" id ="tableModal">
			<div class ="modal-dialog">
				<div class ="modal-content">
					<div class ="modal-header">
						<h5 class ="modal-title">Edite</h5>
						<button type ="button" class ="close" data-dismiss ="modal">&times;</button>
					</div>
					<div class ="modal-body">
						<form method ="fee" action ="POST">
							<div class ="form-group">
								<label for ="sid">S.ID : </label>
								<input type ="text" class ="form-control" name ="idtxt" id ="sid" value ="<% out.print(rs.getString("id")); %>" />
							</div>
							<div class ="form-group">
								<label for ="mon">Month : </label>
								<input type ="text" class ="form-control" name ="monthtxt" id ="mon"value ="<% out.print(rs.getString("month")); %>" />
							</div>
							<div class ="form-group">
								<label for ="amount">Amount Fee : </label>
								<input type ="text" class ="form-control" name ="amounttxt" id ="amount"value ="<% out.print(Integer.parseInt(rs.getString("amount"))); %>" />
							</div>
							<div class ="form-group">
								<label for ="paid">Paid Fee :</label>
								<input type ="text" class ="form-control" name ="paidtxt" id ="paid"value ="<% out.print(Integer.parseInt(rs.getString("paid"))); %>" />
							</div>
							<div class ="form-group">
								<label for ="balan">Balance Fee : </label>
								<input type ="text" class ="form-control" name ="balancetxt" id ="balan" value ="<% out.print(Integer.parseInt(rs.getString("balance"))); %>" />
							</div>
							<div class ="form-group">
								<label for ="total">Total Fee : </label>
								<input type ="text" class ="form-control" name ="totaltxt" id ="total"  value ="<% out.print(Integer.parseInt(rs.getString("total"))); %>" />
							</div>
							<div class ="form-gorup">
								<label for ="dt">Date :</label>
								<input type ="text" class ="form-control" name ="datetxt" id ="dt" value ="<% out.print(rs.getString("datte")); %>" />
							</div>
							<div class ="form-group">
								<input type ="submit" class ="form-control btn-primary" name ="save" value ="Save" />
							</div>
						</form>
					</div>
					<div class ="modal-footer">
						<button type ="button" class ="btn btn-info" data-dismiss ="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
			
	<%					
						
					}
				}
				else
				{
					out.print("Sorry,No Connection Done");
				}
			}
			catch(ClassNotFoundException cnfe)
			{
				out.print("Sorry,Not Found Such Class");
			}
			catch(SQLException sqlexp)
			{
				out.print("SQL Exception Occured");
			}
			
			
			%>
			
				
		</div>
	</body>
</html>