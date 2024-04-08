package br.com.curso.servlet;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

@WebServlet("/create-user")
public class createCursoServlet extends HttpServlet {

    @java.lang.Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String username = req.getParameter("user-name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String type = req.getParameter("type");
        System.out.println("O nome do user é " + username);
        System.out.println("Senha: " + password);
        System.out.println("Email " + email);
        System.out.println("tipo " + type);

        req.getRequestDispatcher("index.html").forward(req, resp);


    }
}
