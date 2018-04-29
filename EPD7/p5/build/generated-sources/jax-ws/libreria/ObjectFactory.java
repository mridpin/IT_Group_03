
package libreria;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the libreria package. 
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

    private final static QName _ListBooks_QNAME = new QName("http://libreria/", "listBooks");
    private final static QName _ListBooksResponse_QNAME = new QName("http://libreria/", "listBooksResponse");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: libreria
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link ListBooks }
     * 
     */
    public ListBooks createListBooks() {
        return new ListBooks();
    }

    /**
     * Create an instance of {@link ListBooksResponse }
     * 
     */
    public ListBooksResponse createListBooksResponse() {
        return new ListBooksResponse();
    }

    /**
     * Create an instance of {@link Libro }
     * 
     */
    public Libro createLibro() {
        return new Libro();
    }

    /**
     * Create an instance of {@link Editorial }
     * 
     */
    public Editorial createEditorial() {
        return new Editorial();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ListBooks }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://libreria/", name = "listBooks")
    public JAXBElement<ListBooks> createListBooks(ListBooks value) {
        return new JAXBElement<ListBooks>(_ListBooks_QNAME, ListBooks.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ListBooksResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://libreria/", name = "listBooksResponse")
    public JAXBElement<ListBooksResponse> createListBooksResponse(ListBooksResponse value) {
        return new JAXBElement<ListBooksResponse>(_ListBooksResponse_QNAME, ListBooksResponse.class, null, value);
    }

}
