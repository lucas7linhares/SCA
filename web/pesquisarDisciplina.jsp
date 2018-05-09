<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pesquisar Disciplinas</title>
    </head>
    <body>
        <h1>Pesquisar Disciplinas</h1>
        
        <form action="PesquisarDisciplinaController?filtro=1" method="post">
            <fieldset style="width: 50%">
                <legend>Filtrar por:</legend>
                <table>
                    <tr>
                        <td>
                            Curso
                        </td>

                        <td>
                            <select id="curso" name="curso">
                                <option value="0">
                                    Todos
                                </option>
                                <c:forEach items="${cursos}" var="curso">
                                    <option value="${curso.codCurso}" <c:if test="${cursoFiltro==curso.codCurso}">selected</c:if>>
                                        ${curso.nome}
                                    </option>
                                </c:forEach>
                            </select>
                        </td>

                        <td>
                            Nome Disciplina
                        </td>

                        <td>
                            <input type="text" id="nomeDisciplina" name="disciplina" value="${nomeFiltro}"/>
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
                    Cod. Disciplina
                </th>
                
                <th>
                    Nome Disciplina
                </th>
                
                <th>
                    Ações
                </th>
            </tr>
            
            <c:forEach items="${disciplinas}" var="disciplina">
                <tr>
                <td>
                    ${disciplina.codDisciplina}
                </td>
                    
                <td>
                    ${disciplina.nome}
                </td>
                
                <td>
                    <a href="ManterDisciplinaController?acao=prepararOperacao&operacao=editar&codDisciplina=${disciplina.codDisciplina}">Alterar</a>
                    <a href="ManterDisciplinaController?acao=prepararOperacao&operacao=excluir&codDisciplina=${disciplina.codDisciplina}">Excluir</a>
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
                    <form action="ManterDisciplinaController?acao=prepararOperacao&operacao=incluir" method="post">
                        <input type="submit" id="incluiNovo" value="Incluir Novo"/>
                    </form>
                </td>
            </tr>
        </table>
    </body>
</html>
