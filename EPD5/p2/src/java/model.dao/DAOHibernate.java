/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.sql.SQLException;
import java.util.List;

import model.Parkingspot;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author ridao
 */
public class DAOHibernate {

    Session hs = null; // hs = hibernateSession

    public DAOHibernate() {
        // Se abre la sesion
        this.hs = HibernateUtil.getSessionFactory().openSession();
    }

    // Metodo que devuelve una lista resultado de hacer un SELECT a la bbdd
    public List<Parkingspot> currentSpots() throws SQLException {
        // Paso 1: get la current sesion
        hs = HibernateUtil.getSessionFactory().getCurrentSession();
        // Paso 2: comenzar transaccion
        Transaction tx = hs.beginTransaction();
        // Paso 3: crear query
        Query query = hs.createQuery("From Parkingspot");
        // Paso 4: recoger resultados
        List<Parkingspot> lista = query.list();
        // Paso 5: commit
        tx.commit();
        return lista;
    }

    /*public void updateParking(Parkingspot parking) throws SQLException {
        // Paso 1: get la current sesion
        hs = HibernateUtil.getSessionFactory().getCurrentSession();
        // Paso 2: comenzar transaccion
        Transaction tx = null;
        try {
            tx = hs.beginTransaction();
            // Paso 3: crear query
            hs.update(parking);
            // Paso 4: recoger resultados            
            // Paso 5: commit
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        
    }

    public void deleteParking(Parkingspot parking) throws SQLException {
        // Paso 1: get la current sesion
        hs = HibernateUtil.getSessionFactory().getCurrentSession();
        // Paso 2: comenzar transaccion
        Transaction tx = hs.beginTransaction();
        // Paso 3: crear query
        hs.delete(parking);
        // Paso 5: commit
        tx.commit();
    }

    public void createParking(Parkingspot parking) throws SQLException {        
        // Paso 1: get la current sesion
        hs = HibernateUtil.getSessionFactory().getCurrentSession();
        // Paso 2: comenzar transaccion
        Transaction tx = hs.beginTransaction();
        // Paso 3: crear query
        hs.save(parking);
        // Paso 5: commit
        tx.commit();
    }
*/
}
