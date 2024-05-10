package br.com.curso.servlet;

import br.com.curso.dao.userDao;
import br.com.curso.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet("/find-all-users")
public class listUserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        List<User> users = new userDao().findAllUsers();

        req.setAttribute("users", users);
        req.getRequestDispatcher("listUsers.jsp").forward(req, resp);

    }
}
