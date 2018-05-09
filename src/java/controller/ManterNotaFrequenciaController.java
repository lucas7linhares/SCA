package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Avaliacao;
import model.AvaliacaoId;
import model.Turma;

public class ManterNotaFrequenciaController extends HttpServlet {

    private Turma turma;
    List<Avaliacao> avaliacoes;
    List<AvaliacaoId> avaliacaoIds;

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
            request.setAttribute("turma", Turma.obterTurma(codTurma));

            avaliacoes = Avaliacao.obterAvaliacoesPorTurma(codTurma);
            request.setAttribute("avaliacoes", avaliacoes);

            RequestDispatcher view = request.getRequestDispatcher("/manterNotaFrequencia.jsp");
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
        String operacao = request.getParameter("operacao");
        int codCurso = Integer.parseInt(request.getParameter("txtCodCurso"));
        String nome = request.getParameter("txtNomeCurso");
        int cargaHoraria = Integer.parseInt(request.getParameter("txtCargaHoraria"));
        String tipoCurso = request.getParameter("optTipoCurso");
        int totalPeriodos = Integer.parseInt(request.getParameter("txtTotalPeriodos"));
        int coordenador = Integer.parseInt(request.getParameter("optCoordenador"));

       
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
