<%@page import="java.util.Base64"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="servlet.ControlePostagem"%>
<%@page import="classes.Postagem"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<jsp:directive.page import="classes.*" />
<jsp:directive.page import="java.util.List" />
<!DOCTYPE>
<html lang="en">
    <head>
        <title>IBICSS</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="ibics.css">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Oswald">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open Sans">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="paginadepost.css">
        <style>
            h1,h2,h3,h4,h5,h6 {font-family: "Oswald"}
            body {font-family: "Open Sans"}

        </style>
        <%
            Usuario usuario = (Usuario) session.getAttribute("UsuarioLogado");
            System.out.println("tem o usuario: " + usuario);
        %>
    <body class="w3-light-grey">
        <header class="w3-container w3-center w3-padding-48 w3-green">
            <h1 class="w3-xxxlarge"><b>IBICS</b></h1>
            <h6>Bem-vido ao IBICS <span class="w3-tag">I believe I can study</span></h6>
            <a href="paginadepost.jsp" class="w3-button w3-black w3-padding-large w3-margin-bottom"><i class="fa fa-arrow-up w3-margin-right"></i>Página de post</a>
            
        </header>
        
        <img class="sticky" src="img_avatar.png" alt="Avatar"
        
        
        Nome: <%=usuario.getNmNome()%>
        <br>
        Email: <%=usuario.getDsEmail()%>
        <br>
    </body>
</html>