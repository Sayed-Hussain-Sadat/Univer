<%@ page import ="java.sql.*" %>
<html>
	<head>
		<link href ="css/bootstrap.min.css" rel ="stylesheet" >
		<script src ="js/jquery.min.js"></script>
		<script src ="js/popper.min.js"></script>
		<script src ="js/bootstrap.min.js"></script>
		<title>Attendance Details</title>
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
				background-attachment:fixed;
				background-repeat:no-repeat;
			}
		</style>
	</head>
	<body>
		<div class ="par">
			<ul class ="nav nav-tabs nav-justified nav-justified-content bg-warning">
				<li class ="flex-grow-1">
					<img src ="images/log.png" width ="300" height ="40" />
				</li>
				<li class ="nav-item">
					<a href ="adminstrator.html" class ="nav-link">Home</a>
				</li>
				<li class ="nav-item dropdown">
					<a href ="#" class ="nav-link dropdown-toggle" data-toggle ="dropdown">Administration</a>
					<div class ="dropdown-menu">
						<a href ="attendance.html" class ="dropdown-item">Add Attendance</a>
						<a href ="addSubject.html" class ="dropdown-item">Add Subject</a>
						<a href ="addUser.html" class ="dropdown-item">Add User</a>
						<a href ="feeDetails.html" class ="dropdown-item">Add Fee</a>
					</div>
				</li>
				<li class ="nav-item dropdown">
					<a href ="#" class ="nav-link dropdown-toggle" data-toggle ="dropdown">Details</a>
					<div class ="dropdown-menu">
						<a href ="std" class ="dropdown-item">Student Details</a>
						<a href ="#" class ="dropdown-item">Attendance Details</a>
						<a href ="#" class ="dropdown-item">Subject Details</a>
						<a href ="result" class ="dropdown-item">Result Details</a>
						<a href ="fee" class ="dropdown-item">Fee Details</a>
					</div>
				</li>
				<li class ="nav-item dropdown">
					<a href ="" class ="nav-link dropdown-toggle" data-toggle ="dropdown">My Account</a>
					<div class ="dropdown-menu">
						<a href ="" class ="dropdown-item">My Profile</a>
						<a href ="" class ="dropdown-item">Change Password</a>
					</div>
				</li>
				<li class ="nav-item">
					<a href ="index.html" class ="nav-link">Log Out</a>
				</li>
			</ul>
			
			<div style ="width:100%;height:50px;background-color:black">
				<h4 class ="text-light" style ="padding-left:6.5%;padding-top:0.5%;">Attendance Details :</h4>
			</div>
			
			
			<div class ="container">
				<div class ="row" style ="width:90%;margin-left:14%;padding-top:1%;">
					<div style ="width:40%;">
						<form action ="att" method ="POST">
							<div class ="form-group">
								<input type ="text" class ="form-control" name ="idtxt" placeholder ="Search By Student ID...">
							</div>
					</div>
					<div style ="width:40%;padding-left:1%">
							<div class ="form-group">
								<input type ="submit" class ="btn btn-block btn-primary" name ="search" value ="Search">
							</div>
						</form>
					</div>
				</div>
			</div>
			
			<%
				Connection con = null;
				PreparedStatement ps = null;
				Statement st = null;
				ResultSet rs = null;
				
				String idStr = request.getParameter("idtxt");
				try
				{
					Class.forName("oracle.jdbc.driver.OracleDriver");
					con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");
					if(con != null)
					{
						String query ="select id,name,subject,lecture,datte,status from attendancetbl where id = ?";
						
						ps = con.prepareStatement(query);
						ps.setString(1,idStr);
						
						rs = ps.executeQuery();
						
						
					%>	
						
						
			<div class ="container">
				<table class ="table table-striped table-sm table-bordered table-dark" style ="margin-top:2%">
					<thead class ="bg-warning">
						<th>S.NO</th>
						<th>Student Name</th>
						<th>Subject Name</th>
						<th>Lecture Name</th>
						<th>Date</th>
						<th>Statuse</th>
						<th>Edite</th>
					</thead>			
		<%				
						while(rs.next())
						{ 
							%>
					<tbody>
						<td><% out.print(rs.getString("id")); %></td>
						<td><% out.print(rs.getString("name")); %></td>
						<td><% out.print(rs.getString("subject")); %></td>
						<td><% out.print(rs.getString("lecture")); %></td>
						<td><% out.print(rs.getString("datte")); %></td>
						<td><% out.print(rs.getString("status")); %></td>
						<td style ="float:right">
						<a href ="#tableModal" data-toggle ="modal" class ="btn btn-success">Edit</a>
						<button type ="button" class ="btn btn-danger">  delete  </button>
						</td>
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
						<form method ="att" action ="POST">
							<div class ="form-group">
								<label for ="sno">S.No: </label>
								<input type ="text" class ="form-control" name ="idtxt" id ="sno" value ="<% out.print(rs.getString("id")); %>" />
							</div>
							<div class ="form-group">
								<label for ="stname">Student Name: </label>
								<input type ="text" class ="form-control" name ="stnametxt" id ="stname"value ="<% out.print(rs.getString("name")); %>" />
							</div>
							<div class ="form-group">
								<label for ="sbname">Subject Name: </label>
								<input type ="text" class ="form-control" name ="sbnametxt" id ="sbname"value ="<% out.print(rs.getString("subject")); %>" />
							</div>
							<div class ="form-group">
								<label for ="lcname">Lecture Name: </label>
								<input type ="text" class ="form-control" name ="lcnametxt" id ="lcname"value ="<% out.print(rs.getString("lecture")); %>" />
							</div>
							<div class ="form-group">
								<label for ="dt">Date: </label>
								<input type ="date" class ="form-control" name ="dttxt" id ="dt" value ="<% out.print(rs.getString("datte")); %>" />
							</div>
							<div class ="form-group">
								<label for ="stat">Statuse: </label>
								<input type ="text" class ="form-control" name ="stattxt" id ="stat"  value ="<% out.print(rs.getString("status")); %>" />
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
				catch(SQLException eqlexp)
				{
					out.print("Sorry,SQL Exception Occured");
				}
				

					String idDB = request.getParameter("idtxt");
					String nameDB = request.getParameter("stnametxt");
					String subjectDB = request.getParameter("sbnametxt");
					String lectureDB = request.getParameter("lcnametxt");
					String dateDB = request.getParameter("dttxt");
					String statusDB = request.getParameter("stattxt");
					
				
				
			
			
			%>
			
			
					
		
		
		
		
		
		
		
		</div>	
	</body>
</html>