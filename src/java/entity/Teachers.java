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
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Eddy
 */
@Entity
@Table(name = "teachers")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Teachers.findAll", query = "SELECT t FROM Teachers t"),
    @NamedQuery(name = "Teachers.findByIdteacher", query = "SELECT t FROM Teachers t WHERE t.idteacher = :idteacher"),
    @NamedQuery(name = "Teachers.findByIduser", query = "SELECT t FROM Teachers t WHERE t.iduser = :iduser")})
public class Teachers implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idteacher")
    private Integer idteacher;
    @Basic(optional = false)
    @NotNull
    @Column(name = "iduser")
    private int iduser;

    public Teachers() {
    }

    public Teachers(Integer idteacher) {
        this.idteacher = idteacher;
    }

    public Teachers(Integer idteacher, int iduser) {
        this.idteacher = idteacher;
        this.iduser = iduser;
    }

    public Integer getIdteacher() {
        return idteacher;
    }

    public void setIdteacher(Integer idteacher) {
        this.idteacher = idteacher;
    }

    public int getIduser() {
        return iduser;
    }

    public void setIduser(int iduser) {
        this.iduser = iduser;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idteacher != null ? idteacher.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Teachers)) {
            return false;
        }
        Teachers other = (Teachers) object;
        if ((this.idteacher == null && other.idteacher != null) || (this.idteacher != null && !this.idteacher.equals(other.idteacher))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.util.Teachers[ idteacher=" + idteacher + " ]";
    }
    
}
