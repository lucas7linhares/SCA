<%-- 
    Document   : relatorioProfessorTitulacao
    Created on : 13/05/2013, 08:45:22
    Author     : José Augusto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Emtir Relatório de professores</title>
    </head>
    <body>
        <h1>Emtir Relatório de professores</h1>
        
        <form action="RelatorioProfessorController?acao=confirmarOperacao" method="post">
            <select name="titulacao">
                <option value="" >
                                Selecione uma titulação
                            </option>
                            <option value="graduacao">
                                Graduação
                            </option>
                            
                            <option value="especializacao" >
                                Especialização
                            </option>
                            
                            <option value="mestrado" >
                                Mestrado
                            </option>
                            
                            <option value="doutorado">
                                Doutorado
                            </option>
            </select>
            <input type="submit" value="Emitir">
        </form>
    </body>
</html>
