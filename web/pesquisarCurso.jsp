<%-- 
    Document   : consulta
    Created on : 20/11/2012, 08:10:11
    Author     : Heleno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta</title>
    </head>
    <body>
        <table border="1">
            <tr>
                <th>
                    Cod. Curso
                </th>
                
                <th>
                    Nome Curso
                </th>
                
                <th>
                    Ações
                </th>
            </tr>
            
            <c:forEach items="${cursos}" var="curso">
                <tr>
                    <td>
                        ${curso.codCurso}
                    </td>
                    
                    <td>
                        ${curso.nome}
                    </td>
                    
                    <td>
                        <a href="ManterCursoController?acao=prepararOperacao&operacao=editar&codCurso=${curso.codCurso}">Alterar</a>
                        <a href="ManterCursoController?acao=prepararOperacao&operacao=excluir&codCurso=${curso.codCurso}">Excluir</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        
        <table>
            <tr>
                             
                <td>
                    <input type="button" id="voltar" value="Voltar" onClick="history.go(-1)"/>
                </td>
                
                <td>
                    <form action="manterCursoController?acao=prepararOperacao&operacao=incluir" method="post">
                        <input type="submit" id="incluiNovo" value="Incluir Novo"/>
                    </form>
                </td>
            </tr>
        </table>
        
    </body>
</html>
