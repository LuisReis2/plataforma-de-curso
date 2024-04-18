
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

@WebServlet("/Authentication")

public class Authentication extends HttpServlet {
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

            if(senhaguardada.equals(password)) {
                //verifica o tipo do usuario q localizou
                for (User user : allUsersInBD) {
                    if (user.getUserEmail().equals(email)) {
                        String userType = user.getUserType();

                        if (userType.equals("ADM")) {
                            req.getRequestDispatcher("index.html").forward(req, resp);

                        } else if (userType.equals("PROFESSOR")) {
                            req.getRequestDispatcher("menu.html").forward(req, resp);
                        } else if (userType.equals("STUDENT")) {
                            req.getRequestDispatcher("menu.html").forward(req, resp);
                        }
                    }
                }
            }
            else {
                req.getRequestDispatcher("loginError.html").forward(req, resp);
            }
            //se não
        }
        else {
            req.getRequestDispatcher("loginError.html").forward(req, resp);
        }
    }
}
