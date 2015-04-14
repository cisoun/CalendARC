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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
@Entity
@Table(name = "users")
@NamedQueries({
    @NamedQuery(name = "Users.findAll", query = "SELECT u FROM user u"),
    @NamedQuery(name = "Users.findById", query = "SELECT u FROM user u WHERE u.id = :id"),
    @NamedQuery(name = "Users.findByName", query = "SELECT u FROM user u WHERE u.name = :name"),
    @NamedQuery(name = "Users.findByEmail", query = "SELECT c FROM Customer c WHERE c.email = :email"),
    @NamedQuery(name = "Users.findByPhone", query = "SELECT c FROM Customer c WHERE c.phone = :phone"),
    @NamedQuery(name = "Users.findByAddress", query = "SELECT c FROM Customer c WHERE c.address = :address"),
    @NamedQuery(name = "Users.findByCityRegion", query = "SELECT c FROM Customer c WHERE c.cityRegion = :cityRegion"),
    @NamedQuery(name = "Users.findByCcNumber", query = "SELECT c FROM Customer c WHERE c.ccNumber = :ccNumber")})
public class User implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;

    @Basic(optional = false)
    @Column(name = "firstname")
    private String firstname;

    @Basic(optional = false)
    @Column(name = "lastname")
    private String lastname;

    @Basic(optional = false)
    @Column(name = "mail")
    private String mail;

    @Basic(optional = false)
    @Column(name = "password")
    private String password;
    
    @Basic(optional = false)
    @Column(name = "permission")
    private Integer permission;

    public User() {

    }

    public User(Integer id) {
	this.id = id;
    }

    public User(Integer id, String firstname, String lastname, String mail, String password, Integer permission) {
	this.id = id;
	this.firstname = firstname;
	this.lastname = lastname;
	this.mail = mail;
	this.password = password;
	this.permission = permission;
    }

    public Integer getId(Integer id) {
	return id;
    }

    public void setId(Integer id) {
	this.id = id;
    }
    
    public String getMail() {
	return mail;
    }

    public void setMail(String mail) {
	this.mail = mail;
    }

    public String getFirstname() {
	return firstname;
    }

    public void setFirstname(String firstname) {
	this.firstname = firstname;
    }

    public String getLastname() {
	return lastname;
    }

    public void setLastname(String lasttname) {
	this.lastname = lasttname;
    }

    public String getPassword() {
	return password;
    }
    
    public void setPassword(String password) {
	this.password = password;
    }
    
    @Override
    public boolean equals(Object object) {
	// TODO: Warning - this method won't work in the case the id fields are not set
	if (!(object instanceof User)) {
	    return false;
	}
	User other = (User) object;
	if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
	    return false;
	}
	return true;
    }

    @Override
    public String toString() {
	return "entity.User[id=" + id + "]";
    }
}
