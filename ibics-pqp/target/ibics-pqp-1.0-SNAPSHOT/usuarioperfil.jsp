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
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
        <link rel="stylesheet" href="perfil.css" />
    </head>
    <body class="is-preload">

        <!-- Wrapper -->
        <div id="wrapper">

            <!-- Main -->
            <div id="main">
                <div class="inner">

                    <!-- Header -->
                    <header id="header">
                        <a class="logo"><strong>Perfil</strong> </a>
                        <ul class="icons">

                            <li><a href="usuarioperfil.jsp" ><span class="label"><%=usuario.getIdUsuario()%></span></a></li>
                            <li><a class="icon fa fa-user-circle-o"><span class="label">Perfil</span></a></li>
                        </ul>
                    </header>

                    <!-- Content -->
                    <section>
                        <div id="block" style="padding-left: 10px;">
                            <div id="left">
                                <img src="avatar.jpg" width="90%" style="border-radius: 10000px;">
                            </div>

                            Nome: <%=usuario.getNmNome()%><br><br>
                            E-mail: <%=usuario.getDsEmail()%><br><br>

                        </div>
                    </section>
                </div>
            </div>
            <br>
            <!-- Sidebar -->
            <div id="sidebar">
                <div class="inner">

                    <!-- Section -->
                    <section>
                        <header class="major">
                            <h2>Fale conosco!</h2>
                        </header>
                        <p>Em caso de dúvidas, entre em contato.</p>
                        <ul class="contact">
                            <li class="fa-envelope-o"><a href="#">ibics@gmail.com</a></li>
                            <li class="fa-phone">(22)00000-0000</li>
                            <li class="fa-home"> Quissamã <br />
                                RJ, Brasil</li>
                        </ul>
                    </section>
                </div>
            </div>
        </div>

        <a  href = "perfilEdit.jsp" > <button class= "botão w3 w3-black " > <b> Editar Perfil </b></button> </a>


        <footer class="w3-container w3-green" style="padding:32px">
            <a href="#" class="w3-button w3-black w3-padding-large w3-margin-bottom"><i class="fa fa-arrow-up w3-margin-right"></i>Inicio</a>

        </footer>

        <br>
    </body>
</html>