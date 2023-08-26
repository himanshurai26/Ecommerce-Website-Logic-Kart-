
package com.ecommerce.dao;

import com.ecommerce.entities.Category;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;


public class CategoryDao {
    private SessionFactory factory;

    public CategoryDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    public int saveCategory(Category cate){
       
       Session session = this.factory.openSession();
   Transaction tx = session.beginTransaction();
       
  int catId = (int) session.save(cate);
   
   tx.commit();
   
       session.close();
      
       return catId;
       
           
   
}
    
   public List<Category> getCategories()
   {
       Session ses = this.factory.openSession();
   Query query = ses.createQuery("from Category");
 List<Category> list = query.list();
 
 return list;
   }
   
   
   
   public  Category getCategoryById(int cId)
   {
       
       Category cat = null;
       try{
           
           Session catsession = this.factory.openSession();
         cat = catsession.get(Category.class, cId);
      
         catsession.close();
           
           
       }catch(Exception e){
           e.printStackTrace();
       }
       
       
       return cat;
       
   }
   
    
    
}
