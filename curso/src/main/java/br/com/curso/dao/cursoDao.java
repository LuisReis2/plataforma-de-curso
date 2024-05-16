package br.com.curso.dao;

import br.com.curso.model.Curso;
import br.com.curso.model.Participantes;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class cursoDao {

    public void createCurso(Curso curso) {

        String SQL = "INSERT INTO CURSOS (NOME_CURSO, DESC_CURSO) VALUES(?, ?);";

        try {
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
            System.out.println("CONECT SUCESS");
            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, curso.getNomeCurso());
            preparedStatement.setString(2, curso.getDescCurso());
            preparedStatement.execute();

            System.out.println("INSERT SUCESS");
            connection.close();

        } catch (Exception a) {
            System.out.println("INSERT ERROR");
        }
    }

    public List<Curso> ListCurso() {
        String SQL = "SELECT * FROM CURSOS";


        try {
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
            System.out.println("CONNECTIO SUCESS");

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            ResultSet resultSet = preparedStatement.executeQuery();
            List<Curso> cursos = new ArrayList<>();
            while (resultSet.next()) {
                String nomeCurso = resultSet.getString("nome_curso");
                String id = resultSet.getString("id_curso");
                String desc = resultSet.getString("desc_curso");
                Curso curso = new Curso(nomeCurso, desc, id);
                cursos.add(curso);
            }
            System.out.println("LIST SUCESS");
            connection.close();
            return cursos;
        } catch (Exception e) {
            return Collections.emptyList();
        }

    }

    public void deleteCarById(String cursoId) {
        String SQL = "DELETE FROM CURSOS WHERE ID_CURSO = ?";

        try {
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
            System.out.println("SUCESS CONECTION");
            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, cursoId);
            preparedStatement.execute();

            connection.close();
        } catch (Exception a) {
            System.out.println("erro: "+a.getMessage());
        }


    }

    public void updateCursoById(Curso curso) {

        String SQL = "UPDATE CURSOS SET NOME_CURSO = ?,DESC_CURSO = ? WHERE ID_CURSO = ?";

        try {
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, curso.getNomeCurso());
            preparedStatement.setString(2, curso.getDescCurso());
            preparedStatement.setString(3, curso.getIdCurso());
            preparedStatement.execute();
            System.out.println("UPDATE SUCCESSFUL");

            connection.close();
        } catch (Exception e) {
            System.out.println("UPDATE FAILED: " + e.getMessage());
        }
    }
    public Curso returnCurso(String id){

        String SQL = "SELECT * FROM CURSOS WHERE id_curso = ?";
        try{
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, id);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()){
                String nomeCurso = resultSet.getString("nome_curso");
                String descCurso = resultSet.getString("desc_curso");
                Curso curso = new Curso(nomeCurso, descCurso, id);
                return curso;
            }
            System.out.println("CURSO FOUND!");
            connection.close();
        }catch (Exception e){
            System.out.println("ERRO AO ACHAR CURSO");
            System.out.println(e.getMessage());
        }
        return null;
    }
    public  List<Curso> cursoPartipados(String idUser){
        String SQL = "SELECT * FROM PARTICIPANTES WHERE ID_USUARIOS_FK = ?";

        try{

            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.setString(1, idUser);

            ResultSet resultSet = preparedStatement.executeQuery();

            List<Curso> cursos = new ArrayList<>();

            while (resultSet.next()){
                String idCurso = resultSet.getString("id_curso_fk");

                Curso curso = returnCurso(idCurso);

                cursos.add(curso);
            }

            connection.close();
            return cursos;

        }catch (Exception e){
            return Collections.emptyList();
        }
    }
}
