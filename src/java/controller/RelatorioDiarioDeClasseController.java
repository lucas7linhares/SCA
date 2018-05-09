/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.BD;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.view.JasperViewer;

/**
 *
 * @author José Augusto
 */
public class RelatorioDiarioDeClasseController extends HttpServlet {

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
        String acao = request.getParameter("acao");
        
        if(acao.equals("prepararOperacao")){
           prepararOperacao(request,response);
        } else {
            if(acao.equals("confirmarOperacao")){
                confirmarOperacao(request,response);
            }
        }
    }
    
    public void prepararOperacao(HttpServletRequest request, HttpServletResponse response) throws ServletException{
        RequestDispatcher view = request.getRequestDispatcher("/diarioDeClasse.jsp");
        try {
            view.forward(request, response);
        } catch (IOException ex) {
            throw new ServletException(ex);
        }
    }
    
    public void confirmarOperacao(HttpServletRequest request, HttpServletResponse response) throws ServletException{
        Connection conexao = null;
        try {
            conexao = BD.getConexao();
            HashMap parametros = new HashMap();
            parametros.put("PAR_codTurma", Integer.parseInt(request.getParameter("txtCodTurma")));
            String relatorio = getServletContext().getRealPath("/WEB-INF/classes/report")+"/diarioProfessor.jasper";
            JasperPrint jp = JasperFillManager.fillReport(relatorio, parametros, conexao);
            byte[] relat = JasperExportManager.exportReportToPdf(jp);
            response.setHeader("Content-Disposition", "attachment;filename=diarioProfessor.pdf");
            response.setContentType("application/pdf");
            response.getOutputStream().write(relat);
        } catch (SQLException ex) {
            throw new ServletException(ex);
        } catch (ClassNotFoundException ex) {
            throw new ServletException(ex);
        } catch (JRException ex) {
            throw new ServletException(ex);
        } catch (IOException ex) {
            throw new ServletException(ex);
        } finally {
            try {
                if (!conexao.isClosed()) {
                    conexao.close();
                }
            } catch (SQLException ex) {
            }
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
