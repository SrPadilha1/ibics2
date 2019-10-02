package util;

import classes.Comentario;
import classes.Denuncia;
import classes.Postagem;
import classes.Usuario;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

public class HibernateUtil {

//    private static final SessionFactory sessionFactory;
//    static {
//        try {
//            sessionFactory = new AnnotationConfiguration()
//                    .configure().buildSessionFactory();
//        } catch (Throwable ex) {
//            // Log exception!
//            throw new ExceptionInInitializerError(ex);
//        }
//    }
//
//    public static Session getSession()
//            throws HibernateException {
//        return sessionFactory.openSession();
//    }
    
    private static SessionFactory factory;

    static {
        AnnotationConfiguration cfg = new AnnotationConfiguration();
        cfg.configure();
        cfg.addAnnotatedClass(Postagem.class);
        cfg.addAnnotatedClass(Usuario.class);
        cfg.addAnnotatedClass(Comentario.class);
        cfg.addAnnotatedClass(Denuncia.class);
        factory = cfg.buildSessionFactory();
    }

    public static Session getSession() {
        return factory.openSession();
    }
}