package br.com.curso.servlet;

import br.com.curso.dao.aulaDao;
import br.com.curso.model.Aula;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/create-aula")

public class createAulaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String titulo, contentAula, idFk, id;
        id = req.getParameter("idAula");
        titulo = req.getParameter("aulaName");
        contentAula = req.getParameter("aulaContent");
        idFk = req.getParameter("fkCurso");

        contentAula = format(contentAula);

        Aula aula = new Aula(id, idFk, titulo, contentAula);
        aulaDao auladao = new aulaDao();

        if (id.isBlank()) {
            auladao.createAula(aula);
        } else {
            auladao.updateAula(aula);
        }
        HttpSession session = req.getSession(false);

        if(session != null) {
            String idCurso = session.getAttribute("idCursoAtual").toString();

            resp.sendRedirect("/find-aulas?id=" + idCurso);
        }



    }
    public String format(String url) {
        if (url != null && url.contains("watch?v=")) {
            String[] parts = url.split("watch\\?v=");

            // Certifique-se de que existe uma segunda parte após o split.
            if (parts.length > 1) {
                String videoId = parts[1];
                System.out.println(videoId); // Isso mostrará o ID do vídeo no log.
                int ampIndex = videoId.indexOf('&'); // Encontra o índice do primeiro parâmetro adicional
                if (ampIndex != -1) {
                    videoId = videoId.substring(0, ampIndex); // Remove parâmetros adicionais
                }
                return "https://www.youtube.com/embed/" + videoId;
            }
        }
        // Retorna uma URL padrão caso não encontre "watch?v=" na URL ou se o ID do vídeo não está presente
        return "https://www.youtube.com/embed/dQw4w9WgXcQ";
    }

}
