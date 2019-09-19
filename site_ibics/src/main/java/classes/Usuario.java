/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author aluno
 */
@Entity
@Table(name = "usuario")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Usuario.findAll", query = "SELECT u FROM Usuario u")
    , @NamedQuery(name = "Usuario.findByDsEmail", query = "SELECT u FROM Usuario u WHERE u.dsEmail = :dsEmail")
    , @NamedQuery(name = "Usuario.findByNmNome", query = "SELECT u FROM Usuario u WHERE u.nmNome = :nmNome")
    , @NamedQuery(name = "Usuario.findByDsSenha", query = "SELECT u FROM Usuario u WHERE u.dsSenha = :dsSenha")})
public class Usuario implements Serializable {

    @Column(name = "nr_cpf")
    private Long nrCpf;
    @Column(name = "dt_nasc")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dtNasc;
    @Column(name = "cd_adm")
    private Integer cdAdm;
    @OneToMany(mappedBy = "dsEmailAutor")
    private Collection<Postagem> postagemCollection;

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "ds_email")
    private String dsEmail;
    @Size(max = 2147483647)
    @Column(name = "nm_nome")
    private String nmNome;
    @Size(max = 2147483647)
    @Column(name = "ds_senha")
    private String dsSenha;

    public Usuario() {
    }

    public Usuario(String dsEmail) {
        this.dsEmail = dsEmail;
    }

    public String getDsEmail() {
        return dsEmail;
    }

    public void setDsEmail(String dsEmail) {
        this.dsEmail = dsEmail;
    }

    public String getNmNome() {
        return nmNome;
    }

    public void setNmNome(String nmNome) {
        this.nmNome = nmNome;
    }

    public String getDsSenha() {
        return dsSenha;
    }

    public void setDsSenha(String dsSenha) {
        this.dsSenha = dsSenha;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (dsEmail != null ? dsEmail.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Usuario)) {
            return false;
        }
        Usuario other = (Usuario) object;
        if ((this.dsEmail == null && other.dsEmail != null) || (this.dsEmail != null && !this.dsEmail.equals(other.dsEmail))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "classes.Usuario[ dsEmail=" + dsEmail + " ]";
    }

    public Long getNrCpf() {
        return nrCpf;
    }

    public void setNrCpf(Long nrCpf) {
        this.nrCpf = nrCpf;
    }

    public Date getDtNasc() {
        return dtNasc;
    }

    public void setDtNasc(Date dtNasc) {
        this.dtNasc = dtNasc;
    }

    public Integer getCdAdm() {
        return cdAdm;
    }

    public void setCdAdm(Integer cdAdm) {
        this.cdAdm = cdAdm;
    }

    @XmlTransient
    public Collection<Postagem> getPostagemCollection() {
        return postagemCollection;
    }

    public void setPostagemCollection(Collection<Postagem> postagemCollection) {
        this.postagemCollection = postagemCollection;
    }
    
}
