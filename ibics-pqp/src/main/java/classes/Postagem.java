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
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author aluno
 */
@Entity
@Table(name = "postagem")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Postagem.findAll", query = "SELECT p FROM Postagem p")
    , @NamedQuery(name = "Postagem.findByConteudo", query = "SELECT p FROM Postagem p WHERE p.conteudo = :conteudo")
    , @NamedQuery(name = "Postagem.findById", query = "SELECT p FROM Postagem p WHERE p.id = :id")
    , @NamedQuery(name = "Postagem.findByExtensao", query = "SELECT p FROM Postagem p WHERE p.extensao = :extensao")})
public class Postagem implements Serializable {

    private static final long serialVersionUID = 1L;
    @Basic(optional = false)
    @NotNull
    @Column(name = "conteudo")
    private String conteudo;

    @Id
    @Basic(optional = false)
    @NotNull
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "meugerador")
    @SequenceGenerator(name = "meugerador", sequenceName = "sq_postagem")
    @Column(name = "id")
    private Integer id;

    // @Lob
    @Column(name = "foto")
    private byte[] foto;

    
    @Column(name = "extensao")
    private String extensao;

    @JoinColumn(name = "id", referencedColumnName = "id", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private Usuario usuario;

    public Postagem() {
    }

    public Postagem(Integer id) {
        this.id = id;
    }

    public Postagem(Integer id, String conteudo) {
        this.id = id;
        this.conteudo = conteudo;
    }

    public String getConteudo() {
        return conteudo;
    }

    public void setConteudo(String conteudo) {
        this.conteudo = conteudo;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public byte[] getFoto() {
        return foto;
    }

    public void setFoto(byte[] foto) {
        this.foto = foto;
    }

    public String getExtensao() {
        return extensao;
    }

    public void setExtensao(String extensao) {
        this.extensao = extensao;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Postagem)) {
            return false;
        }
        Postagem other = (Postagem) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "classes.Postagem[ id=" + id + " ]";
    }

}
