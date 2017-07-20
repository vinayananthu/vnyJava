package org.vny;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

public class DataInsertion {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//new DataInsertion().insertInfo("vny.anan","password","Vinay","Ananthu");
		//User user = new DataInsertion().getUserInfo();
		//System.out.println("UserName:"+user.getUser_name());
		//Boolean val = new DataInsertion().validatePassword("vny.ananth","Password2");
		//System.out.println(val);
	}

	public void insertInfo(User user) {
		// SessionFactory sessionFactory = new
		// Configuration().configure().buildSessionFactory();
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		try {
			tx = session.getTransaction();
			tx.begin();
			session.saveOrUpdate(user);
			tx.commit();
		} catch (Exception ex) {
			System.out.println(ex);
			if (tx != null) {
				tx.rollback();
			}
		} finally {
			session.close();
		}
		// sessionFactory.close();

		/*
		 * Configuration con = new Configuration();
		 * con.configure("hibernate.cfg.xml"); SessionFactory sF =
		 * con.buildSessionFactory(); Session session = sF.openSession();
		 * 
		 * 
		 * Transaction TR = session.beginTransaction(); session.save(user);
		 */
	}
	
	public User getUserInfo() {
		// SessionFactory sessionFactory = new
		// Configuration().configure().buildSessionFactory();
		// Session session = sessionFactory.openSession();
		// session.beginTransaction();
		// session.save(user); Session session = HibernateUtil.openSession();
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		User user = null;
		try {
			tx = session.getTransaction();
			tx.begin();
			user = session.get(User.class, 2);
			tx.commit();
		} catch (Exception ex) {
			if (tx != null) {
				tx.rollback();
			}
		} finally {
			session.close();
		}
		// sessionFactory.close();
		return user;
	}
	
	public Boolean validatePassword(String usn, String pwd) {
		  User user = getUserByUserName(usn);     
		  
		  CryptoSecurity crypto = new CryptoSecurity();
		  String encPassword = crypto.encryptPassword(pwd);
		  System.out.println(encPassword+"DataInsertion");
	        if(user!=null && user.getUser_name().equals(usn) && user.getPassword().equals(encPassword)){
	            return true;
	        }else{
	            return false;
	        }
	
	}
	
	public Boolean checkUserNameExists(String usn) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<User> users = null;
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("from User where user_name =" + "'" + usn + "'");
			users = (List<User>) query.list();
			tx.commit();
		} catch (Exception ex) {
			if (tx != null) {
				tx.rollback();
			}
		} finally {
			session.close();
		}

		if (users.size() != 0) {
			return false;
		} else {
			return true;
		}
	}
	
	public User getUserByUserName(String uname) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<User> users = null;
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("from User where user_name =" + "'" + uname + "'");
			users = (List<User>) query.list();

			session.getTransaction().commit();
		} catch (Exception ex) {
			if (tx != null) {
				tx.rollback();
			}
		} finally {
			session.close();
		}
		return users.get(0);

	}
	
	 public List<User> getListOfUsers(){
	        List<User> list = new ArrayList<User>();
	        Session session = HibernateUtil.openSession();
	        Transaction tx = null;       
	        try {
	            tx = session.getTransaction();
	            tx.begin();
	            list = session.createQuery("from User").list();                       
	            tx.commit();
	        } catch (Exception e) {
	            if (tx != null) {
	                tx.rollback();
	            }
	            e.printStackTrace();
	        } finally {
	            session.close();
	        }
	        return list;
	    }

}