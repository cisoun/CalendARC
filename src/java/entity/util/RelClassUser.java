/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity.util;

import controller.UsersFacade;
import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Query;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Eddy
 */
@Entity
@Table(name = "rel_class_user")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "RelClassUser.findAll", query = "SELECT r FROM RelClassUser r"),
    @NamedQuery(name = "RelClassUser.findByIdrel", query = "SELECT r FROM RelClassUser r WHERE r.idrel = :idrel"),
    @NamedQuery(name = "RelClassUser.findByIduser", query = "SELECT r FROM RelClassUser r WHERE r.iduser = :iduser"),
    @NamedQuery(name = "RelClassUser.findByIdclass", query = "SELECT r FROM RelClassUser r WHERE r.idclass = :idclass")})
public class RelClassUser implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idrel")
    private Integer idrel;
    @Basic(optional = false)
    @NotNull
    @Column(name = "iduser")
    private int iduser;
    @Basic(optional = false)
    @NotNull
    @Column(name = "idclass")
    private int idclass;

    public RelClassUser() {
    }

    public RelClassUser(Integer idrel) {
        this.idrel = idrel;
    }

    public RelClassUser(Integer idrel, int iduser, int idclass) {
        this.idrel = idrel;
        this.iduser = iduser;
        this.idclass = idclass;
    }

    public Integer getIdrel() {
        return idrel;
    }

    public void setIdrel(Integer idrel) {
        this.idrel = idrel;
    }

    public int getIduser() {
        return iduser;
    }

    public void setIduser(int iduser) {
        this.iduser = iduser;
    }

    public int getIdclass() {
        return idclass;
    }

    public void setIdclass(int idclass) {
        this.idclass = idclass;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idrel != null ? idrel.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof RelClassUser)) {
            return false;
        }
        RelClassUser other = (RelClassUser) object;
        if ((this.idrel == null && other.idrel != null) || (this.idrel != null && !this.idrel.equals(other.idrel))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.util.RelClassUser[ idrel=" + idrel + " ]";
    }
    
}
