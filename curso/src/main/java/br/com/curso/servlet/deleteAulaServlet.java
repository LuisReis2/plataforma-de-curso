package br.com.curso.servlet;

import br.com.curso.dao.aulaDao;
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

@WebServlet("/DeleteAula")
public class deleteAulaServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        String aulaid = req.getParameter("IdAula");

        cursoDao cursoDao = new cursoDao();
        userDao userDao = new userDao();
//        User userLog = userDao.userLogado();

        List<Curso> cursos = cursoDao.ListCurso();

        new aulaDao().deleteAulaBYid(aulaid);

        req.setAttribute("cursos", cursos);
//        req.setAttribute("User", userLog);

        resp.sendRedirect(req.getContextPath() + "/Authentication");
    }
}
