package org.vny;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class MessageService {
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Message msg = new Message();
		msg.setFromUname("vny.anan");
		msg.setToUname("praveen.p");
		// msg.setMessage("Hi Praveen");
		new MessageService().deleteMessage(msg);
	}

	public void insertMessage(Message msg) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		try {
			tx = session.getTransaction();
			tx.begin();
			session.saveOrUpdate(msg);
			tx.commit();
		} catch (Exception ex) {
			System.out.println(ex);
			if (tx != null) {
				tx.rollback();
			}
		} finally {
			session.close();
		}
	}

	public void deleteMessage(Message msg) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<Message> mesgs = null;
		Message mesg = null;
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("from Message where fromUname =" + "'" + msg.getFromUname()
					+ "' AND toUname =" + "'" + msg.getToUname() + "' AND message =" + "'" + msg.getMessage() + "'");
			mesgs = (List<Message>) query.list();
			mesg = session.get(Message.class, mesgs.get(0).getMsg_id());
			session.delete(mesg);
			tx.commit();
		} catch (Exception ex) {
			System.out.println(ex);
			if (tx != null) {
				tx.rollback();
			}
		} finally {
			session.close();
		}
	}

	public List<Message> getMessagesByUserName(String toUSN) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<Message> messages = null;
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("from Message where toUname =" + "'" + toUSN + "'");
			messages = (List<Message>) query.list();

			session.getTransaction().commit();
		} catch (Exception ex) {
			if (tx != null) {
				tx.rollback();
			}
		} finally {
			session.close();
		}
		return messages;
	}
}
