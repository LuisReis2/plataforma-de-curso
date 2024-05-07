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
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/Authentication")

public class authentication extends HttpServlet {
    private HttpSession session;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //armazenando informações para fazer a verificação
        String email = req.getParameter("email");
        String password = req.getParameter("senha");

        session = req.getSession();
        session.setAttribute("email", email);
        session.setAttribute("senha", password);

        List<User> allUsersInBD = new userDao().findAllUsers();
        List<String> usersEmailsBD = new userDao().listEmail();
        List<String> userPasswordBD = new userDao().listPass();
        //---------------------------------------------------------

        //verificação
        if (usersEmailsBD.contains(email)) {

            //verificação da senha
            int pos = usersEmailsBD.indexOf(email);
            String senhaguardada = userPasswordBD.get(pos);

            if (senhaguardada.equals(password)) {
                //verifica o tipo do usuario q localizou

                for (User user : allUsersInBD) {
                    if (user.getUserEmail().equals(email)) {
                        String userType = user.getUserType();

                        if (userType.equals("ADM")) {

                            // === Pegando informações do usuário
                            userDao userDao = new userDao();

                            User usuario = userDao.returnUser(email);

                            req.setAttribute("User", usuario);

                            userDao.registraUserLogado(usuario); // Registra o user no bd(Ele estará logado)

                            List<Curso> cursos = new cursoDao().ListCurso(); // Listando cursos

                            System.out.println(usuario.getUserEmail());
                            System.out.println(usuario.getUserName());

                         // atributo para trabalhar no jsp

                            req.getRequestDispatcher("menu.jsp").forward(req, resp);

                        } else if (userType.equals("PROFESSOR")) {
                            userDao dao = new userDao();
                            User usuario = dao.returnUser(email);
                            req.setAttribute("User", usuario);
                            req.getRequestDispatcher("menu.jsp").forward(req, resp);
                        } else if (userType.equals("STUDENT")) {
                            userDao dao = new userDao();
                            User usuario = dao.returnUser(email);
                            req.setAttribute("User", usuario);
                            req.getRequestDispatcher("menu.jsp").forward(req, resp);
                        }
                    }
                }
            } else {
                req.getRequestDispatcher("loginError.html").forward(req, resp);
            }
            //se não
        } else {
            req.getRequestDispatcher("loginError.html").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //armazenando informações para fazer a verificação
        session = req.getSession();
        String email = (String) session.getAttribute("email");
        String password = (String) session.getAttribute("senha");

        List<User> allUsersInBD = new userDao().findAllUsers();
        List<String> usersEmailsBD = new userDao().listEmail();
        List<String> userPasswordBD = new userDao().listPass();

        for (User user : allUsersInBD) {
            if (user.getUserEmail().equals(email)) {
                String userType = user.getUserType();

                if (userType.equals("ADM")) {

                    // === Pegando informações do usuário
                    userDao userDao = new userDao();

                    User usuario = userDao.returnUser(email);

                    req.setAttribute("User", usuario);


                    List<Curso> cursos = new cursoDao().ListCurso(); // Listando cursos

                    req.getRequestDispatcher("menu.jsp").forward(req, resp);

                } else if (userType.equals("PROFESSOR")) {
                    userDao dao = new userDao();
                    User usuario = dao.returnUser(email);
                    req.setAttribute("User", usuario);
                    req.getRequestDispatcher("menu.jsp").forward(req, resp);
                } else if (userType.equals("STUDENT")) {
                    userDao dao = new userDao();
                    User usuario = dao.returnUser(email);
                    req.setAttribute("User", usuario);
                    req.getRequestDispatcher("menu.jsp").forward(req, resp);
                }
            }
        }
    }
}


