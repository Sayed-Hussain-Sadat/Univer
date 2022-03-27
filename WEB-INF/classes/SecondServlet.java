package edu.error.demo;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.io.IOException;
import javax.servlet.ServletException;


public class SecondServlet extends HttpServlet
{
	public void doPost(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException
	{
		res.setContentType("text/html");
		PrintWriter pw = res.getWriter();
		
		pw.print("<center><h1>you are a valid user</h1></center>");
		pw.print("<center><h4> <a href='index.html'>Back to Index page</a></h4></center>");
	}

}