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
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
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
@Table(name = "denuncia")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Denuncia.findAll", query = "SELECT d FROM Denuncia d")
    , @NamedQuery(name = "Denuncia.findByDataHora", query = "SELECT d FROM Denuncia d WHERE d.dataHora = :dataHora")
    , @NamedQuery(name = "Denuncia.findByDescricao", query = "SELECT d FROM Denuncia d WHERE d.descricao = :descricao")
    , @NamedQuery(name = "Denuncia.findById", query = "SELECT d FROM Denuncia d WHERE d.id = :id")})
public class Denuncia implements Serializable {

    private static final long serialVersionUID = 1L;
    @Column(name = "data_hora")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dataHora;
    
    @Size(max = 2147483647)
    @Column(name = "descricao")
    private String descricao;
    
    @Id
    @NotNull
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "meugerador")
    @SequenceGenerator(name="meugerador", sequenceName = "denuncia_id_postagem_seq")
    @Column(name = "id")
    private Integer id;
    
    @JoinColumn(name = "postagem", referencedColumnName = "id_postagem")
    @ManyToOne
    private Postagem postagem;
    
    @JoinColumn(name = "usuario", referencedColumnName = "id_usuario")
    @ManyToOne
    private Usuario usuario;

    public Denuncia() {
    }

    public Denuncia(Integer id) {
        this.id = id;
    }

    public Date getDataHora() {
        return dataHora;
    }

    public void setDataHora(Date dataHora) {
        this.dataHora = dataHora;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Postagem getPostagem() {
        return postagem;
    }

    public void setPostagem(Postagem postagem) {
        this.postagem = postagem;
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
        if (!(object instanceof Denuncia)) {
            return false;
        }
        Denuncia other = (Denuncia) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "classes.Denuncia[ id=" + id + " ]";
    }
    
}
