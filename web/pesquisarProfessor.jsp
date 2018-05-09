<%-- 
    Document   : pesquisarDisciplina
    Created on : 20/11/2012, 08:36:21
    Author     : Heleno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pesquisar Professor</title>
    </head>
    <body>
        <h1>Pesquisar Professor</h1>
        
        <form action="PesquisarProfessorController" method="post">
            <fieldset style="width: 50%">
                <legend>Pesquisar por:</legend>
                <table>
                    <tr>
                        <td>
                            Nome Professor
                        </td>

                        <td>
                            <input type="text" id="nomeProfessor" name="busca"/>
                        </td>

                        <td>
                            <input type="submit" id="Pesquisar" value="Pesquisar"/>
                        </td>

                    </tr>
                </table>
            </fieldset>
        </form>
        <br/>
        
        <table border="1">
            <tr>
                <th>
                    Matrícula
                </th>
                
                <th>
                    Nome Professor
                </th>
                
                <th>
                    Ações
                </th>
            </tr>
            <c:if test="${empty professores}">
                <tr>
                    <td colspan="3" align="center">
                        Nenhum resultado encontrado
                    </td>
                </tr>
            </c:if>
            <c:forEach items="${professores}" var="professor">
                <tr>
                    <td>
                        ${professor.matricula}
                    </td>
                    
                    <td>
                        ${professor.nome}
                    </td>
                    
                    <td>
                        <a href="ManterProfessorController?acao=prepararOperacao&operacao=editar&matricula=${professor.matricula}">Alterar</a>
                        <a href="ManterProfessorController?acao=prepararOperacao&operacao=excluir&matricula=${professor.matricula}">Excluir</a>
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
                    <form action="ManterProfessorController?acao=prepararOperacao&operacao=incluir" method="post">
                        <input type="submit" id="incluiNovo" value="Incluir Novo"/>
                    </form>
                </td>
            </tr>
        </table>
    </body>
</html>
