
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<
Document   : index
Created on : 04/01/2016, 00:07:38
Author     : Ramon
--%>
<html>

    <!DOCTYPE html>

    <head>

        <title>TESTE JAVA PLENO</title>

        <style type="text/css">

            body {
                font-family: Verdana;
                margin: 0;
                padding: 0;
                text-align: center;
                color: #333;
                background:  #000;
                min-width: 940px;


            }

            #menu{
                font-family: Impact, "Arial Black", sans-serif;
                color: #696969;
                text-transform: uppercase;
                font-size: 20px;
                width: 100%;
                position: fixed;
                top: 0;
                left: 0;
                background: #000000;
                padding: 10px;
                padding: .5rem;
                margin: 0 0 0px 0;

            }

            #GPS {
                height: 800px;
                width: 100%;
                background-color: #1E90FF;
            }

            #Cadastro {
                padding-top:0px;
                height: 700px;
                width: 100%;
                background-color: #1C86EE;
            }

            #ListarPontos {
                height:915px;
                width:100%;
                padding-top:0px;
                background: #5F9EA0;
            }

            #creditos {
                height:400px;
                width:100%;
                padding-top:0px;
                background: #FFF;
                text-color: #000;
            }


            a:link, a:visited {
                color:#696969;
                text-decoration: none;
            }

            a:hover {
                color: #CD5C5C;
                text-decoration: none;

            }

            #Titulo{
                font-size: 100px;
                text-align: center;
                padding-top: 12px;
            }

        </style>




        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
        <script type="text/javascript">// <![CDATA[
            $(document).ready(function() {
            function filterPath(string) {
            return string
                    .replace(/^\//, '')
                    .replace(/(index|default).[a-zA-Z]{3,4}$/, '')
                    .replace(/\/$/, '');
            }
            $('a[href*=#]').each(function() {
            if (filterPath(location.pathname) = += filterPath(this.pathname)
                    && location.hostname = += this.hostname
                    && this.hash.replace(/#/, '')) {
            var $targetId = $(this.hash), $targetAnchor = $('[name=' + this.hash.slice(1) + ']');
            var $target = $targetId.length ? $targetId : $targetAnchor.length ? $targetAnchor : false;
            if ($target) {
            var targetOffset = $target.offset().top;
            $(this).click(function() {
            $('html, body').animate({scrollTop: targetOffset}, 300);
            return false;
            });
            }
            }
            });
            });

        </script>
    </head>
    <body>

        <div id=menu>
            <a href="#GPS" >GPS</span></a>
            <a href="#Cadastro">Cadastro</span></a>
            <a href="#ListarPontos">Listar Pontos</span></a>
            <a href="#creditos">Coordenada D-max</span></a>
        </div>

        <div id="GPS">
            <div id="Titulo">Bem vindo Avaliador do Teste</div>
            SEJA MUITO BEM VINDO AO SISTEMA DE AMOSTRA DE GPS - TESTE PLENO ZUP IT </br> 

        </div>

        <div id="Cadastro">
            <div id="Titulo">Cadastro</div>
            Formulário de Cadastro Pontos do GPS</br>
            <body>
                <h2>Formulário</h2>
            <f:view xmlns:h="http://xmlns.jcp.org/jsf/html" xmlns:f="http://xmlns.jcp.org/jsf/core">

                <form action="gravalocais.jsp" method="post">

                    <label>Local<label><br>

                            <input type="text" name="local" size="30"/><br>

                            <label>Coordenada X: </label><br>

                            <input type="text" name="cordenadaX" size="11"/><br>

                            <label>Coordenada Y: </label><br>

                            <input type="text" name="cordenadaY" size="11"/><br>

                            <p><input  accesskey="o" type="submit" name="btnOK" value="Cadastra Registros">

                                <input  accesskey="c" type="reset" name="btnCancelar" value="Limpar"></p>

                            </form>
                            <p><a href="#GPS" >voltar ao topo</span></a></p>
                            </div>
                            <div id="ListarPontos">
                                <div id="Titulo">Listar Pontos</div>
                                </br> Listar Pontos </br>
                                <sql:query var="result" dataSource="bd_gps">
                                    SELECT * FROM locais
                                </sql:query>

                                <table border="1" align="center" >
                                    <!-- column headers -->
                                    <tr>
                                        <c:forEach var="columnName" items="${result.columnNames}">
                                            <th><c:out value="${columnName}"/></th>
                                            </c:forEach>
                                    </tr>
                                    <!-- column data -->
                                    <c:forEach var="row" items="${result.rowsByIndex}">
                                        <tr>
                                            <c:forEach var="column" items="${row}">
                                                <td><c:out value="${column}"/></td>
                                            </c:forEach>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </div>
                            <a href="#Cadastro" >voltar ao topo</span></a>
                            </div>
                            <div id="creditos">
                                <div id="Titulo">D-max = X20, Y10</div>
                                <sql:query var="result" dataSource="bd_gps">
                                    SELECT * FROM locais where cordenadaX >= 10 and cordenadaY <=12 and cordenadaY <>2
                                </sql:query>

                                <table border="1"  align="center">
                                    <!-- column headers -->
                                    <tr>
                                        <c:forEach var="columnName" items="${result.columnNames}">
                                            <th><c:out value="${columnName}"/></th>
                                            </c:forEach>
                                    </tr>
                                    <!-- column data -->
                                    <c:forEach var="row" items="${result.rowsByIndex}">
                                        <tr>
                                            <c:forEach var="column" items="${row}">
                                                <td><c:out value="${column}"/></td>
                                            </c:forEach>
                                        </tr>
                                    </c:forEach>
                                </table>
                                <p><a>Ramon Jose de Sant'Anna</a></p>
                                <p><a>e-mail: santannaramon@gmail.com  </a></br></p>

                                <a href="#GPS" >voltar ao topo</span></a>
                            </div>
                            </body>
                            </html>
