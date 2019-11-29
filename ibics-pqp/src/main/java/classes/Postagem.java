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
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
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
@Table(name = "postagem")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Postagem.findAll", query = "SELECT p FROM Postagem p")
    , @NamedQuery(name = "Postagem.findByConteudo", query = "SELECT p FROM Postagem p WHERE p.conteudo = :conteudo")
    , @NamedQuery(name = "Postagem.findByTitulo", query = "SELECT p FROM Postagem p WHERE p.titulo = :titulo")
    , @NamedQuery(name = "Postagem.findByDataHora", query = "SELECT p FROM Postagem p WHERE p.dataHora = :dataHora")
    , @NamedQuery(name = "Postagem.findByIdPostagem", query = "SELECT p FROM Postagem p WHERE p.idPostagem = :idPostagem")
    , @NamedQuery(name = "Postagem.findByExtensao", query = "SELECT p FROM Postagem p WHERE p.extensao = :extensao")})
public class Postagem implements Serializable {

    @Lob
    @Column(name = "foto")
    private byte[] foto;
    @OneToMany(mappedBy = "postagem")
    private Collection<Avaliacao> avaliacaoCollection;
    @OneToMany(mappedBy = "postagem")
    private Collection<Denuncia> denunciaCollection;
    
    @OneToMany(mappedBy = "idPostagem")
    private Collection<Comentario> comentarioCollection;

    private static final long serialVersionUID = 1L;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "conteudo")
    private String conteudo;
    
    @Size(max = 2147483647)
    @Column(name = "titulo")
    private String titulo;
    
    @Column(name = "data_hora")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dataHora;
    
    @Id
    @Basic(optional = false)
    @NotNull
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "meugerador")
    @SequenceGenerator(name="meugerador", sequenceName = "sq_postagem")
    @Column(name = "id_postagem")
    private Integer idPostagem;
    
    
    @Size(max = 2147483647)
    @Column(name = "extensao")
    private String extensao;
    
    @JoinColumn(name = "id_usuario", referencedColumnName = "id_usuario")
    @ManyToOne(optional = false)
    private Usuario idUsuario;

    public Postagem() {
    }

    public Postagem(Integer idPostagem) {
        this.idPostagem = idPostagem;
    }

    public Postagem(Integer idPostagem, String conteudo) {
        this.idPostagem = idPostagem;
        this.conteudo = conteudo;
    }

    public String getConteudo() {
        return conteudo;
    }

    public void setConteudo(String conteudo) {
        this.conteudo = conteudo;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public Date getDataHora() {
        return dataHora;
    }

    public void setDataHora(Date dataHora) {
        this.dataHora = dataHora;
    }

    public Integer getIdPostagem() {
        return idPostagem;
    }

    public void setIdPostagem(Integer idPostagem) {
        this.idPostagem = idPostagem;
    }


    public String getExtensao() {
        return extensao;
    }

    public void setExtensao(String extensao) {
        this.extensao = extensao;
    }

    public Usuario getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(Usuario idUsuario) {
        this.idUsuario = idUsuario;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idPostagem != null ? idPostagem.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Postagem)) {
            return false;
        }
        Postagem other = (Postagem) object;
        if ((this.idPostagem == null && other.idPostagem != null) || (this.idPostagem != null && !this.idPostagem.equals(other.idPostagem))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "classes.Postagem[ idPostagem=" + idPostagem + " ]";
    }


    @XmlTransient
    public Collection<Comentario> getComentarioCollection() {
        return comentarioCollection;
    }

    public void setComentarioCollection(Collection<Comentario> comentarioCollection) {
        this.comentarioCollection = comentarioCollection;
    }


    @XmlTransient
    public Collection<Denuncia> getDenunciaCollection() {
        return denunciaCollection;
    }

    public void setDenunciaCollection(Collection<Denuncia> denunciaCollection) {
        this.denunciaCollection = denunciaCollection;
    }


    @XmlTransient
    public Collection<Avaliacao> getAvaliacaoCollection() {
        return avaliacaoCollection;
    }

    public void setAvaliacaoCollection(Collection<Avaliacao> avaliacaoCollection) {
        this.avaliacaoCollection = avaliacaoCollection;
    }

    public byte[] getFoto() {
        return foto;
    }

    public void setFoto(byte[] foto) {
        this.foto = foto;
    }
    
}
