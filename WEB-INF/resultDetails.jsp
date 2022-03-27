<%@ page import ="java.sql.*" %>
<html>
	<head>
		<link href ="css/bootstrap.min.css" rel ="stylesheet">
		<script src ="js/jquery.min.js"></script>
		<script src ="js/popper.min.js"></script>
		<script src ="js/bootstrap.min.js"></script>
		<title>Result Details</title>
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
						<a href ="#" class ="dropdown-item">Result Details</a>
						<div class ="dropdown-divider"></div>
						<a href ="fee" class ="dropdown-item">Fee Details</a>
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
				<h4 class ="text-light" style ="padding-left:6.5%;padding-top:0.5%;">Result Details :</h4>
			</div>
			
			<div class ="container">
				<div class ="row" style ="width:90%;padding-left:13%;padding-top:1%;">
					<div style ="width:40%;">
						<form action ="" method ="">
						<div class ="form-gorup">
							<input type ="text" class ="form-control" name ="nametxt" placeholder ="Search By Student ID...">
						</div>
					</div>
					<div style ="width:40%;padding-left:1%">
						<div class ="form-gorup">
							<input type ="text" class ="form-control" name ="emailtxt" placeholder ="Search By Student Name...">
						</div>
					</div>
					<div style ="width:20%;padding-left:1%">
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
			
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");
				if(con != null)
				{
					
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
				out.print("Sorry,SQL Exception Occured");
			}
			
			
			
			
			%>
			<div class ="container">
				<table class ="table table-striped table-sm table-bordered table-dark" style ="margin-top:2%">
					<thead class ="bg-warning">
						<th>Student ID</th>
						<th>Student Name</th>
						<th>Software Mark</th>
						<th>Networking Mark</th>
						<th>Database Mark</th>
						<th>Total Mark</th>
						<th>AVG Mark</th>
						<th>Grade</th>
						<th>Edite</th>
					</thead>
					<tbody>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
					</tbody>
				</table>
			</div>
		</div>
	</body>
</html>