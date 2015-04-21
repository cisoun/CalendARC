/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
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
 * @author Eddy
 */
@Entity
@Table(name = "events")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Events.findAll", query = "SELECT e FROM Events e"),
    @NamedQuery(name = "Events.findByIdevent", query = "SELECT e FROM Events e WHERE e.idevent = :idevent"),
    @NamedQuery(name = "Events.findByIduser", query = "SELECT e FROM Events e WHERE e.iduser = :iduser"),
    @NamedQuery(name = "Events.findByName", query = "SELECT e FROM Events e WHERE e.name = :name"),
    @NamedQuery(name = "Events.findByStartdate", query = "SELECT e FROM Events e WHERE e.startdate = :startdate"),
    @NamedQuery(name = "Events.findByEnddate", query = "SELECT e FROM Events e WHERE e.enddate = :enddate"),
    @NamedQuery(name = "Events.findByInterval", query = "SELECT e FROM Events e WHERE e.iduser = :iduser AND e.startdate >= :startdate AND e.enddate < :enddate")
})
public class Events implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idevent")
    private Integer idevent;
    @Basic(optional = false)
    @NotNull
    @Column(name = "iduser")
    private int iduser;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "name")
    private String name;
    @Lob
    @Size(max = 65535)
    @Column(name = "description")
    private String description;
    @Basic(optional = false)
    @NotNull
    @Column(name = "startdate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date startdate;
    @Basic(optional = false)
    @NotNull
    @Column(name = "enddate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date enddate;

    public Events() {
    }

    public Events(Integer idevent) {
        this.idevent = idevent;
    }

    public Events(Integer idevent, int iduser, String name, Date startdate, Date enddate) {
        this.idevent = idevent;
        this.iduser = iduser;
        this.name = name;
        this.startdate = startdate;
        this.enddate = enddate;
    }

    public Integer getIdevent() {
        return idevent;
    }

    public void setIdevent(Integer idevent) {
        this.idevent = idevent;
    }

    public int getIduser() {
        return iduser;
    }

    public void setIduser(int iduser) {
        this.iduser = iduser;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getStartdate() {
        return startdate;
    }

    public void setStartdate(Date startdate) {
        this.startdate = startdate;
    }

    public Date getEnddate() {
        return enddate;
    }

    public void setEnddate(Date enddate) {
        this.enddate = enddate;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idevent != null ? idevent.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Events)) {
            return false;
        }
        Events other = (Events) object;
        if ((this.idevent == null && other.idevent != null) || (this.idevent != null && !this.idevent.equals(other.idevent))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.util.Events[ idevent=" + idevent + " ]";
    }
    
}
