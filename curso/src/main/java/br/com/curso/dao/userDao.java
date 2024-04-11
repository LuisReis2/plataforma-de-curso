package br.com.curso.dao;

import br.com.curso.model.User;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

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
}
