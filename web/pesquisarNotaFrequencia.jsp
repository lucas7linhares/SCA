<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pesquisar Nota Frequência</title>
    </head>
    <body>
        <h1>Pesquisar Nota Frequência</h1>
        <form action="PesquisarNotaFrequenciaController?acao=confirmarOperacao" method="post" name="frmPesquisarNotaFrequencia">
            <table>
                <tr>
                    <td>Professor:</td> 
                    <td>
                        <select name="optProfessor">
                            <option value="0"></option>  
                            <c:forEach items="${professores}" var="professor">
                                <option value="${professor.matricula}" <c:if test="${professor.matricula == matricula}"> selected </c:if>>${professor.nome}</option>  
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
                                        Disciplina
                                    </td>
                                    <td>
                                        Período
                                    </td>
                                    <td>
                                        Ano / Semestre
                                    </td>
                                    <td>
                                        Ação
                                    </td>
                                </tr>
                                <c:forEach items="${turmas}" var="turma">
                                    <tr>
                                        <td>
                                            ${turma.disciplina.nome}
                                        </td>
                                        <td>
                                            ${turma.disciplina.periodo}
                                        </td>
                                        <td>
                                            ${turma.ano} / ${turma.semestre}
                                        </td>
                                        <td>
                                            <a href="ManterNotaFrequenciaController?codTurma=${turma.codTurma}&acao=prepararOperacao">Editar</a>
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
