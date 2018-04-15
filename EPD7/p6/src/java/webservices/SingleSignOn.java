/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package webservices;

import java.util.ArrayList;
import java.util.List;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import model.User;

/**
 *
 * @author ridao
 */
@WebService(serviceName = "SingleSignOn")
public class SingleSignOn {

    List<User> registeredUsers = new ArrayList<>();

    /**
     * Web service operation
     */
    @WebMethod(operationName = "login")
    public String login(@WebParam(name = "user") String user, @WebParam(name = "pass") String pass) {
        String token = "";
        if (!"".equals(user) && !"".equals(pass)) {
            token = String.valueOf(System.currentTimeMillis());
            User newUser = new User(user, pass, token);
            registeredUsers.add(newUser);
        }
        return token;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "logout")
    public void logout(@WebParam(name = "token") String token) {
        User user = findUserByToken(token);
        if (user != null) {
            this.registeredUsers.remove(user);
        }
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "isAlive")
    public boolean isAlive(@WebParam(name = "token") String token) {
        return findUserByToken(token) != null;
    }
    
    
    /**
     * Web service operation
     */
    @WebMethod(operationName = "usersRegistered")
    public String usersRegistered() {
        //TODO write your implementation code here:
        return this.usersRegistered();
    }

    private User findUserByToken(String token) {
        for (User u : this.registeredUsers) {
            if (u.getToken().equals(token)) {
                return u;
            }
        }
        return null;
    }
}
