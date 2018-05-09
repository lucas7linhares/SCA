<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pesquisar Notas e Frequencia</title>
    </head>
    <body>
        <h1>Pesquisar Notas e Frequencia</h1>
        
        <table border="1">
            <tr>
                <th>
                   Matricula
                </th>
                
                <th>
                    Nome
                </th>
                              
                <th>
                    Ações
                </th>
            </tr>
        </table>
        
        <table>
            <tr>
                 
                <td>
                    <input type="button" id="voltar" value="Voltar" onClick="history.go(-1)"/>
                </td>
                
                <td>
                    <form action="manterNotasEFrequencia.jsp">
                        <input type="submit" id="incluiNovo" value="Incluir Novo"/>
                    </form>
                </td>
            </tr>
            
            
        </table>
    </body>
</html>
