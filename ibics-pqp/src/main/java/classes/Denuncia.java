/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author aluno
 */
@Entity
@Table(name = "denuncia")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Denuncia.findAll", query = "SELECT d FROM Denuncia d")
    , @NamedQuery(name = "Denuncia.findByConteudod", query = "SELECT d FROM Denuncia d WHERE d.conteudod = :conteudod")})
public class Denuncia implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "conteudod")
    private String conteudod;

    public Denuncia() {
    }

    public Denuncia(String conteudod) {
        this.conteudod = conteudod;
    }

    public String getConteudod() {
        return conteudod;
    }

    public void setConteudod(String conteudod) {
        this.conteudod = conteudod;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (conteudod != null ? conteudod.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Denuncia)) {
            return false;
        }
        Denuncia other = (Denuncia) object;
        if ((this.conteudod == null && other.conteudod != null) || (this.conteudod != null && !this.conteudod.equals(other.conteudod))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "classes.Denuncia[ conteudod=" + conteudod + " ]";
    }
    
}
