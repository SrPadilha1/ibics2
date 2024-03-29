<%@page import="classes.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>IBICS</title>
        <meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="https://www.w3schools.com/w3css/4/w3.css"/>
        <link rel="stylesheet" type="text/css" href="postagem.css">
        <% Usuario usuario = (Usuario) session.getAttribute("UsuarioLogado");%>
    </head>
    <body>


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

    <body>
        <br><br>
    </div>
    <h2>Adicione novos conteúdos</h2>
    <p></p>

    <div align="center">
        <form action="ServletPostagem" method="post" enctype="multipart/form-data">      
            <textarea name="titulo" style="width:300px; height:50px; text-align: center;" placeholder="Título" ></textarea> 
            <br> <textarea name="conteudo" style="width:300px; height:50px; text-align: center;" placeholder="No que você está pensando?" ></textarea> <br>
            <h5>Escolher imagem:</h5>
            <input type="file" name="foto" accept="image/png, image/jpeg"><br><br>
            <input type="hidden" value="<%=usuario.getIdUsuario()%>" name="pid">
            <input type="hidden" value="" name="ppid">
            <input type="submit" value="Enviar Postagem" href ="paginadepost.jsp">
        </form> 
    </div>          
</body>
</html>