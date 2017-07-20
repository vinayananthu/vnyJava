package org.vny;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegisterCheck
 */
@WebServlet("/RegisterCheck")
public class RegisterCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegisterCheck() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		String uname = request.getParameter("uname");
		String password = request.getParameter("password");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		CryptoSecurity crypto = new CryptoSecurity();
		String encryptedPassword = crypto.encryptPassword(password);
		User user = new User();
		// user.setUser_id(1);
		user.setUser_name(uname);
		user.setPassword(encryptedPassword);
		user.setLname(lname);
		user.setFname(fname);
		DataInsertion data = new DataInsertion();
		if (data.checkUserNameExists(uname) && !uname.equals("") && !password.equals("")) {
			data.insertInfo(user);
			response.sendRedirect("regSuccess.jsp");
		} else {
			response.sendRedirect("regFail.jsp");
		}
	}

}
