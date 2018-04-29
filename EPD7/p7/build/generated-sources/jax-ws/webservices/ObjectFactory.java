
package webservices;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the webservices package. 
 * <p>An ObjectFactory allows you to programatically 
 * construct new instances of the Java representation 
 * for XML content. The Java representation of XML 
 * content can consist of schema derived interfaces 
 * and classes representing the binding of schema 
 * type definitions, element declarations and model 
 * groups.  Factory methods for each of these are 
 * provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {

    private final static QName _IsAlive_QNAME = new QName("http://webservices/", "isAlive");
    private final static QName _IsAliveResponse_QNAME = new QName("http://webservices/", "isAliveResponse");
    private final static QName _Login_QNAME = new QName("http://webservices/", "login");
    private final static QName _LoginResponse_QNAME = new QName("http://webservices/", "loginResponse");
    private final static QName _Logout_QNAME = new QName("http://webservices/", "logout");
    private final static QName _LogoutResponse_QNAME = new QName("http://webservices/", "logoutResponse");
    private final static QName _UsersRegistered_QNAME = new QName("http://webservices/", "usersRegistered");
    private final static QName _UsersRegisteredResponse_QNAME = new QName("http://webservices/", "usersRegisteredResponse");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: webservices
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link IsAlive }
     * 
     */
    public IsAlive createIsAlive() {
        return new IsAlive();
    }

    /**
     * Create an instance of {@link IsAliveResponse }
     * 
     */
    public IsAliveResponse createIsAliveResponse() {
        return new IsAliveResponse();
    }

    /**
     * Create an instance of {@link Login }
     * 
     */
    public Login createLogin() {
        return new Login();
    }

    /**
     * Create an instance of {@link LoginResponse }
     * 
     */
    public LoginResponse createLoginResponse() {
        return new LoginResponse();
    }

    /**
     * Create an instance of {@link Logout }
     * 
     */
    public Logout createLogout() {
        return new Logout();
    }

    /**
     * Create an instance of {@link LogoutResponse }
     * 
     */
    public LogoutResponse createLogoutResponse() {
        return new LogoutResponse();
    }

    /**
     * Create an instance of {@link UsersRegistered }
     * 
     */
    public UsersRegistered createUsersRegistered() {
        return new UsersRegistered();
    }

    /**
     * Create an instance of {@link UsersRegisteredResponse }
     * 
     */
    public UsersRegisteredResponse createUsersRegisteredResponse() {
        return new UsersRegisteredResponse();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link IsAlive }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://webservices/", name = "isAlive")
    public JAXBElement<IsAlive> createIsAlive(IsAlive value) {
        return new JAXBElement<IsAlive>(_IsAlive_QNAME, IsAlive.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link IsAliveResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://webservices/", name = "isAliveResponse")
    public JAXBElement<IsAliveResponse> createIsAliveResponse(IsAliveResponse value) {
        return new JAXBElement<IsAliveResponse>(_IsAliveResponse_QNAME, IsAliveResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link Login }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://webservices/", name = "login")
    public JAXBElement<Login> createLogin(Login value) {
        return new JAXBElement<Login>(_Login_QNAME, Login.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link LoginResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://webservices/", name = "loginResponse")
    public JAXBElement<LoginResponse> createLoginResponse(LoginResponse value) {
        return new JAXBElement<LoginResponse>(_LoginResponse_QNAME, LoginResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link Logout }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://webservices/", name = "logout")
    public JAXBElement<Logout> createLogout(Logout value) {
        return new JAXBElement<Logout>(_Logout_QNAME, Logout.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link LogoutResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://webservices/", name = "logoutResponse")
    public JAXBElement<LogoutResponse> createLogoutResponse(LogoutResponse value) {
        return new JAXBElement<LogoutResponse>(_LogoutResponse_QNAME, LogoutResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link UsersRegistered }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://webservices/", name = "usersRegistered")
    public JAXBElement<UsersRegistered> createUsersRegistered(UsersRegistered value) {
        return new JAXBElement<UsersRegistered>(_UsersRegistered_QNAME, UsersRegistered.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link UsersRegisteredResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://webservices/", name = "usersRegisteredResponse")
    public JAXBElement<UsersRegisteredResponse> createUsersRegisteredResponse(UsersRegisteredResponse value) {
        return new JAXBElement<UsersRegisteredResponse>(_UsersRegisteredResponse_QNAME, UsersRegisteredResponse.class, null, value);
    }

}
