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


@WebServlet("/find-aulas")
public class ListAulas extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idCurso = req.getParameter("idCurso");

        List<Aula> aula = new aulaDao().listFkId(idCurso);
        req.setAttribute("aula", aula);
        req.getRequestDispatcher("list.jsp").forward(req, resp);
    }
}
