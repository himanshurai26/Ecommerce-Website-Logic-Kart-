
package com.ecommerce.helper;


public class Helper {
    
    public static String get15Word(String desc){
        
        String[] str = desc.split(" ");
  
        if(str.length > 15){
            String res = "";
            for(int i=0; i<15; i++){
                res = res = res + str[i] + " ";
            }
            
            return (res+ "...");
        }else{
            return (desc + "...");
        }
    }
    
}
