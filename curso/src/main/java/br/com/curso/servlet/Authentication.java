
package br.com.curso.servlet;

import java.util.List;

import br.com.curso.dao.userDao;
import br.com.curso.model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Authentication")

public class Authentication extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher rd = req.getRequestDispatcher("login.html");
        rd.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //armazenando informações para fazer a verificação
        String email = req.getParameter("email");
        String password = req.getParameter("senha");

        List<User>  allUsersInBD = new userDao().findAllUsers();
        List<String> usersEmailsBD = new userDao().listEmail();
        List<String> userPasswordBD = new userDao().listPass();
        //---------------------------------------------------------

        //verificação
        if(usersEmailsBD.contains(email)){

            //verificação da senha
            int pos = usersEmailsBD.indexOf(email);
            String senhaguardada = userPasswordBD.get(pos);

                //se a senha estiver correta
                if(senhaguardada.equals(password)) {
                    //verifica o tipo do usuario q localizou
                    for (User user : allUsersInBD) {
                        if (user.getUserEmail().equals(email)) {
                            String userType = user.getUserType();

                            if (userType.equals("ADM")) {
                                req.getRequestDispatcher("index.html").forward(req, resp);

                            } else if (userType.equals("PROFESSOR")) {
                                req.getRequestDispatcher("listUsers.jsp").forward(req, resp);
                            } else if (userType.equals("STUDENT")) {
                                req.getRequestDispatcher("listUsers.jsp").forward(req, resp);
                            }
                        }
                    }
                }
                //se não
                else {
                    req.getRequestDispatcher("loginError.html").forward(req, resp);
                }
        }else {
            req.getRequestDispatcher("loginError.html").forward(req, resp);
        }
    }
}
