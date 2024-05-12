package br.com.curso.servlet;

import br.com.curso.dao.cursoDao;
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

@WebServlet("/meusCursos")
public class cursoPorUserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if(session != null){
            User usuario = (User) session.getAttribute("UserLog");

            List<Curso> cursos = new cursoDao().cursoPartipados(usuario.getUserEmail());
            for (Curso curso : cursos) {
                System.out.println("Nome do Curso: " + curso.getNomeCurso());
                System.out.println("Descrição do Curso: " + curso.getDescCurso());
                System.out.println("ID do Curso: " + curso.getIdCurso());
            }


            req.getSession().setAttribute("meusCursos", cursos);

            req.getRequestDispatcher("menu.jsp").forward(req, resp);
        }

    }
}
