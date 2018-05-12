
package webservices;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.xml.bind.annotation.XmlSeeAlso;
import javax.xml.ws.Action;
import javax.xml.ws.RequestWrapper;
import javax.xml.ws.ResponseWrapper;


/**
 * This class was generated by the JAX-WS RI.
 * JAX-WS RI 2.2.11-b150120.1832
 * Generated source version: 2.2
 * 
 */
@WebService(name = "SingleSignOn", targetNamespace = "http://webservices/")
@XmlSeeAlso({
    ObjectFactory.class
})
public interface SingleSignOn {


    /**
     * 
     * @param token
     * @return
     *     returns boolean
     */
    @WebMethod
    @WebResult(targetNamespace = "")
    @RequestWrapper(localName = "isAlive", targetNamespace = "http://webservices/", className = "webservices.IsAlive")
    @ResponseWrapper(localName = "isAliveResponse", targetNamespace = "http://webservices/", className = "webservices.IsAliveResponse")
    @Action(input = "http://webservices/SingleSignOn/isAliveRequest", output = "http://webservices/SingleSignOn/isAliveResponse")
    public boolean isAlive(
        @WebParam(name = "token", targetNamespace = "")
        String token);

    /**
     * 
     * @param token
     */
    @WebMethod
    @RequestWrapper(localName = "logout", targetNamespace = "http://webservices/", className = "webservices.Logout")
    @ResponseWrapper(localName = "logoutResponse", targetNamespace = "http://webservices/", className = "webservices.LogoutResponse")
    @Action(input = "http://webservices/SingleSignOn/logoutRequest", output = "http://webservices/SingleSignOn/logoutResponse")
    public void logout(
        @WebParam(name = "token", targetNamespace = "")
        String token);

    /**
     * 
     * @return
     *     returns java.lang.String
     */
    @WebMethod
    @WebResult(targetNamespace = "")
    @RequestWrapper(localName = "usersRegistered", targetNamespace = "http://webservices/", className = "webservices.UsersRegistered")
    @ResponseWrapper(localName = "usersRegisteredResponse", targetNamespace = "http://webservices/", className = "webservices.UsersRegisteredResponse")
    @Action(input = "http://webservices/SingleSignOn/usersRegisteredRequest", output = "http://webservices/SingleSignOn/usersRegisteredResponse")
    public String usersRegistered();

    /**
     * 
     * @param pass
     * @param user
     * @return
     *     returns java.lang.String
     */
    @WebMethod
    @WebResult(targetNamespace = "")
    @RequestWrapper(localName = "login", targetNamespace = "http://webservices/", className = "webservices.Login")
    @ResponseWrapper(localName = "loginResponse", targetNamespace = "http://webservices/", className = "webservices.LoginResponse")
    @Action(input = "http://webservices/SingleSignOn/loginRequest", output = "http://webservices/SingleSignOn/loginResponse")
    public String login(
        @WebParam(name = "user", targetNamespace = "")
        String user,
        @WebParam(name = "pass", targetNamespace = "")
        String pass);

}