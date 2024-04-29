package br.com.curso.dao;

import br.com.curso.model.Aula;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class aulaDao {

   public void createAula(Aula aula){
       String SQL = "INSERT INTO aula (TITLE_AULA, CONTENT_AULA, ID_CURSO_FK) values (? , ? , ?)";

       try {
           Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");

           PreparedStatement preparedStatement = connection.prepareStatement(SQL);

           preparedStatement.setString(1, aula.getTitleAula());
           preparedStatement.setString(2, aula.getContentAula());
           preparedStatement.setString(3, aula.getFkCurso());
           preparedStatement.execute();
           connection.close();

       }catch (Exception e){
           System.out.println("deu erro menó");
       }
   }

   public List<Aula> listFkId(String id) {
       String SQL = "select * from aula where ID_CURSO_FK =  ?";

       try {
           Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
           PreparedStatement preparedStatement = connection.prepareStatement(SQL);
           preparedStatement.setString(1, id);
           preparedStatement.execute();
           ResultSet resultSet = preparedStatement.executeQuery();
           List<Aula> fkid = new ArrayList<>();
           while (resultSet.next()) {
               String titulo = resultSet.getNString("TITLE_AULA");
               System.out.println(titulo);
               String content = resultSet.getNString("CONTENT_AULA");
               System.out.println(content);
               String idfk = resultSet.getNString("ID_curso_FK");
               System.out.println(idfk);
               Aula aula = new Aula(titulo,content,idfk);
               fkid.add(aula);
           }
           connection.close();
           return fkid;

       } catch (Exception e) {
           System.out.println("fail aula");
           return Collections.emptyList();
       }


   }


}
