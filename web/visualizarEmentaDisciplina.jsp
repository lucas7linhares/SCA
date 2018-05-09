<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vizualizar Ementa da Disciplina</title>
    </head>
    <body>
        <h1>Vizualizar Ementa da Disciplina</h1>
        <table>
            <tr>
                <td>Curso:</td> 
                <td>
                    ${disciplina.curso.nome}
                </td>
            </tr>
            <tr>
                <td>Disciplina:</td> 
                <td>
                    ${disciplina.nome}
                </td>
            </tr>
            <tr>
                <td colspan="2">Ementa</td>
            </tr>
            <tr>
                <td colspan="2">
                    <textarea>
                        ${disciplina.ementa}
                    </textarea>
                </td>
            </tr>
        </table>
                <input type="button" name="btnVoltar" onclick="javascript:history.back(-1)" value="Voltar"/>
    </body>
</html>
