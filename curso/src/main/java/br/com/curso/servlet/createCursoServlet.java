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

@WebServlet("/create-curso")
public class createCursoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String nomeCurso = req.getParameter("nomeCurso");
        String descCurso = req.getParameter("descCurso");
        String idCurso = req.getParameter("idCurso");
        Curso curso = new Curso(nomeCurso, descCurso, idCurso);
        cursoDao dao = new cursoDao();
        System.out.println(curso.getIdCurso());
        System.out.println(curso.getNomeCurso());
        System.out.println(curso.getDescCurso());

        dao.createCurso(curso);

    }
}
