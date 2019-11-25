/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import classes.Denuncia;
import classes.Usuario;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

public class DenunciaControle {

    //Função de salvar/atualizar um usuario
    public static boolean salvar(Denuncia denuncia){
        try{
            Session sessionRecheio;
            sessionRecheio = HibernateUtil.getSession();
            Transaction tr = sessionRecheio.beginTransaction();
            sessionRecheio.saveOrUpdate(denuncia);
            tr.commit();
            return true;
        }
        catch(Exception ex){
            return false;
        }        
    }
    
    //Localiza um usuario pelo id
    public static Denuncia buscar(Integer id)
    {
        String idDenuncia = id.toString();
        Session sessionRecheio;
        sessionRecheio = HibernateUtil.getSession();
        Transaction tr = sessionRecheio.beginTransaction();
        String hql = "from Denunciau where u.id='"+idDenuncia+"'";
        Denuncia denuncia = (Denuncia)sessionRecheio.createQuery(hql).uniqueResult();
        tr.commit();
        return denuncia;
    }
    
    //Retorna todos os usuario do sistema
    public static List<Denuncia> listar()
    {
        Session sessionRecheio;
        sessionRecheio = HibernateUtil.getSession();
        Transaction tr = sessionRecheio.beginTransaction();
        String hql = "from Denuncia u";
        List<Denuncia> lista = (List)sessionRecheio.createQuery(hql).list();
        tr.commit();
        return lista;
    }
    
    //Função de apagar um usuario
    public static boolean deletar(Denuncia denuncia){
        try{
            Session sessionRecheio;
            sessionRecheio = HibernateUtil.getSession();
            Transaction tr = sessionRecheio.beginTransaction();
            sessionRecheio.delete(denuncia);
            tr.commit();
            return true;
        }
        catch(Exception ex){
            return false;
        }        
    }    
}