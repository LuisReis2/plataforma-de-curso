package br.com.curso.servlet;

import br.com.curso.dao.cursoDao;
import br.com.curso.dao.userDao;
import br.com.curso.model.Curso;
import br.com.curso.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/login")
public class loginServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String email = req.getParameter("email");
        String senha = req.getParameter("senha");

        userDao userDao = new userDao();

        User userBasic = new User(email, senha); // user só com email e senha para validação

        boolean isValidUser = userDao.authentic(userBasic);

        if(isValidUser){
            User user = userDao.returnUser(email);
            req.getSession().setAttribute("UserLog", user);
            List<Curso> cursos = new cursoDao().ListCurso();
            req.setAttribute("cursos", cursos);

            req.getRequestDispatcher("menu.jsp").forward(req, resp);

        }else{
            req.setAttribute("message", "Credenciais invalidas!");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }
}
