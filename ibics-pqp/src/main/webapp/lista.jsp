<%-- 
    Document   : lista
    Created on : 12/11/2019, 12:07:04
    Author     : aluno
--%>

<%@page import="servlet.UsuarioControle"%>
<%@page import="classes.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
         <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

   
    <link rel="stylesheet" href="css/style.css">
    
        <title>Alteração de dados</title>
    </head>
    <body>
        
        <%
        //Criar variaveis
        Usuario usuario = new Usuario();
        String nome = "";
        String senha = "";
        String email = "";
        String nickname = "";
        //Captura id (se alteração)
        String idUsuario = request.getParameter("pid");
        //Localiza usuario (se alteração)
        if(!idUsuario.isEmpty()){
            usuario = UsuarioControle.buscar(Integer.parseInt(idUsuario));
            nome = usuario.getNmNome();
            senha = usuario.getDsSenha();  
            email = usuario.getDsEmail();  
            
        }
        else{
            idUsuario = "";
        }
        
        %>
        
         <form method="POST" action="ServletUsuario">
            <div hidden>  ID<input type="text" name="pid" value="<%=idUsuario%>"> </div>
<div class="main">

        <section class="signup">
         
            <div class="container">
                <div class="signup-content">
                    <form method="POST" id="signup-form" class="signup-form">
                        <h2 class="form-title">Alterando dados</h2>
                        <div hidden>
                            <input type="text" name="pid" value="">
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-input" name="nome" id="name" placeholder="Nome" value="<%=nome%>"/>
                        </div>
                        <div class="form-group">
                            <input type="email" class="form-input" name="email" id="email" placeholder="Email" value="<%=email%>"/>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-input" name="senha" id="password" placeholder="Senha" value="<%=nome%>"/>
                        </div>
                       
                        <div class="form-group">
                            <input type="submit" name="submit"  class="form-submit" value="Alterar"/>
                        </div>
                    </form>
                    <p class="loginhere">
                       Já tem uma conta? <a href="Login.html" class="loginhere-link">Entre aqui </a>
                    </p>
                </div>
            </div>
        </section>

    </div>
        
        </form>
    </body>
</html>

