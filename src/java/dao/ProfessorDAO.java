/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.SQLException;
import java.util.List;
import model.Professor;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

/**
 *
 * @author Heleno
 */
public class ProfessorDAO {

    public static void gravarProfessor(Professor professor) throws SQLException, ClassNotFoundException {
        Transaction tx = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            Transaction transaction = session.beginTransaction();
            tx = session.getTransaction();
            session.save(professor);
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

    public static void excluirProfessor(Professor professor) throws SQLException, ClassNotFoundException {
        Transaction tx = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            Transaction transaction = session.beginTransaction();
            tx = session.getTransaction();
            session.delete(professor);
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

    public static List<Professor> obterProfessores() throws ClassNotFoundException, SQLException {
        Transaction tx = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Professor> professores = null;
        try {
            Transaction transaction = session.beginTransaction();
            tx = session.getTransaction();
            professores = session.createCriteria(Professor.class).list();
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
            return professores;
        }
    }

    public static List<Professor> obterProfessoresPorNome(String nomeProfessor) throws ClassNotFoundException, SQLException {
        Transaction tx = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Professor> professores = null;
        try {
            Transaction transaction = session.beginTransaction();
            tx = session.getTransaction();
            professores = session.createQuery("from Professor where nome like'%" + nomeProfessor + "%'").list();
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
            return professores;
        }
    }

    public static Professor obterProfessor(int matricula) throws ClassNotFoundException, SQLException {
        Transaction tx = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        Professor professor = null;
        try {
            Transaction transaction = session.beginTransaction();
            tx = session.getTransaction();
            professor = (Professor) session.load(Professor.class, matricula);
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
            return professor;
        }
    }

    public static void editarProfessor(Professor professor) throws SQLException, ClassNotFoundException {
        Transaction tx = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            Transaction transaction = session.beginTransaction();
            tx = session.getTransaction();
            session.update(professor);
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
