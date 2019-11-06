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
@Table(name = "comentario")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Comentario.findAll", query = "SELECT c FROM Comentario c")
    , @NamedQuery(name = "Comentario.findByComentario", query = "SELECT c FROM Comentario c WHERE c.comentario = :comentario")
    , @NamedQuery(name = "Comentario.findByTitulo", query = "SELECT c FROM Comentario c WHERE c.titulo = :titulo")
    , @NamedQuery(name = "Comentario.findByDataHora", query = "SELECT c FROM Comentario c WHERE c.dataHora = :dataHora")
    , @NamedQuery(name = "Comentario.findByIdComentario", query = "SELECT c FROM Comentario c WHERE c.idComentario = :idComentario")})
public class Comentario implements Serializable {

    private static final long serialVersionUID = 1L;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "comentario")
    private String comentario;
    @Size(max = 2147483647)
    @Column(name = "titulo")
    private String titulo;
    @Column(name = "data_hora")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dataHora;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "id_comentario")
    private Integer idComentario;
    @JoinColumn(name = "id_postagem", referencedColumnName = "id_postagem")
    @ManyToOne
    private Postagem idPostagem;
    @JoinColumn(name = "id_usuario", referencedColumnName = "id_usuario")
    @ManyToOne
    private Usuario idUsuario;

    public Comentario() {
    }

    public Comentario(Integer idComentario) {
        this.idComentario = idComentario;
    }
    public Comentario(Integer idComentario, String comentario) {
        this.idComentario = idComentario;
        this.comentario = comentario;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
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

    public Integer getIdComentario() {
        return idComentario;
    }

    public void setIdComentario(Integer idComentario) {
        this.idComentario = idComentario;
    }

    public Postagem getIdPostagem() {
        return idPostagem;
    }

    public void setIdPostagem(Postagem idPostagem) {
        this.idPostagem = idPostagem;
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
        hash += (idComentario != null ? idComentario.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Comentario)) {
            return false;
        }
        Comentario other = (Comentario) object;
        if ((this.idComentario == null && other.idComentario != null) || (this.idComentario != null && !this.idComentario.equals(other.idComentario))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "classes.Comentario[ idComentario=" + idComentario + " ]";
    }
    
}
