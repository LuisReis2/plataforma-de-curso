package br.com.curso.servlet;

import br.com.curso.dao.ParticipantesDao;
import br.com.curso.dao.aulaDao;
import br.com.curso.model.Aula;
import br.com.curso.model.Participantes;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/create-participantes")
public class CreateParticipantesServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id_fk_user,  idFk_curso, id;
        id = req.getParameter("idParticipante");
        id_fk_user = req.getParameter("idUserFk");
        idFk_curso = req.getParameter("idCursoFk");

        ParticipantesDao part = new ParticipantesDao();

        Participantes participantes = new Participantes(id,id_fk_user,idFk_curso);
        if(id.isBlank()){
            part.createParticipantes(participantes);

        }else {
            part.updateParticipantes(participantes);
        }


        resp.sendRedirect("/ListParticipantes");

    }
}
