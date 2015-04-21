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
 * @author Sammy Guergachi <sguergachi at gmail.com>
 */
@Entity
@Table(name = "lessons")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Lessons.findAll", query = "SELECT l FROM Lessons l"),
    @NamedQuery(name = "Lessons.findByIdlesson", query = "SELECT l FROM Lessons l WHERE l.idlesson = :idlesson"),
    @NamedQuery(name = "Lessons.findByName", query = "SELECT l FROM Lessons l WHERE l.name = :name"),
    @NamedQuery(name = "Lessons.findByRoom", query = "SELECT l FROM Lessons l WHERE l.room = :room"),
    @NamedQuery(name = "Lessons.findByPeriod", query = "SELECT l FROM Lessons l WHERE l.period = :period"),
    @NamedQuery(name = "Lessons.findByLength", query = "SELECT l FROM Lessons l WHERE l.length = :length"),
    @NamedQuery(name = "Lessons.findByDay", query = "SELECT l FROM Lessons l WHERE l.day = :day"),
    @NamedQuery(name = "Lessons.findByCycle", query = "SELECT l FROM Lessons l WHERE l.cycle = :cycle")})
public class Lessons implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idlesson")
    private Integer idlesson;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "name")
    private String name;
    @Basic(optional = false)
    @NotNull
    @Column(name = "room")
    private int room;
    @Basic(optional = false)
    @NotNull
    @Column(name = "period")
    private short period;
    @Basic(optional = false)
    @NotNull
    @Column(name = "length")
    private short length;
    @Basic(optional = false)
    @NotNull
    @Column(name = "day")
    private Integer day;
    @Column(name = "cycle")
    private Integer cycle;

    public Lessons() {
    }

    public Lessons(Integer idlesson) {
	this.idlesson = idlesson;
    }

    public Lessons(Integer idlesson, String name, int room, short period, short length, Integer day) {
	this.idlesson = idlesson;
	this.name = name;
	this.room = room;
	this.period = period;
	this.length = length;
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

    public short getPeriod() {
	return period;
    }

    public void setPeriod(short period) {
	this.period = period;
    }

    public short getLength() {
	return length;
    }

    public void setLength(short length) {
	this.length = length;
    }

    public Integer getDay() {
	return day;
    }

    public void setDay(Integer day) {
	this.day = day;
    }

    public Integer getCycle() {
	return cycle;
    }

    public void setCycle(Integer cycle) {
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
	return this.name;
    }

}
