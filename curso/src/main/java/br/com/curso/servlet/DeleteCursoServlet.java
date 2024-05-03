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

@WebServlet("/delete-curso")
public class DeleteCursoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        new Authentication();

        String id = req.getParameter("id");
        cursoDao cursoDao = new cursoDao();
        userDao userDao = new userDao();

        cursoDao.deleteCarById(id);

        User userLog = userDao.userLogado();

        List<Curso> cursos = cursoDao.ListCurso();

        resp.sendRedirect(req.getContextPath() + "/Authentication");
    }
}
