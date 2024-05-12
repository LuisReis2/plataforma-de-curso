package br.com.curso.servlet;

import br.com.curso.dao.aulaDao;
import br.com.curso.model.Aula;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/viewAula")
public class viewAulaServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String id = req.getParameter("idAula");

        Aula aula = new aulaDao().returnAula(id);
        System.out.println("DEBUG" + aula.getContentAula());
        req.setAttribute("aula", aula);



        req.getRequestDispatcher("viewAula.jsp").forward(req, resp);
    }

}
