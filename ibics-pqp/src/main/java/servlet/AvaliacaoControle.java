/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import classes.*;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

public class AvaliacaoControle {

    //Função de salvar/atualizar um usuario
    public static boolean salvar(Avaliacao avaliacao){
        try{
            Session sessionRecheio;
            sessionRecheio = HibernateUtil.getSession();
            Transaction tr = sessionRecheio.beginTransaction();
            sessionRecheio.saveOrUpdate(avaliacao);
            tr.commit();
            return true;
        }
        catch(Exception ex){
            return false;
        }        
    }
    
    //Localiza um usuario pelo id
    public static Avaliacao buscar(Integer id)
    {
        String idAvaliacao = id.toString();
        Session sessionRecheio;
        sessionRecheio = HibernateUtil.getSession();
        Transaction tr = sessionRecheio.beginTransaction();
        String hql = "from Avaliacao where u.id='"+idAvaliacao+"'";
        Avaliacao avaliacao = (Avaliacao)sessionRecheio.createQuery(hql).uniqueResult();
        tr.commit();
        return avaliacao;
    }
    
    //Retorna todos os usuario do sistema
    public static List<Avaliacao> listar()
    {
        Session sessionRecheio;
        sessionRecheio = HibernateUtil.getSession();
        Transaction tr = sessionRecheio.beginTransaction();
        String hql = "from Avaliacao u";
        List<Avaliacao> lista = (List)sessionRecheio.createQuery(hql).list();
        tr.commit();
        return lista;
    }
    
    //Função de apagar um usuario
    public static boolean deletar(Avaliacao avaliacao){
        try{
            Session sessionRecheio;
            sessionRecheio = HibernateUtil.getSession();
            Transaction tr = sessionRecheio.beginTransaction();
            sessionRecheio.delete(avaliacao);
            tr.commit();
            return true;
        }
        catch(Exception ex){
            return false;
        }        
    }    
}