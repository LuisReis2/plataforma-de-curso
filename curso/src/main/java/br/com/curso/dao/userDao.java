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

    public void createUser(User user) {
        String SQL = "INSERT INTO users (user_name, user_email, user_password, user_type) VALUES (?, ?, ?, ?)";

        try {

            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
            System.out.println("SUCESS CONECTION!");
            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.setString(1, user.getUserName());
            preparedStatement.setString(2, user.getUserEmail());
            preparedStatement.setString(3, user.getUserPass());
            preparedStatement.setString(4, user.getUserType());
            preparedStatement.execute();

            System.out.println("INSERT SUCESS!");

            connection.close();

        } catch (Exception a) {
            System.out.println("INSERT FAILED");
            System.out.println(a.getMessage());
        }
    }

    public List<User> findAllUsers() {
        String SQL = "SELECT  *  FROM USERS";

        try {
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");

            System.out.println("SUCESS CONECTION!");

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            ResultSet resultSet = preparedStatement.executeQuery();

            List<User> users = new ArrayList<>();

            while (resultSet.next()) {
                String userName = resultSet.getString("user_name");
                String email = resultSet.getString("user_email");
                String pass = resultSet.getString("user_password");
                String type = resultSet.getString("user_type");
                User user = new User(userName, email, pass, type);
                users.add(user);
            }
            System.out.println("Sucess to selected users!");
            connection.close();
            return users;

        } catch (Exception e) {
            System.out.println("Failed to SELECT users!");
            return Collections.emptyList();
        }

    }

    public List<String> listEmail() { // Vai retornar uma lista com os emails do banco de dados
        String SQL = "SELECT  *  FROM USERS";

        try {
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");

            System.out.println("SUCESS CONECTION!");

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            ResultSet resultSet = preparedStatement.executeQuery();

            List<String> emails = new ArrayList<>();

            while (resultSet.next()) {
                String userName = resultSet.getString("user_name");
                String email = resultSet.getString("user_email");
                String type = resultSet.getString("user_type");
                User user = new User(userName, email, type);
                emails.add(user.getUserEmail());
            }
            System.out.println("Sucess to selected emails!");
            connection.close();
            for (String email : emails) {
                System.out.println(email);
                System.out.println();
            }
            return emails;

        } catch (Exception e) {
            System.out.println("Failed to SELECT emails!");
            return Collections.emptyList();
        }

    }

    public List<String> listPass() { // Vai retornar uma lista com as senahs do banco de dados
        String SQL = "SELECT  *  FROM USERS";

        try {
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");

            System.out.println("SUCESS CONECTION!");

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            ResultSet resultSet = preparedStatement.executeQuery();

            List<String> passwords = new ArrayList<>();

            while (resultSet.next()) {
                String userName = resultSet.getString("user_name");
                String email = resultSet.getString("user_email");
                String pass = resultSet.getString("user_password");
                String type = resultSet.getString("user_type");
                User user = new User(userName, email, pass, type);
                passwords.add(user.getUserPass());
            }
            System.out.println("Sucess to selected passwords!");
            connection.close();
            for (String pass : passwords) {
                System.out.println(pass);
                System.out.println();
            }
            return passwords;

        } catch (Exception e) {
            System.out.println("Failed to SELECT passwords!");
            return Collections.emptyList();
        }

    }

    public void DeleteUser(String email) {
        String SQL = "DELETE USERS WHERE USER_EMAIL = ?";

        try {

            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");

            System.out.println("success in database connection");

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, email);
            preparedStatement.execute();

            System.out.println("success on delete car with id: " + email);

            connection.close();

        } catch (Exception e) {

            System.out.println("fail in database connection");

        }
    }

    public void updateUser(User user) {
        String SQL = "UPDATE USERS SET USER_NAME = ?, USER_PASSWORD = ?, USER_TYPE = ? WHERE USER_EMAIL = ?";
        try {

            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");

            System.out.println("tentando enviar informações");

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.setString(1, user.getUserName());
            System.out.println("primeiro check");
            preparedStatement.setString(2, user.getUserPass());
            preparedStatement.setString(3, user.getUserType());
            preparedStatement.setString(4, user.getUserEmail());
            preparedStatement.execute();

            System.out.println("success in update car");

            connection.close();

        } catch (Exception e) {

            System.out.println("fail in database connection");
            System.out.println("Error: " + e.getMessage());

        }
    }

    public User returnUser(String email) {

        try {
            String SQL = "SELECT * FROM USERS WHERE USER_EMAIL = ?;";
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
            System.out.println("Conection sucess");
            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.setString(1, email);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                String userName = resultSet.getString("user_name");
                String type = resultSet.getString("user_type");
                String pass = resultSet.getString("USER_PASSWORD");
                return new User(userName, email, pass, type);
            } else {

                return null;
            }

        } catch (Exception e) {
            return null;
        }

    }

   public boolean authentic(User user){

        String SQL = "SELECT * FROM USERS WHERE USER_EMAIL = ?";

        try{
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
            System.out.println("SUCESS CONECTION");
            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.setString(1, user.getUserEmail());

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()){
                String password = resultSet.getString("user_password");

                if(password.equals(user.getUserPass())){
                    return true;
                }
            }
            return false;
        }catch (Exception e){
            System.out.println("ERROR" + e.getMessage());
            return false;
        }
   }

}
