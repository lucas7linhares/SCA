package dao;

import java.sql.SQLException;
import java.util.List;
import model.Horario;
import model.Professor;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

public class HorarioDAO {

    public static void gravarHorario(Horario horario) throws SQLException, ClassNotFoundException {
        Transaction tx = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            Transaction transaction = session.beginTransaction();
            tx = session.getTransaction();
            session.save(horario);
            if (!transaction.wasCommitted()) {
                transaction.commit();
            }
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public static void excluirHorario(Horario horario) throws SQLException, ClassNotFoundException {
        Transaction tx = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            Transaction transaction = session.beginTransaction();
            tx = session.getTransaction();
            session.delete(horario);
            if (!transaction.wasCommitted()) {
                transaction.commit();
            }
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public static List<Horario> obterHorarios() throws ClassNotFoundException, SQLException {
        Transaction tx = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Horario> horarios = null;
        try {
            Transaction transaction = session.beginTransaction();
            tx = session.getTransaction();
            horarios = session.createCriteria(Professor.class).list();
            if (!transaction.wasCommitted()) {
                transaction.commit();
            }
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
            return horarios;
        }
    }

    public static List<Horario> obterHorariosPorTurma(int codTurma) throws ClassNotFoundException, SQLException {
        Transaction tx = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Horario> horarios = null;
        try {
            Transaction transaction = session.beginTransaction();
            tx = session.getTransaction();
            horarios = session.createQuery("from Horario where codTurma=" + codTurma).list();
            if (!transaction.wasCommitted()) {
                transaction.commit();
            }
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
            return horarios;
        }
    }

    public static void editarHorario(Horario horario) throws SQLException, ClassNotFoundException {
        Transaction tx = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            Transaction transaction = session.beginTransaction();
            tx = session.getTransaction();
            session.update(horario);
            if (!transaction.wasCommitted()) {
                transaction.commit();
            }
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
    }
}
