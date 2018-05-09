<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manter Notas e Frequencia do Aluno</title>
    </head>
    <body>
        <h1>Manter Notas e Frequencia do Aluno</h1>
        <form action="ManterAlunoNotaFrequenciaController?acao=confirmarOperacao" method="post">
            <table>
                <tr>
                    <td>
                        Disciplina:
                    </td>
                    <td colspan="3">
                        ${avaliacao.turma.disciplina.nome}
                        <input type="hidden" name="txtCodTurma" value="${avaliacao.turma.codTurma}"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        Matrícula:
                    </td>
                    <td>
                        <input type="text" value="${avaliacao.aluno.matricula}" name="txtMatricula" readonly />
                    </td>
                    <td>
                        Aluno:
                    </td>

                    <td>
                        ${avaliacao.aluno.nome}
                    </td>
                </tr>
                <tr>
                    <td>
                        Número de Faltas:
                    </td>
                    <td colspan="3">
                        <input type="text" name="txtNumFaltas" value="${avaliacao.numFaltas}"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        Nota 01:
                    </td>
                    <td>
                        <input type="text" name="txtNota1" value="${avaliacao.nota1}"/>
                    </td>
                    <td>
                        Nota 02:
                    </td>
                    <td>
                        <input type="text" name="txtNota2" value="${avaliacao.nota2}"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        Nota Prova Final:
                    </td>
                    <td colspan="3">
                        <input type="text" name="txtNotaProvaFinal" value="${avaliacao.notaProvaFinal}"/>
                    </td>
                </tr>
                <tr>
                    <td align="left" colspan="2">
                        <input type="button" id="voltar" name="voltar" value="Voltar" onClick="history.go(-1)"/>
                    </td>
                    <td colspan="2">
                    </td>
                    <td align="right">
                        <input type="hidden" name="pesquisa" id="pesquisa" value="Todas"/>
                        <input type="submit" name="consultar" value="Confirmar"/>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>




