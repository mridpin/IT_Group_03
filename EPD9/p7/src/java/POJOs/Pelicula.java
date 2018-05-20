/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package POJOs;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author ridao
 */
@Entity
@Table(name = "pelicula")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Pelicula.findAll", query = "SELECT p FROM Pelicula p")
    , @NamedQuery(name = "Pelicula.findById", query = "SELECT p FROM Pelicula p WHERE p.id = :id")
    , @NamedQuery(name = "Pelicula.findByNombre", query = "SELECT p FROM Pelicula p WHERE p.nombre = :nombre")
    , @NamedQuery(name = "Pelicula.findByFechaEstreno", query = "SELECT p FROM Pelicula p WHERE p.fechaEstreno = :fechaEstreno")
    , @NamedQuery(name = "Pelicula.findByFechaVideo", query = "SELECT p FROM Pelicula p WHERE p.fechaVideo = :fechaVideo")
    , @NamedQuery(name = "Pelicula.findByIdioma", query = "SELECT p FROM Pelicula p WHERE p.idioma = :idioma")
    , @NamedQuery(name = "Pelicula.findByPais", query = "SELECT p FROM Pelicula p WHERE p.pais = :pais")})
public class Pelicula implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "nombre")
    private String nombre;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fechaEstreno")
    @Temporal(TemporalType.DATE)
    private Date fechaEstreno;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fechaVideo")
    @Temporal(TemporalType.DATE)
    private Date fechaVideo;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "idioma")
    private String idioma;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "pais")
    private String pais;

    public Pelicula() {
    }

    public Pelicula(Integer id) {
        this.id = id;
    }

    public Pelicula(Integer id, String nombre, Date fechaEstreno, Date fechaVideo, String idioma, String pais) {
        this.id = id;
        this.nombre = nombre;
        this.fechaEstreno = fechaEstreno;
        this.fechaVideo = fechaVideo;
        this.idioma = idioma;
        this.pais = pais;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Date getFechaEstreno() {
        return fechaEstreno;
    }

    public void setFechaEstreno(Date fechaEstreno) {
        this.fechaEstreno = fechaEstreno;
    }

    public Date getFechaVideo() {
        return fechaVideo;
    }

    public void setFechaVideo(Date fechaVideo) {
        this.fechaVideo = fechaVideo;
    }

    public String getIdioma() {
        return idioma;
    }

    public void setIdioma(String idioma) {
        this.idioma = idioma;
    }

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Pelicula)) {
            return false;
        }
        Pelicula other = (Pelicula) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "POJOs.Pelicula[ id=" + id + " ]";
    }
    
}
