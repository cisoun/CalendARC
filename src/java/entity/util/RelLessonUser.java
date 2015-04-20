/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity.util;

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
@Table(name = "rel_lesson_user")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "RelLessonUser.findAll", query = "SELECT r FROM RelLessonUser r"),
    @NamedQuery(name = "RelLessonUser.findByIdrel", query = "SELECT r FROM RelLessonUser r WHERE r.idrel = :idrel"),
    @NamedQuery(name = "RelLessonUser.findByIdlesson", query = "SELECT r FROM RelLessonUser r WHERE r.idlesson = :idlesson"),
    @NamedQuery(name = "RelLessonUser.findByIduser", query = "SELECT r FROM RelLessonUser r WHERE r.iduser = :iduser")})
public class RelLessonUser implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idrel")
    private Integer idrel;
    @Basic(optional = false)
    @NotNull
    @Column(name = "idlesson")
    private int idlesson;
    @Basic(optional = false)
    @NotNull
    @Column(name = "iduser")
    private int iduser;

    public RelLessonUser() {
    }

    public RelLessonUser(Integer idrel) {
        this.idrel = idrel;
    }

    public RelLessonUser(Integer idrel, int idlesson, int iduser) {
        this.idrel = idrel;
        this.idlesson = idlesson;
        this.iduser = iduser;
    }

    public Integer getIdrel() {
        return idrel;
    }

    public void setIdrel(Integer idrel) {
        this.idrel = idrel;
    }

    public int getIdlesson() {
        return idlesson;
    }

    public void setIdlesson(int idlesson) {
        this.idlesson = idlesson;
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
        hash += (idrel != null ? idrel.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof RelLessonUser)) {
            return false;
        }
        RelLessonUser other = (RelLessonUser) object;
        if ((this.idrel == null && other.idrel != null) || (this.idrel != null && !this.idrel.equals(other.idrel))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.util.RelLessonUser[ idrel=" + idrel + " ]";
    }
    
}
