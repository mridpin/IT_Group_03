
package libreria.jaxws;

import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;
import libreria.Libro;

@XmlRootElement(name = "listBooksResponse", namespace = "http://libreria/")
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "listBooksResponse", namespace = "http://libreria/")
public class ListBooksResponse {

    @XmlElement(name = "return", namespace = "")
    private List<Libro> _return;

    /**
     * 
     * @return
     *     returns List<Libro>
     */
    public List<Libro> getReturn() {
        return this._return;
    }

    /**
     * 
     * @param _return
     *     the value for the _return property
     */
    public void setReturn(List<Libro> _return) {
        this._return = _return;
    }

}
