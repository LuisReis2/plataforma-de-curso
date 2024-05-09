package br.com.curso.dao;

import br.com.curso.model.Participantes;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;


public class ParticipantesDao {

    public void createParticipantes(Participantes participantes){
        String SQL = "INSERT INTO PARTICIPANTES (ID_USUARIOS_FK,ID_CURSO_FK) VALUES(?, ?)";
        try{
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, participantes.getIdUserFk());
            preparedStatement.setString(2, participantes.getIdCursoFk());
            preparedStatement.execute();
            connection.close();
            System.out.println("INSERT SUCESS PARA PARTICIPABNTES");
        }catch (Exception e){
            System.out.println("INSERT ERROR");
        }
    }
    public List<Participantes> ListParticipantes(){
        String SQL = "SELECT * FROM PARTICIPANTES";
        try{
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            ResultSet resultSet = preparedStatement.executeQuery();
            List<Participantes> Participantes = new ArrayList<>();
            while (resultSet.next()) {
                String idParticipantes = resultSet.getString("ID_PARTICIPANTES");
                String idUsuariosFk = resultSet.getString("ID_USUARIOS_FK");
                String idCursoFk = resultSet.getString("ID_CURSO_FK");
                Participantes participante = new Participantes(idParticipantes,idUsuariosFk , idCursoFk);
                Participantes.add(participante);
            }
            connection.close();
            System.out.println("consegue pegar tudo");
            return Participantes;
        }catch (Exception e){
            System.out.println("erro na listagem de participantes");
            return Collections.emptyList();
        }
    }
    public void deleteParticipantes(String id){
        String SQL = "DELETE PARTICIPANTES WHERE ID_PARTICIPANTES = ?";
        try {
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
            System.out.println("SUCESS CONECTION");
            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, id);
            preparedStatement.execute();
            System.out.println("Curso deletado, id: " + id);
            connection.close();
        } catch (Exception a) {
            System.out.println("DELET FAILED");
        }
    }
    public void updateParticipantes(Participantes participante){
        String SQL = "UPDATE PARTICIPANTES SET ID_USUARIOS_FK = ?, ID_CURSO_FK = ? WHERE ID_PARTICIPANTES = ?";

        System.out.println("tentando enviar informações");
        try {
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");


            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.setString(1, participante.getIdUserFk());
            preparedStatement.setString(2, participante.getIdCursoFk());
            preparedStatement.setString(3, participante.getIdParticipante());
            preparedStatement.execute();
            System.out.println("primeiro check");
            connection.close();
        }catch (Exception e){
            System.out.println("fail in database connection");
            System.out.println("Error: " + e.getMessage());
        }
    }
}
