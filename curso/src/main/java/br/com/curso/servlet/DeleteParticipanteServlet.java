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

@WebServlet("/delete-participante")
public class DeleteParticipanteServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("idParticipante");
        String idCurso = req.getParameter("idCurso");
        ParticipantesDao partDao = new ParticipantesDao();
        partDao.deleteParticipantes(id);
        resp.sendRedirect("/ListParticipantes?id=" + idCurso);
    }
}
