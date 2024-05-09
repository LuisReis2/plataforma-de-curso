package br.com.curso.servlet;

import br.com.curso.dao.ParticipantesDao;
import br.com.curso.model.Participantes;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/ListParticipantes")
public class ListParticipantes extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Participantes> participantes = new ParticipantesDao().ListParticipantes();
        req.setAttribute("participantes", participantes);
        req.getRequestDispatcher("ListParticipantes.jsp").forward(req, resp);
    }
}
