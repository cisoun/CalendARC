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
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Eddy
 */
@Entity
@Table(name = "rel_class_lesson")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "RelClassLesson.findAll", query = "SELECT r FROM RelClassLesson r"),
    @NamedQuery(name = "RelClassLesson.findByIdrel", query = "SELECT r FROM RelClassLesson r WHERE r.idrel = :idrel"),
    @NamedQuery(name = "RelClassLesson.findByIdclass", query = "SELECT r FROM RelClassLesson r WHERE r.idclass = :idclass"),
    @NamedQuery(name = "RelClassLesson.findByIdlesson", query = "SELECT r FROM RelClassLesson r WHERE r.idlesson = :idlesson")})
public class RelClassLesson implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idrel")
    private Integer idrel;
    @Basic(optional = false)
    @NotNull
    @Column(name = "idclass")
    private int idclass;
@Transient
    private Classes myClass;
    @Basic(optional = false)
    @NotNull
    @Column(name = "idlesson")
    private int idlesson;
@Transient
    private Lessons myLesson;

    public RelClassLesson() {
    }

    public RelClassLesson(Integer idrel) {
        this.idrel = idrel;
    }

    public RelClassLesson(Integer idrel, int idclass, int idlesson) {
        this.idrel = idrel;
        this.idclass = idclass;
        this.idlesson = idlesson;
    }

    public Integer getIdrel() {
        return idrel;
    }

    public void setIdrel(Integer idrel) {
        this.idrel = idrel;
    }

    public int getIdclass() {
        return idclass;
    }
    
    public Classes getMyClass() {
        return myClass;
    }

    public void setIdclass(int idclass) {
        this.idclass = idclass;
    }
    
    public void setmyClass(Classes _myClass) {
        this.myClass = _myClass;
        this.idclass = this.myClass.getIdclass();
    }

    public int getIdlesson() {
        return idlesson;
    }
    
    public Lessons getMyLesson() {
        return myLesson;
    }

    public void setIdlesson(int idlesson) {
        this.idlesson = idlesson;
    }
    
    public void setmyLesson(Lessons lesson) {
        this.myLesson = lesson;
        this.idlesson = this.myLesson.getIdlesson();
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
        if (!(object instanceof RelClassLesson)) {
            return false;
        }
        RelClassLesson other = (RelClassLesson) object;
        if ((this.idrel == null && other.idrel != null) || (this.idrel != null && !this.idrel.equals(other.idrel))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.util.RelClassLesson[ idrel=" + idrel + " ]";
    }
    
}
