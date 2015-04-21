/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Eddy
 */
@Entity
@Table(name = "classes")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Classes.findAll", query = "SELECT c FROM Classes c"),
    @NamedQuery(name = "Classes.findByIdclass", query = "SELECT c FROM Classes c WHERE c.idclass = :idclass"),
    @NamedQuery(name = "Classes.findByName", query = "SELECT c FROM Classes c WHERE c.name = :name")})
    
public class Classes implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idclass")
    private Integer idclass;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 12)
    @Column(name = "name")
    private String name;

    public Classes() {
    }

    public Classes(Integer idclass) {
        this.idclass = idclass;
    }

    public Classes(Integer idclass, String name) {
        this.idclass = idclass;
        this.name = name;
    }

    public Integer getIdclass() {
        return idclass;
    }

    public void setIdclass(Integer idclass) {
        this.idclass = idclass;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idclass != null ? idclass.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Classes)) {
            return false;
        }
        Classes other = (Classes) object;
        if ((this.idclass == null && other.idclass != null) || (this.idclass != null && !this.idclass.equals(other.idclass))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return this.name.toString();
    }
    
}
