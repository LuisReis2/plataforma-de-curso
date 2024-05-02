package br.com.curso.servlet;

import br.com.curso.dao.cursoDao;
import br.com.curso.dao.userDao;
import br.com.curso.model.Curso;
import br.com.curso.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/create-curso")
public class createCursoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        new Authentication();

        String nomeCurso = req.getParameter("nomeCurso");
        String descCurso = req.getParameter("descCurso");
        String idCurso = req.getParameter("idCurso");

        Curso curso = new Curso(descCurso, nomeCurso);
        cursoDao dao = new cursoDao();

        if(idCurso.isBlank()){
            dao.createCurso(curso);
        }else{
            dao.updateCursoById(curso);
        }
        User userLog = new userDao().userLogado();
        List<Curso> cursos = dao.ListCurso();
        req.setAttribute("cursos", cursos);
        req.setAttribute("User", userLog);
        req.getRequestDispatcher("menu.jsp").forward(req,resp);

    }
}
