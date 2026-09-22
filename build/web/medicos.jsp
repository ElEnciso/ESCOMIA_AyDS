<%-- 
    Document   : medicos
    Created on : 17 sep 2026, 1:51:44 p.m.
    Author     : elencios
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="conexion.Base"%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Médicos</title>
        <link rel="stylesheet" href="css/estilos.css">
        <link rel="icon" href="img/sepa.jpg"/>
    </head>
    <body>
        <header>
            <jsp:include page="navbar.jsp"/>
        </header>
        <main class="container">
            <div class="tittle">
                <h1 class="section-heading">Médicos</h1>
            </div>
            
            <div class="descripcion card-panel">
                <%
                    Base bd = new Base();
                    ResultSet rs = null;
                    try {
                        bd.conectar();
                %>
                
                <table id="medicos">
                    <thead>
                        <tr><th>Nombre</th><th>Apellido</th><th>Cédula</th></tr>
                    </thead>
                    <tbody>
                        <%
                            rs = bd.consulta("SELECT * FROM Medico");
                            while (rs.next()) {
                        %>
                        <tr>
                            <td><%=rs.getString(3)%></td><td><%=rs.getString(4)%></td><td><%=rs.getString(5)%></td>
                        </tr>
                        <%
                            } rs.close();
                        %>
                    </tbody>
                </table>
            
                <%
                    bd.cierraConexion();
                    } catch (Exception ex) {
                        out.print("<div style='background-color: #f8d7da; color: #721c24; padding: 20px; border-radius:5px; margin-top:20px;'>❌ Error de BD: " + ex.toString() + "</div>");
                    }
                %>
            </div>
        </main>
    </body>
</html>
