package org.vny;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginCheck
 */
@WebServlet("/LoginCheck")
public class LoginCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginCheck() {
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
		User user = null;
		CryptoSecurity crypto = new CryptoSecurity();
		String uname = request.getParameter("uname");
		String password = request.getParameter("password");
		//String decryptPassword = crypto.decryptPassword(password);
		DataInsertion data = new DataInsertion();
		if (!data.checkUserNameExists(uname) && !password.equals(null) && !uname.equals(null)) {
			user = data.getUserByUserName(uname);
			if (data.validatePassword(uname, password)) {
				request.getSession().setAttribute("user", user);
				response.sendRedirect("member.jsp");
			} else {
				response.sendRedirect("error.jsp");
			}
		} else {
			response.sendRedirect("error.jsp");
		}
	}
}
