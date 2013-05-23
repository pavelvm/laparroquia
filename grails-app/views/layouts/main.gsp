<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title><g:layoutTitle default="Grails"/></title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon">
        <link rel="apple-touch-icon">
        <link rel="apple-touch-icon" sizes="114x114">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
        <g:layoutHead/>
        <r:layoutResources />
    </head>
    <body>
        <div id="grailsLogo" role="banner"><a href="#"><img src="${resource(dir: 'images', file: 'parroquia.jpg')}" alt="Grails" height="120px" width="500px"/></a></div>

        <div id="header">
            <div id="menu">
                <nav id="nav">
                    <ul id="navigation">
                        <li><a class="home" href="/laparroquia/">Inicio</a>
                        <li><a href="#">Admin Ventas &raquo;</a>
                            <ul>
                                <li><g:link controller='Venta'>Ordenes</g:link></li>
                            </ul>               
                        </li>
                        <li><a href="#">Almacen &raquo;</a>
                            <ul>
                                <li><g:link controller='proveedor'>Proveedor</g:link></li>
                                <li><g:link controller='producto'>Productos</g:link></li>
                                <li><g:link controller='refresco'>Refrescos</g:link></li>
                                <li><g:link controller='vino'>Vinos</g:link></li>
                                <li><g:link controller='barril'>Barriles</g:link></li>
                                <li><g:link controller='cerveza'>Cervezas</g:link></li>
                            </ul>               
                        </li>
                        <li><a href="#">Administrador &raquo;</a>
                            <ul>
                                <li><g:link controller='user'>Usuario</g:link></li>
                                <li><g:link controller='userRole'>Rol</g:link></li>Skip to content…
                            </ul>               
                        </li>
                        <sec:ifLoggedIn>
                        <li><g:link class="last" controller='logout'>Salir | </g:link></li>
                        </sec:ifLoggedIn>
                        <sec:ifNotLoggedIn>
                                <li><g:link class="last" controller='login' action='auth'>Entrar |</g:link></li>
                        </sec:ifNotLoggedIn>
                    </ul>
                </nav>
            </div>
        </div>

        <div id="container">
            <div id="page">
                <br>
                <g:layoutBody/>
            </div>
        </div>  
        <div class="footer" role="contentinfo"> Bar La Parroquia, Actopan Hidalgo, CP 42500.</div>
        <!-- <div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div> -->
        <g:javascript library="application"/>
        <r:layoutResources />
    </body>
</html>