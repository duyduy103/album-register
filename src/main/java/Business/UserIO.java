package Business;

import java.io.IOException;
import java.io.FileWriter;
import Business.User;
import java.io.BufferedReader;
import java.io.FileReader;

public class UserIO {
    public static void add(User user, String path) {
        try(FileWriter writer = new FileWriter(path,true)){
            String email = user.getEmail();
            String firstName = user.getFirstName();
            String lastName = user.getLastName();
            String result = email + " | " + firstName + " | " + lastName;
            writer.write(result + System.lineSeparator());
        }
        catch (IOException e){ 
            System.out.println("Error");
        }
    }
    public static User getUser(String email, String path) {
    try(BufferedReader br = new BufferedReader(new FileReader(path))){
        String line = br.readLine();
        System.out.println("Email.txt path = " + path);
        while(line != null){
            if (line.trim().isEmpty()) {
            line = br.readLine();
            continue;
    }
            System.out.println("LINE = [" + line + "]");
            String[] lines = line.split("\\|");
            String emailline = lines[0].trim();
            String firstName = lines[1].trim();
            String lastName = lines[2].trim();

            if(emailline.equals(email)) {
                User user = new User(emailline, firstName, lastName);
                return user;
            }

            line = br.readLine();
        } 
    }
    catch (IOException e){ 
        System.out.println("Error");
    }

    return null;
}
}
