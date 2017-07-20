package org.vny;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SendMessage
 */
@WebServlet("/SendMessage")
public class SendMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SendMessage() {
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
		String msg = (String) request.getParameter("message");
		System.out.println("Message:" + msg);
		MessageService messageService = new MessageService();
		Message message = new Message();
		int key = 1;
		CryptoSecurity cryptoSec = new CryptoSecurity();
		if (!msg.equals("")) {
			System.out.println((String) request.getParameter("toUSN"));
			System.out.println((String) request.getParameter("fromUSN"));
			message.setFromUname((String) request.getParameter("fromUSN"));
			message.setToUname((String) request.getParameter("toUSN"));
			String mesg = request.getParameter("message");
			if (request.getParameter("key") != null) {
				key = Integer.parseInt(request.getParameter("key"));
			} else {
				key = 1;
			}
			if (key < 1) {
				key = 1;
			}
			message.setMessage(cryptoSec.encryptString(mesg, key));
			// message.setSkey(key);
			messageService.insertMessage(message);
			response.sendRedirect("MessageSent.jsp");
		} else {
			response.sendRedirect("error.jsp");
		}
	}

}
