
package com.ecommerce.dao;

import com.ecommerce.entities.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

/**
 *
 * @author Himanshu Kumar
 */
public class UserDao {
    private SessionFactory factory;

    public UserDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    //get user by email and password
    
    public User getUserByEmailAndPassword(String Email, String Password){
        
        User user = null;
        
        try{
            
            String query = "from User where userEmail =: e and userPassword=: p";
            Session session = this.factory.openSession();
           Query q = session.createQuery(query);
            q.setParameter("e", Email);
            q.setParameter("p", Password);
            
          user =(User) q.uniqueResult();
           
            session.close();
        }
        catch(Exception e){
           e.printStackTrace();
        }
        
        return user;
    }
    
    
}
