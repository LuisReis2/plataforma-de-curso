package br.com.curso.servlet;

import br.com.curso.dao.cursoDao;
import br.com.curso.model.Curso;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/find-all-cursos") // Esse list não está sendo utilizado, por enquanto, estou listando
                                // no Authenticatiio.java
public class ListCursosServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Curso> cursos = new cursoDao().ListCurso();


    }
}
