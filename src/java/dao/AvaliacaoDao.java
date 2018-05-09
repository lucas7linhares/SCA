package dao;

import java.sql.SQLException;
import java.util.List;
import model.Avaliacao;
import model.AvaliacaoId;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

public class AvaliacaoDao {

    public static void gravarAvaliacao(Avaliacao avaliacao) throws SQLException, ClassNotFoundException {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.beginTransaction();
        session.save(avaliacao);
        transaction.commit();
    }

    public static void editarAvaliacao(Avaliacao avaliacao) throws SQLException, ClassNotFoundException {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.beginTransaction();
        session.update(avaliacao);
        transaction.commit();
    }

    public static void excluirAvaliacao(Avaliacao avaliacao) throws SQLException, ClassNotFoundException {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.beginTransaction();
        session.delete(avaliacao);
        transaction.commit();
    }

    public static List<Avaliacao> obterAvaliacoesPorAluno(int matricula) throws ClassNotFoundException, SQLException {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List<Avaliacao> avaliacoes = session.createQuery("from Avaliacao where matriculaAluno=" + matricula).list();
        return avaliacoes;
    }

    public static List<Avaliacao> obterAvaliacoesPorTurma(int codTurma) throws ClassNotFoundException, SQLException {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List<Avaliacao> avaliacoes = session.createQuery("from Avaliacao where codTurma=" + codTurma).list();
        return avaliacoes;
    }

    public static Avaliacao obterAvaliacao(AvaliacaoId avaliacaoId) throws SQLException, ClassNotFoundException {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Avaliacao avaliacao = (Avaliacao) session.load(Avaliacao.class, avaliacaoId);
        return avaliacao;
    }
}
