
package controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Avaliacao;
import model.AvaliacaoId;


public class ManterAlunoNotaFrequenciaController extends HttpServlet {

    Avaliacao avaliacao;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acao = request.getParameter("acao");
        if (acao.equals("confirmarOperacao")) {
            confirmarOperacao(request, response);
        } else if (acao.equals("prepararOperacao")) {
            prepararOperacao(request, response);
        }
    }
    
    public void prepararOperacao(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        try {

            int codTurma = Integer.parseInt(request.getParameter("codTurma"));
            int matricula = Integer.parseInt(request.getParameter("matricula"));
            
            AvaliacaoId avaliacaoId = new AvaliacaoId(matricula, codTurma);
            
            avaliacao = Avaliacao.obterAvaliacao(avaliacaoId);
            request.setAttribute("avaliacao", avaliacao);
            
            
            
            RequestDispatcher view = request.getRequestDispatcher("/manterAlunoNotaFrequencia.jsp");
            view.forward(request, response);

        } catch (ServletException e) {
            throw e;
        } catch (IOException e) {
            throw new ServletException(e);
        } catch (SQLException e) {
            throw new ServletException(e);
        } catch (ClassNotFoundException e) {
            throw new ServletException(e);
        }
    }

    public void confirmarOperacao(HttpServletRequest request, HttpServletResponse response) throws ServletException {
         int codTurma = Integer.parseInt(request.getParameter("txtCodTurma"));
        int matricula = Integer.parseInt(request.getParameter("txtMatricula"));
        float nota1 = 0;
        float nota2 = 0;
        int numFaltas = 0;
        float notaProvaFinal = 0;
        if(!request.getParameter("txtNota1").equals("")){
            nota1 = Float.parseFloat(request.getParameter("txtNota1"));
        }
        
        if(!request.getParameter("txtNota2").equals("")){
            nota2 = Float.parseFloat(request.getParameter("txtNota2"));
        }
        
        if(!request.getParameter("txtNumFaltas").equals("")){
            numFaltas = Integer.parseInt(request.getParameter("txtNumFaltas"));
        }
        
        if(!request.getParameter("txtNotaProvaFinal").equals("")){
            numFaltas = Integer.parseInt(request.getParameter("txtNumFaltas"));
        }
        
        if(!request.getParameter("txtNotaProvaFinal").equals("")){
            notaProvaFinal = Float.parseFloat(request.getParameter("txtNotaProvaFinal"));
        }
        
        try {
            avaliacao.setNota1(nota1);
            avaliacao.setNota2(nota2);
            avaliacao.setNumFaltas(numFaltas);
            avaliacao.setNotaProvaFinal(notaProvaFinal);
            avaliacao.alterar();
            RequestDispatcher view = request.getRequestDispatcher("ManterNotaFrequenciaController?acao=prepararOperacao&codTurma="+codTurma);
            view.forward(request, response);

        } catch (IOException e) {
            throw new ServletException(e);
        } catch (SQLException e) {
            throw new ServletException(e);
        } catch (ClassNotFoundException e) {
            throw new ServletException(e);
        } catch (ServletException e) {
            throw e;
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
