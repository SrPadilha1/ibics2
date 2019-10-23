/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.BigInteger;
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
@Table(name = "foto")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Foto.findAll", query = "SELECT f FROM Foto f")
    , @NamedQuery(name = "Foto.findById", query = "SELECT f FROM Foto f WHERE f.id = :id")
    , @NamedQuery(name = "Foto.findByExtensao", query = "SELECT f FROM Foto f WHERE f.extensao = :extensao")
    , @NamedQuery(name = "Foto.findByIdUsuario", query = "SELECT f FROM Foto f WHERE f.idUsuario = :idUsuario")})
public class Foto implements Serializable {

    private static final long serialVersionUID = 1L;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Id
    @Basic(optional = false)
    @NotNull
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "meugerador")
     @SequenceGenerator(name ="meugerador", sequenceName = "sq_foto")
    @Column(name = "id")
    private Integer id;
    //@Lob
    @Column(name = "foto")
    private byte[] foto;
    @Size(max = 2147483647)
    @Column(name = "extensao")
    private String extensao;
    @Column(name = "id_usuario")
    private BigInteger idUsuario;
    @JoinColumn(name = "id", referencedColumnName = "id_usuario", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private Usuario usuario;

    public Foto() {
    }

    public Foto(Integer id) {
        this.id = id;
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

    public BigInteger getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(BigInteger idUsuario) {
        this.idUsuario = idUsuario;
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
        if (!(object instanceof Foto)) {
            return false;
        }
        Foto other = (Foto) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "classes.Foto[ id=" + id + " ]";
    }
    
}
