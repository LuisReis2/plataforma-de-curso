package br.com.curso.servlet;


import br.com.curso.dao.userDao;
import br.com.curso.model.User;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/create-user")
public class createUserServlet extends HttpServlet {

    @java.lang.Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        new authentication();

        String username = req.getParameter("user-name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String type = req.getParameter("type");
        User user = new User(username, email, password, type);


        userDao userDao = new userDao();
        List<String> usersEmailsBD = new userDao().listEmail();
        if (!(usersEmailsBD.contains(email))) {
            userDao.createUser(user);
        } else {
            userDao.updateUser(user);
        }

        resp.sendRedirect(req.getContextPath() + "/Authentication");
    }
}
