package dao;

import util.HibernateUtil;
import java.sql.SQLException;
import java.util.List;
import model.Turma;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class TurmaDAO {

    public static void gravar(Turma turma) throws ClassNotFoundException, SQLException {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.beginTransaction();
        session.save(turma);
        transaction.commit();
    }

    public static void alterar(Turma turma) throws ClassNotFoundException, SQLException {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.beginTransaction();
        session.update(turma);
        transaction.commit();
    }

    public static void excluir(Turma turma) throws ClassNotFoundException, SQLException {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.beginTransaction();
        session.delete(turma);
        transaction.commit();
    }

    public static Turma obterTurma(int codTurma) throws ClassNotFoundException, SQLException {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Turma turma = (Turma) session.load(Turma.class, codTurma);
        return turma;
    }

    public static List<Turma> obterTurmas() throws ClassNotFoundException, SQLException {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        //List<Turma> turmas = session.createCriteria(Turma.class).list();
        List<Turma> turmas = session.createQuery("from Turma").list();
        return turmas;
    }
}