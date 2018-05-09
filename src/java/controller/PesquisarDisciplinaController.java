/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Curso;
import model.Disciplina;

/**
 *
 * @author Heleno
 */
public class PesquisarDisciplinaController extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        try {
           int filtro = Integer.parseInt(request.getParameter("filtro"));
           request.setAttribute("cursos", Curso.obterCursos());
           
           if( filtro==1){
               int curso = Integer.parseInt(request.getParameter("curso"));
               String nomeDisciplina = request.getParameter("disciplina");
               if((curso == 0 ) && (nomeDisciplina==null || nomeDisciplina.equals("")) ){
                request.setAttribute("disciplinas", Disciplina.obterDisciplinas());
               }else{
                    if(curso!=0 && !nomeDisciplina.equals("")){
                        request.setAttribute("disciplinas", Disciplina.obterDisciplinasPorCursoENome(curso,nomeDisciplina));
                        request.setAttribute("cursoFiltro", curso);
                        request.setAttribute("nomeFiltro", nomeDisciplina);
                    }else if(curso!=0){
                        request.setAttribute("disciplinas", Disciplina.obterDisciplinasPorCurso(curso));
                        request.setAttribute("cursoFiltro", curso);
                    }else if(!nomeDisciplina.equals("")){
                        request.setAttribute("disciplinas", Disciplina.obterDisciplinasPorNome(nomeDisciplina));
                        request.setAttribute("nomeFiltro", nomeDisciplina);
                    }
               }
           }else{
               request.setAttribute("disciplinas", Disciplina.obterDisciplinas());
           }
               
           
           
           RequestDispatcher view = request.getRequestDispatcher("/pesquisarDisciplina.jsp");
           view.forward(request,response);
           
        } catch(ClassNotFoundException ex) {            
           ex.printStackTrace(); 
        }catch(SQLException ex) {            
           ex.printStackTrace(); 
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
