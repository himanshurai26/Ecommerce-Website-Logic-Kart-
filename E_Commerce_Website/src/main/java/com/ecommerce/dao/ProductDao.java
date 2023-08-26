
package com.ecommerce.dao;

import com.ecommerce.entities.Product;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;


public class ProductDao {
    private SessionFactory factory;

    public ProductDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    public boolean saveProduct(Product product){
       boolean f = false;
        try{
           
         Session session = this.factory.openSession();
          Transaction tnx = session.beginTransaction();
            
            session.save(product);
          
          
          
          
          
          tnx.commit();
          session.close();
          
          f= true;
            
        }
        catch(Exception e){
            e.printStackTrace();
            f=false;
        }
        
        return f;
    }
    
    
    //get all product
    ;
    public List<Product> getAllProduct()
    {
        Session sesion = this.factory.openSession();
   Query query = sesion.createQuery("from Product");
    List<Product> list = query.list();
          
    return list;
    }
    
    public List<Product> getAllProductById(int cateId){
        
        Session session = this.factory.openSession();
        Query query = session.createQuery("from Product as p where p.category.categoryId= :id");
       query.setParameter("id", cateId);
        List<Product> list = query.list();
        
        return list;
    }
    
}
