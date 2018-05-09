<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Documento sem título</title>
    </head>
    <body>
        <h1>PESQUISAR ALUNO</h1>
        Nome: <input type="text"><input type="button" value="pesquisar">
                <form action="ManterAlunoController?acao=prepararOperacao&operacao=Incluir" method="post">
                    <table border>

                        <tr>
                            <td>MATRICULA</td><td>NOME DO ALUNO</td><td colspan="5">AÇÕES</td>
                        </tr>
                        <c:forEach items="${alunos}" var="aluno">
                            <tr>
                                <td><c:out value="${aluno.matricula}" /></td>
                                <td><c:out value="${aluno.nome}" /></td>
                                <td><a href="ManterAlunoController?acao=prepararOperacao&operacao=Editar&matricula=<c:out value="${aluno.matricula}"/>">Consultar</a></td>
                                <td><a href="ManterAlunoController?acao=prepararOperacao&operacao=Editar&matricula=<c:out value="${aluno.matricula}"/>">Editar</a></td>
                                <td><a href="ManterAlunoController?acao=prepararOperacao&operacao=Excluir&matricula=<c:out value="${aluno.matricula}"/>">Excluir</a></td>
                                <td><a href="ManterMatriculaController?acao=prepararOperacao&operacao=Incluir&matricula=<c:out value="${aluno.matricula}"/>">Matricular</a></td>
                                <td><a href="ConsultarNotaFrequenciaController?acao=prepararOperacao&matricula=<c:out value="${aluno.matricula}"/>">Consultar Nota e Frequecia</a></td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td><input type="button" name="btnVoltar" value="Voltar" onclick="javascript:history.back(-1)" /></td><td colspan="3"><a href="index.jsp"/></td>
                            <td><input type="submit" name="btnIncluir" value="Incluir" /></td>
                        </tr>
                    </table>
                </form>
                </body>
                </html>