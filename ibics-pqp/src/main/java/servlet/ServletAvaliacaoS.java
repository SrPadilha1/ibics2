/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import classes.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

/**
 *
 * @author aluno
 */
public class ServletAvaliacaoS extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String like = request.getParameter("valor");
        
        int num =  Integer.parseInt(like);

        String idtext = request.getParameter("pid");
        String idAvaliador = request.getParameter("avaliador");
        String idPostagem = request.getParameter("postagem");
        System.out.println("valor: "+num);
        System.out.println("pid:  "+idtext);
        System.out.println("avaliador:  "+idAvaliador);
        System.out.println("publicacao:  "+idPostagem);

       
        
        Avaliacao avaliacao = new Avaliacao();
        Postagem postagem = new Postagem();
        Usuario usuario = new Usuario();

        if (idtext != null && !idtext.isEmpty()) {
            Integer id = Integer.parseInt(idtext);
            avaliacao.setId(id);
        }

        postagem.setIdPostagem(Integer.parseInt(idPostagem));
        usuario.setIdUsuario(Integer.parseInt(idAvaliador));

        Session sessionRecheio;
        sessionRecheio = HibernateUtil.getSession();
        Avaliacao avBD = (Avaliacao) sessionRecheio.createQuery("from Avaliacao where usuario=? and postagem=?").setEntity(0, usuario).setEntity(1, postagem).uniqueResult();
        
        if (avBD != null) {
            avaliacao = avBD;
        }
        avaliacao.setUsuario(usuario);
        avaliacao.setPostagem(postagem);
        avaliacao.setValor(num);

        Transaction tr = sessionRecheio.beginTransaction();
        sessionRecheio.saveOrUpdate(avaliacao);
        tr.commit();
        
        response.sendRedirect("paginadepost.jsp");
        }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
