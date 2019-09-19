/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
 * @author aluno
 */
@Entity
@Table(name = "postagem")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Postagem.findAll", query = "SELECT p FROM Postagem p")
    , @NamedQuery(name = "Postagem.findByCdPost", query = "SELECT p FROM Postagem p WHERE p.cdPost = :cdPost")
    , @NamedQuery(name = "Postagem.findByDtDataHora", query = "SELECT p FROM Postagem p WHERE p.dtDataHora = :dtDataHora")
    , @NamedQuery(name = "Postagem.findByNmTitulo", query = "SELECT p FROM Postagem p WHERE p.nmTitulo = :nmTitulo")
    , @NamedQuery(name = "Postagem.findByCdConteudo", query = "SELECT p FROM Postagem p WHERE p.cdConteudo = :cdConteudo")
    , @NamedQuery(name = "Postagem.findByCdRecomendado", query = "SELECT p FROM Postagem p WHERE p.cdRecomendado = :cdRecomendado")
    , @NamedQuery(name = "Postagem.findByCdBloqueada", query = "SELECT p FROM Postagem p WHERE p.cdBloqueada = :cdBloqueada")})
public class Postagem implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "cd_post")
    private String cdPost;
    @Column(name = "dt_data_hora")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dtDataHora;
    @Size(max = 2147483647)
    @Column(name = "nm_titulo")
    private String nmTitulo;
    @Size(max = 2147483647)
    @Column(name = "cd_conteudo")
    private String cdConteudo;
    @Size(max = 2147483647)
    @Column(name = "cd_recomendado")
    private String cdRecomendado;
    @Column(name = "cd_bloqueada")
    private Integer cdBloqueada;
    @JoinColumn(name = "ds_email_autor", referencedColumnName = "ds_email")
    @ManyToOne
    private Usuario dsEmailAutor;

    public Postagem() {
    }

    public Postagem(String cdPost) {
        this.cdPost = cdPost;
    }

    public String getCdPost() {
        return cdPost;
    }

    public void setCdPost(String cdPost) {
        this.cdPost = cdPost;
    }

    public Date getDtDataHora() {
        return dtDataHora;
    }

    public void setDtDataHora(Date dtDataHora) {
        this.dtDataHora = dtDataHora;
    }

    public String getNmTitulo() {
        return nmTitulo;
    }

    public void setNmTitulo(String nmTitulo) {
        this.nmTitulo = nmTitulo;
    }

    public String getCdConteudo() {
        return cdConteudo;
    }

    public void setCdConteudo(String cdConteudo) {
        this.cdConteudo = cdConteudo;
    }

    public String getCdRecomendado() {
        return cdRecomendado;
    }

    public void setCdRecomendado(String cdRecomendado) {
        this.cdRecomendado = cdRecomendado;
    }

    public Integer getCdBloqueada() {
        return cdBloqueada;
    }

    public void setCdBloqueada(Integer cdBloqueada) {
        this.cdBloqueada = cdBloqueada;
    }

    public Usuario getDsEmailAutor() {
        return dsEmailAutor;
    }

    public void setDsEmailAutor(Usuario dsEmailAutor) {
        this.dsEmailAutor = dsEmailAutor;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (cdPost != null ? cdPost.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Postagem)) {
            return false;
        }
        Postagem other = (Postagem) object;
        if ((this.cdPost == null && other.cdPost != null) || (this.cdPost != null && !this.cdPost.equals(other.cdPost))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "classes.Postagem[ cdPost=" + cdPost + " ]";
    }
    
}
