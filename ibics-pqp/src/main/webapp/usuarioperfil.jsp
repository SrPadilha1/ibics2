<%-- 
    Document   : usuarioperfil
    Created on : 12/11/2019, 12:10:26
    Author     : aluno
--%>

<%@page import="classes.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Perfil</title>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link href="img/favicon.ico" rel="shortcut icon"/>


        <link href="https://fonts.googleapis.com/css?family=Roboto:400,400i,500,500i,700,700i" rel="stylesheet">


        <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" href="css/font-awesome.min.css"/>
        <link rel="stylesheet" href="css/owl.carousel.css"/>
        <link rel="stylesheet" href="css/style.css"/>
        <link rel="stylesheet" href="css/animate.css"/>
        <%
            Usuario usuario = (Usuario) session.getAttribute("UsuarioLogado");
        %>


    </head>
    <body>




        <div id="preloder">
            <div class="loader"></div>
        </div>


        <header class="header-section">
            <div class="container">

                <a class="site-logo" href="pginicio.html">
                    <img src="img/" alt="">
                </a>
                <div class="user-panel">
                   <a href="usuarioperfil.jsp"> Bem-vindo, <%=usuario.getNmNome()%>!
                </div>

                <div class="nav-switch">
                    <i class="fa fa-bars"></i>
                </div>

            </div>
        </header>



       

        <section class="page-info-section set-bg" data-setbg="img/page-top-bg/5.jpg">
            <div class="pi-content">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-5 col-lg-6 text-white">
                            <h2>Perfil</h2>
                            <p></p>
                        </div>
                    </div>
                </div>
            </div>
        </section>




        <section class="page-section spad contact-page">
            <div class="container">


                <div class="col-lg-8">
                    <div class="contact-form-warp">
                        <h4 class="comment-title">Seus Dados</h4>
                        <form class="comment-form">
                            <div class="row">

                                <center>
                                    
                                     <input type="file" name="foto" accept="image/png, image/jpeg"><br><br>

                                    
                                    <div style="padding: 10px 10px 10px 10px;">

                                        Nome: <%=usuario.getNmNome()%> <br><br>
                                           
                                        E-mail: <%=usuario.getDsEmail()%><br><br>

                                        ID: <%=usuario.getIdUsuario()%> <br><br>

                                        <a href="cadastro/alterar.jsp?pid=<%=usuario.getIdUsuario()%>">Editar Perfil</a><br><br>
                                        
                                        <a href="Logout">Sair</a><br><br>
                                    </div>
                                </center>


                            </div>
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<section class="footer-top-section">
    <div class="container">

        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.marquee.min.js"></script>
        <script src="js/main.js"></script>



        </body>
        </html>
