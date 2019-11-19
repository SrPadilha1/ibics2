<%-- 
    Document   : usuarioeditar
    Created on : 19/11/2019, 19:29:22
    Author     : aluno
--%>
<%@page import="classes.Usuario"%>
<%@page import="java.util.Base64"%>
<%@page import="servlet.*"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:directive.page import="classes.*" />
<jsp:directive.page import="servlet.*" />


<%
    //Criar variaveis
    Usuario usuario = new Usuario();
    String nome = "";
    String senha = "";
    String email = "";
    Long cpf = Long.MIN_VALUE;
    //Captura id (se alteração)
    String idUsuario = request.getParameter("pid");
    //Localiza usuario (se alteração)
    if (!idUsuario.isEmpty()) {
        usuario = UsuarioControle.buscar(Integer.parseInt(idUsuario));
        nome = usuario.getDsEmail();
        senha = usuario.getDsSenha();
        email = usuario.getNmNome();
        cpf = usuario.getNrCpf();
    } else {
        idUsuario = "";
    }
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>IBICS</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="cadastroo.css">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Oswald">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open Sans">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
            h1,h6 {font-family: "Oswald"}

            body {font-family: "Open Sans"}

        </style>

    <body class="w3-light-grey">

        <header class="w3-container w3-center w3-padding-48 w3-green">
            <h1 class="w3-xxxlarge"><b>IBICS</b></h1>
            <h6>Bem-vido ao IBICS <span class="w3-tag">I believe i can study</span></h6>
        </header>
        <br><br>
    </body>
    <br> <br>

    <form method="POST" action="ServletUsuario" enctype="multipart/form-data">

        <div hidden>
            <input type="text" name="pid" value="<%=idUsuario%>">
        </div>
        
        <b>Nome</b>
        <input type="text" placeholder="Nome" name="nm_nome" value="<%=nome%>">

        <b>Email</b>
        <input type="text" placeholder="Email" name="ds_email" value="<%=email%>">

        <b>CPF:</b>
        <input type="text" placeholder="CPF" name="nr_cpf" minlength="11" maxlength="11" value="<%=cpf%>">
        <br>

        <b>Senha</b>
        <input type="password" placeholder="Senha" name="ds_senha" value="<%=senha%>">

        <input type="submit" value="Alterar">
        <br>
    </form>
</body>
</html>