package br.com.curso.servlet;

import br.com.curso.dao.aulaDao;
import br.com.curso.model.Aula;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/create-aula")

public class createAula  extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String titulo,contentAula,idFk;
        titulo = req.getParameter("aula-name");
        contentAula = req.getParameter("aula-content");
        idFk = req.getParameter("aula-fkid");

        Aula aula = new Aula(titulo,contentAula,idFk);
        aulaDao auladao = new aulaDao();
        auladao.createAula(aula);
        resp.sendRedirect("/find-aulas");
    }
}
