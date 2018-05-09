<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar Professor</title>
    </head>
    <body>
        <h1>Consultar Professor</h1>
        
        <table>
            <tr>
                <td>
                    Ano:
                </td>
                
                <td>
                    <input type="text" id="ano" name="ano">
                </td>  
                
                <td>
                    Semestre:
                </td>
                
                <td>
                    <input type="text" id="semestre" name="semestre">
                </td>  
            </tr>
            
            <tr>
                <td>
                    Curso:
                </td>
                
                <td>
                    <select id="curso" name="curso">
                        <option value="">
                            Selecione um curso.
                        </option>
                    </select>
                </td>
                
               
            </tr>
            
            <tr>
                    <td align="left" colspan="2">
                        <input type="button" id="voltar" name="voltar" value="Voltar" onClick="history.go(-1)"/>
                    </td>
                    
                    <td align="right" colspan="2">
                        <input type="button" id="consultar" name="consultar" value="Consultar"/>
                    </td>
            </tr>
        </table>
        
        <table border="1">
            <tr>
                <th>
                    Cod. Disciplina
                </th>
                
                <th>
                    Periodo
                </th>
                
                <th>
                    Disciplina
                </th>
                
                <th>
                    Professor
                </th>
                
               
                    
                    
            </tr>
        </table>
    </body>
</html>
