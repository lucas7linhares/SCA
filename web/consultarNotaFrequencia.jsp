<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar Notas e Frequencia</title>
    </head>
    <body>
        <h1>Consultar Notas e Frequencia</h1>
        <form action="ConsultarNotaFrequenciaController?acao=confirmarOperacao&matricula=${aluno.matricula}"method="post">
            <table>
                <tr>
                    <td>
                        Aluno:
                    </td>

                    <td>
                        ${aluno.nome}
                    </td>    
                </tr>

                <tr>
                    <td>
                        Listar:
                    </td>

                    <td>
                        <input type="radio" id="filtro" name="filtro" checked="" value="Todas" onClick="desabilita(this)">Todas
                    </td>

                    <td>
                        <input type="radio" id="filtro" name="filtro" value="Ano/Semestre" onClick="desabilita(this)">Ano/Semestre
                    </td>
                </tr>

                <tr>
                    <td>
                        Ano:
                    </td>

                    <td>
                        <select id="ano" disabled="" name="ano">
                            <option value="2013">2013</option>
                            <option value="2012">2012</option>
                            <option value="2011">2011</option>
                            <option value="2010">2010</option>
                            <option value="2009">2009</option>
                            <option value="2008">2008</option>
                            <option value="2007">2007</option>
                        </select>
                    </td>

                    <td>
                        Semestre:
                    </td>

                    <td>
                        <select id="semestre" disabled="" name="semestre">
                            <option value="1">1</option>
                            <option value="2">2</option>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td align="left" colspan="2">
                        <input type="button" id="voltar" name="voltar" value="Voltar" onClick="history.go(-1)"/>
                    </td>

                    <td align="right" colspan="2">
                        <input type="hidden" name="pesquisa" id="pesquisa" value="Todas"/>
                        <input type="submit" id="consultar" name="consultar" value="Consultar"/>
                    </td>
                </tr>
            </table>
        </form>


        <table border="1">
            <tr>
                <th>Cod. Disciplina</th>
                <th>Periodo</th>
                <th>Disciplina</th>
                <th>Frequencia</th>
                <th>Nota 1</th>
                <th>Nota 2</th>
                <th>Media</th>
                <th>Nota Prova Final</th>
                <th>Nota Final</th>
                <th>Resultado Final</th>
            </tr>
            <c:forEach items="${avaliacoes}" var="avaliacao">
                <tr>
                    <td>${avaliacao.turma.disciplina.codDisciplina}</td>
                    <td>${avaliacao.turma.disciplina.periodo}</td>
                    <td>${avaliacao.turma.disciplina.nome}</td>
                    <td>${avaliacao.numFaltas}</td>
                    <td>${avaliacao.nota1}</td>
                    <td>${avaliacao.nota2}</td>
                    <td>${(avaliacao.nota1 + avaliacao.nota2)/2}</td>
                    <td>${avaliacao.notaProvaFinal}</td>
                    <td>
                        <c:if test="${((avaliacao.nota1 + avaliacao.nota2)/2) ge avaliacao.notaProvaFinal}">${((avaliacao.nota1 + avaliacao.nota2)/2)}</c:if>
                        <c:if test="${((avaliacao.nota1 + avaliacao.nota2)/2) < avaliacao.notaProvaFinal}">60</c:if>
                    </td>
                    <td><c:if test="${not empty(avaliacao.nota1) and not empty(avaliacao.nota2)}">    
                            <c:if test="${avaliacao.notaProvaFinal eq 0 or empty(avaliacao.notaProvaFinal)}">
                                <c:if test="${((avaliacao.nota1 + avaliacao.nota2)/2) ge 60}">APROVADO</c:if>
                                <c:if test="${((avaliacao.nota1 + avaliacao.nota2)/2) < 40}">REPROVADO</c:if>
                                <c:if test="${((avaliacao.nota1 + avaliacao.nota2)/2) < 60 and ((avaliacao.nota1 + avaliacao.nota2)/2) ge 40}">PROVA FINAL</c:if>
                            </c:if>
                            <c:if test="${avaliacao.notaProvaFinal > 0}">
                                <c:if test="${avaliacao.notaProvaFinal ge 60}">APROVADO</c:if>
                                <c:if test="${avaliacao.notaProvaFinal < 60}">REPROVADO</c:if>
                            </c:if>
                        </c:if>
                    </td>

                </tr>
            </c:forEach>
        </table>
    </body>

    <script language="JavaScript">
                    //<!---
                    function desabilita(radio) {
                        if (radio.value == "Todas") {
                            document.getElementById("ano").setAttribute("disabled", true);
                            document.getElementById("semestre").setAttribute("disabled", true);
                            document.getElementById("pesquisa").setAttribute("value", "Todas");
                        } else {
                            document.getElementById("ano").removeAttribute("disabled");
                            document.getElementById("semestre").removeAttribute("disabled");
                            document.getElementById("pesquisa").setAttribute("value", "Ano");
                        }

                        return true;
                    }
                    //--->
    </script>
</html>




