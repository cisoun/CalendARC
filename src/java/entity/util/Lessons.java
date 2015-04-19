/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity.util;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Eddy
 */
@Entity
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Lessons.findAll", query = "SELECT l FROM Lessons l"),
    @NamedQuery(name = "Lessons.findByIdlesson", query = "SELECT l FROM Lessons l WHERE l.idlesson = :idlesson"),
    @NamedQuery(name = "Lessons.findByName", query = "SELECT l FROM Lessons l WHERE l.name = :name"),
    @NamedQuery(name = "Lessons.findByRoom", query = "SELECT l FROM Lessons l WHERE l.room = :room"),
    @NamedQuery(name = "Lessons.findByStarttime", query = "SELECT l FROM Lessons l WHERE l.starttime = :starttime"),
    @NamedQuery(name = "Lessons.findByEndtime", query = "SELECT l FROM Lessons l WHERE l.endtime = :endtime"),
    @NamedQuery(name = "Lessons.findByDay", query = "SELECT l FROM Lessons l WHERE l.day = :day"),
    @NamedQuery(name = "Lessons.findByCycle", query = "SELECT l FROM Lessons l WHERE l.cycle = :cycle")})
public class Lessons implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    private Integer idlesson;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    private String name;
    @Basic(optional = false)
    @NotNull
    private int room;
    @Basic(optional = false)
    @NotNull
    @Temporal(TemporalType.TIME)
    private Date starttime;
    @Basic(optional = false)
    @NotNull
    @Temporal(TemporalType.TIME)
    private Date endtime;
    @Basic(optional = false)
    @NotNull
    private boolean day;
    private Boolean cycle;

    public Lessons() {
    }

    public Lessons(Integer idlesson) {
        this.idlesson = idlesson;
    }

    public Lessons(Integer idlesson, String name, int room, Date starttime, Date endtime, boolean day) {
        this.idlesson = idlesson;
        this.name = name;
        this.room = room;
        this.starttime = starttime;
        this.endtime = endtime;
        this.day = day;
    }

    public Integer getIdlesson() {
        return idlesson;
    }

    public void setIdlesson(Integer idlesson) {
        this.idlesson = idlesson;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getRoom() {
        return room;
    }

    public void setRoom(int room) {
        this.room = room;
    }

    public Date getStarttime() {
        return starttime;
    }

    public void setStarttime(Date starttime) {
        this.starttime = starttime;
    }

    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }

    public boolean getDay() {
        return day;
    }

    public void setDay(boolean day) {
        this.day = day;
    }

    public Boolean getCycle() {
        return cycle;
    }

    public void setCycle(Boolean cycle) {
        this.cycle = cycle;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idlesson != null ? idlesson.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Lessons)) {
            return false;
        }
        Lessons other = (Lessons) object;
        if ((this.idlesson == null && other.idlesson != null) || (this.idlesson != null && !this.idlesson.equals(other.idlesson))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.util.Lessons[ idlesson=" + idlesson + " ]";
    }
    
}
