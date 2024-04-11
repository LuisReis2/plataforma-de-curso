package br.com.curso.servlet;


import br.com.curso.dao.userDao;
import br.com.curso.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

@WebServlet("/create-user")
public class createUserServlet extends HttpServlet {

    @java.lang.Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String username = req.getParameter("user-name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String type = req.getParameter("type");
        User user = new User(username, email, password, type);

        System.out.println("O nome do user é " + username);
        System.out.println("Senha: " + password);
        System.out.println("Email " + email);
        System.out.println("tipo " + type);
        userDao userDao = new userDao();
        userDao.createUser(user);
        req.getRequestDispatcher("index.html").forward(req, resp);


    }
}
