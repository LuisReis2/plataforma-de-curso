package br.com.curso.servlet;

import br.com.curso.dao.aulaDao;
import br.com.curso.dao.cursoDao;
import br.com.curso.dao.userDao;
import br.com.curso.model.Aula;
import br.com.curso.model.Curso;
import br.com.curso.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/deleteAula")
public class deleteAulaServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        String aulaid = req.getParameter("idAula");





        new aulaDao().deleteAulaBYid(aulaid);

        HttpSession session = req.getSession(false);

        if(session != null){
            String id = session.getAttribute("idCursoAtual").toString();

            System.out.println(id);

            List<Aula> aulas = new aulaDao().listFkId(id);

            req.setAttribute("aula", aulas);

            resp.sendRedirect("/find-aulas?id=" + id);
        }




    }
}
