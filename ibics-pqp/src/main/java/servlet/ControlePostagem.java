package servlet;

import classes.Comentario;
import classes.Postagem;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

public class ControlePostagem {

    //Função de salvar/atualizar um postagem
public static List<Comentario> listarc()
    {
        Session sessionRecheio;
        sessionRecheio = HibernateUtil.getSession();
        Transaction tr = sessionRecheio.beginTransaction();
        String hql = "from Comentario";
        List<Comentario> listac = (List)sessionRecheio.createQuery(hql).list();
        tr.commit();
        return listac;
    }
    
    //Localiza um postagem pelo id
    public static Postagem buscar(Integer id)
    {
        String idPostagem = id.toString();
        Session sessionRecheio;
        sessionRecheio = HibernateUtil.getSession();
        Transaction tr = sessionRecheio.beginTransaction();
        String hql = "from Postagem u where u.id='"+idPostagem+"'";
        Postagem postagem = (Postagem)sessionRecheio.createQuery(hql).uniqueResult();
        tr.commit();
        return postagem;
    }
    
    //Retorna todos os postagem do sistema
    public static List<Postagem> listar()
    {
        Session sessionRecheio;
        sessionRecheio = HibernateUtil.getSession();
        Transaction tr = sessionRecheio.beginTransaction();
        String hql = "from Postagem u";
        List<Postagem> lista = (List)sessionRecheio.createQuery(hql).list();
        tr.commit();
        return lista;
    }
    
    //Função de apagar um postagem
    public static boolean deletar(Postagem postagem){
        try{
            Session sessionRecheio;
            sessionRecheio = HibernateUtil.getSession();
            Transaction tr = sessionRecheio.beginTransaction();
            sessionRecheio.delete(postagem);
            tr.commit();
            return true;
        }
        catch(Exception ex){
            return false;
        }        
    }    
}