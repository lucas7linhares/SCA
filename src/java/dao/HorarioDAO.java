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
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.beginTransaction();
        session.save(horario);
        transaction.commit();
    }

    public static void excluirHorario(Horario horario) throws SQLException, ClassNotFoundException {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.beginTransaction();
        session.delete(horario);
        transaction.commit();
    }

    public static List<Horario> obterHorarios() throws ClassNotFoundException, SQLException {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List<Horario> horarios = session.createCriteria(Professor.class).list();
        return horarios;
    }
    
    public static List<Horario> obterHorariosPorTurma(int codTurma) throws ClassNotFoundException, SQLException {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List<Horario> horarios = session.createQuery("from Horario where codTurma="+codTurma).list();
        return horarios;
    }

    public static void editarHorario(Horario horario) throws SQLException, ClassNotFoundException {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.beginTransaction();
        session.update(horario);
        transaction.commit();
    }
}
