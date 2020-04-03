package com.gen.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.org.apache.xpath.internal.operations.And;

public class AjaxServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		response.setHeader("Cache-Control", "no-store");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
		String id = request.getParameter("id");
		String nm = request.getParameter("nm");
		System.out.println(request.getContentType());
		if ((id == null || "".equals(id.trim())) && (nm == null || "".equals(nm.trim()))) {
			//out.write("NO");
			out.write("{'msgId':'<font color=\\'red\\'>对不起，用户名不可用！！请重新输入！</font>'}");
			//out.write("{'msgId':'用户名不可用！'}");
		} else if (id.equals("admin")) {
			//out.write("NO");
			out.write("{'msgId':'<font color=\\'red\\'>对不起，用户名不可用！！请重新输入！</font>'}");
			//out.write("{'msgId':'用户名不可用！'}");
		} else {
			//out.write("OK");
			out.write("{'msgId':'<font color=\\'green\\'>恭喜！！用户名可用！</font>'}");
			//out.write("{'msgId':'用户名可用！'}");
		}
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response)

	throws ServletException, IOException {
		doGet(request, response);
	}

	public void destroy() {
		super.destroy();
	}

	public void init() throws ServletException {
		super.init();
	}
}
