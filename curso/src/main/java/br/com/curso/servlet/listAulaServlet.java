package br.com.curso.servlet;

import br.com.curso.dao.aulaDao;
import br.com.curso.dao.userDao;
import br.com.curso.model.Aula;
import br.com.curso.model.Curso;
import br.com.curso.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet("/find-aulas")
public class listAulaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idCurso = req.getParameter("id");

        req.getSession().setAttribute("idCursoAtual", idCurso);
        List<Aula> aulas = new aulaDao().listFkId(idCurso);


        req.setAttribute("aula", aulas);
        req.getRequestDispatcher("listAulas.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idCurso = req.getParameter("id");
        req.getSession().setAttribute("idCursoAtual", idCurso);
        List<Aula> aulas = new aulaDao().listFkId(idCurso);
        req.setAttribute("aula", aulas);
        req.getRequestDispatcher("listAulas.jsp").forward(req, resp);
    }
}
