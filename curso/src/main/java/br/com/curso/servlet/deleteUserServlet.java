package br.com.curso.servlet;

import br.com.curso.dao.userDao;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/delete")
public class deleteUserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {


        String id = req.getParameter("userEmail");

        new userDao().DeleteUser(id);

        resp.sendRedirect(req.getContextPath() + "/Authentication");
    }

}