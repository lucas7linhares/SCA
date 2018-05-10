/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
    public static void gravarProfessor(Professor professor) throws SQLException, ClassNotFoundException{
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.beginTransaction();
        session.save(professor);
        transaction.commit();
        session.close();
    }
    
     public static void excluirProfessor(Professor professor) throws SQLException, ClassNotFoundException{
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.beginTransaction();
        session.delete(professor);
        transaction.commit();
        session.close();
    }
    
    public static List<Professor> obterProfessores() throws ClassNotFoundException, SQLException{
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List<Professor> professores = session.createCriteria(Professor.class).list();
        session.close();
        return professores;
        
    }
    
    public static List<Professor> obterProfessoresPorNome(String nomeProfessor) throws ClassNotFoundException, SQLException{
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List<Professor> professores = session.createQuery("from Professor where nome like'%"+nomeProfessor+"%'").list();
        session.close();
        return professores;
    }
    
    public static Professor obterProfessor(int matricula) throws ClassNotFoundException, SQLException{
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Professor professor = (Professor) session.load(Professor.class, matricula);
        session.close();
        return professor;
    }
    
     public static void editarProfessor(Professor professor) throws SQLException, ClassNotFoundException{
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.beginTransaction();
        session.update(professor);
        transaction.commit();
        session.close();
    }
    
    
    
}
