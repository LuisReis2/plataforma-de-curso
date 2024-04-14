package br.com.curso.dao;

import br.com.curso.model.User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class userDao {

   public void createUser(User user){
    String  SQL = "INSERT INTO users (user_name, user_email, user_password, user_type) VALUES (?, ?, ?, ?)";

    try {

            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa","sa");
            System.out.println("SUCESS CONECTION!");
            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.setString(1, user.getUserName());
            preparedStatement.setString(2, user.getUserEmail());
            preparedStatement.setString(3, user.getUserPass());
            preparedStatement.setString(4, user.getUserType());
            preparedStatement.execute();

        System.out.println("INSERT SUCESS!");

        connection.close();

    }catch (Exception a){
        System.out.println("INSERT FAILED");
    }
    }
    public List<User> findAllUsers() {
       String SQL = "SELECT  *  FROM USERS";

       try {
           Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa","sa");

           System.out.println("SUCESS CONECTION!");

           PreparedStatement preparedStatement = connection.prepareStatement(SQL);

           ResultSet resultSet = preparedStatement.executeQuery();

           List<User> users = new ArrayList<>();

           while (resultSet.next()){
               String userName = resultSet.getString("user_name");
               String email = resultSet.getString("user_email");
               String type = resultSet.getString("user_type");
               User user = new User(userName, email, type);
               users.add(user);
           }
           System.out.println("Sucess to selected users!");
            connection.close();
           return users;

       }catch (Exception e){
           System.out.println("Failed to SELECT users!");
           return Collections.emptyList();
       }

    }
}
