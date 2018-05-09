<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pesquisar Professor Por Curso</title>
    </head>
    <body>
        <h1>Pesquisar Professor Por Curso</h1>
        <form action="PesquisarProfessorPorCursoController?acao=confirmarOperacao" method="post" name="PesquisarProfessorPorCurso">
            <table>
                <tr>
                    <td>Curso:</td> 
                    <td>
                        <select name="optCurso">
                            <option value="0"></option>  
                            <c:forEach items="${cursos}" var="curso">
                                <option value="${curso.codCurso}" <c:if test="${curso.codCurso == codCurso}"> selected </c:if>>${curso.nome}</option>  
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="button" name="btnVoltar" value="Voltar" onclick="javascript:history.back(-1)" />
                    <td colspan="2">
                    </td>
                    <td>
                        <input type="submit" value="Buscar">
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <c:if test="${acao == 'confirmarOperacao'}">
                            <table border>
                                <tr>
                                    <td>
                                        Código do Professor
                                    </td>
                                    <td>
                                        Nome do Professor
                                    </td>
                                    <td>
                                        Ação
                                    </td>
                                </tr>
                                <c:forEach items="${professores}" var="professor">
                                    <tr>
                                        <td>
                                            ${professor.matricula}
                                        </td>
                                        <td>
                                            ${professor.nome}
                                        </td>
                                        <td>
                                            <a href="ManterProfessorController?acao=prepararOperacao&operacao=Editar&matricula=<c:out value="${professor.matricula}"/>">Editar</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <tr>
                                    <td>
                                        <input type="button" name="btnVoltar" value="Voltar" onclick="javascript:history.back(-1)" />
                                    </td>
                                    <td colspan="3"></td>
                                </tr>
                            </table>
                        </c:if>
                    </td>
                </tr>
            </table>
        </form>     
    </body>
</html>
