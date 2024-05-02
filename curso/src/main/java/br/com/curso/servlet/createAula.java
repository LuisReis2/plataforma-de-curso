package br.com.curso.servlet;

import br.com.curso.dao.aulaDao;
import br.com.curso.model.Aula;
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

@WebServlet("/create-aula")

public class createAula  extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String titulo, contentAula, idFk, id;
        id = req.getParameter("idAula");
        titulo = req.getParameter("aula-name");
        contentAula = req.getParameter("aula-content");
        idFk = req.getParameter("aula-fkid");

        Aula aula = new Aula(id,idFk, titulo, contentAula);
        aulaDao auladao = new aulaDao();

        if(id.isBlank()){
            auladao.createAula(aula);
        }else{
            auladao.updateAula(aula);
        }


        cursoDao cursoDao = new cursoDao();
        userDao userDao = new userDao();
        User userLog = userDao.userLogado();

        new Authentication();
        List<Curso> cursos = cursoDao.ListCurso();
        req.setAttribute("cursos", cursos);
        req.setAttribute("User", userLog);
        req.getRequestDispatcher("menu.jsp").forward(req, resp);

    }
}
