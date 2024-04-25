package br.com.curso.dao;

import br.com.curso.model.Curso;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class cursoDao {

    public void createCurso(Curso curso){

        String SQL = "INSERT INTO CURSOS (ID_CURSO, NOME_CURSO, DESC_CURSO) VALUES(?, ?, ?);";

        try{
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
            System.out.println("CONECT SUCESS");
            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, curso.getIdCurso());
            preparedStatement.setString(2, curso.getNomeCurso());
            preparedStatement.setString(3, curso.getDescCurso());
            preparedStatement.execute();

            System.out.println("INSERT SUCESS");
            connection.close();

        }catch (Exception a){
            System.out.println("INSERT ERROR");
        }
    }
}
