package libreria;

import java.sql.SQLException;
import org.hibernate.Query;
import org.hibernate.Session;
import java.util.ArrayList;
import java.util.List;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class Almacen{

    Session session = null;
    

    public Almacen(){
        
    }
    
    
    public Session getSession() {
        return session;
    }

    public void setSession(Session session) {
        this.session = session;
    }

    public List<Libro> consultaListaLibrosSolicitados(List<String> listaIsbns) throws
            Exception {
        Map<String, Libro> conjuntoLibros = new HashMap<String, Libro>(listaIsbns.size());
        for (String isbn : listaIsbns) {
            Libro libro = null;
            if (!conjuntoLibros.containsKey(isbn)) {
                libro = this.consultaLibro(Integer.parseInt(isbn));
            } else {
                libro = conjuntoLibros.get(isbn);
                conjuntoLibros.remove(isbn);
                libro.incrementaCantidad();
            }
            conjuntoLibros.put(isbn, libro);
        }
//pasamos a lista
        Set<String> conjuntoIsbns = conjuntoLibros.keySet();
        Iterator<String> it = conjuntoIsbns.iterator();
        List<Libro> listaLibros = new ArrayList<Libro>(conjuntoIsbns.size());
        while (it.hasNext()) {
            listaLibros.add(conjuntoLibros.get(it.next()));
        }
//pasamos a
        return listaLibros;
    }

    public Libro consultaLibro(int isbn) throws SQLException {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        Libro libro = null;
        //abrimos una transaccion en hibernate para poder ejecutar consultas
        org.hibernate.Transaction tx = session.beginTransaction();
        Query q = session.createQuery("from Libro where isbn = '" + isbn + "'");
        libro = (Libro) q.uniqueResult();
        libro.setCantidad(1);
//muy importante hacer commit para que se termine de ejecutar y cerrar la transaccion. Sino se especifica, la transaccion queda abierta y no permite ejecutar otras
        tx.commit();
        return libro;
    }
    
    //Returns the editorial with the given value
    public Editorial consultaEditorial(int id)
    {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        Editorial editorial = null;
        //abrimos una transaccion en hibernate para poder ejecutar consultas
        org.hibernate.Transaction tx = session.beginTransaction();
        Query q = session.createQuery("from Editorial where id = '" + id + "'");
        editorial = (Editorial) q.uniqueResult();
//muy importante hacer commit para que se termine de ejecutar y cerrar la transaccion. Sino se especifica, la transaccion queda abierta y no permite ejecutar otras
        tx.commit();
        return editorial;
    }
    
    
    public void nuevoLibro(Libro l)
    {
        
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        org.hibernate.Transaction tx = session.beginTransaction();
        
        //This directly saves the book into DB
        session.save(l);
        tx.commit();
    }
    

    public List<Libro> consultaLibrosDisponibles() throws SQLException {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        org.hibernate.Transaction tx = session.beginTransaction();
        Query q = session.createQuery("from Libro");
        List resultados = (List<Libro>) q.list();
//muy importante hacer commit para que se termine de ejecutar y cerrar la transaccion. Sino se especifica, la transaccion queda abierta y no permite ejecutar otras
        tx.commit();
        return resultados;
    }
}
