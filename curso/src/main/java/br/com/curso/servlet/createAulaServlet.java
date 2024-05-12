package br.com.curso.servlet;

import br.com.curso.dao.aulaDao;
import br.com.curso.model.Aula;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/create-aula")

public class createAulaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String titulo, contentAula, idFk, id;
        id = req.getParameter("idAula");
        titulo = req.getParameter("aula-name");
        contentAula = req.getParameter("aula-content");
        idFk = req.getParameter("fkCurso");

        Aula aula = new Aula(id, idFk, titulo, contentAula);
        aulaDao auladao = new aulaDao();

        if (id.isBlank()) {
            auladao.createAula(aula);
        } else {
            auladao.updateAula(aula);
        }


        resp.sendRedirect("/find-aulas");

    }
}
