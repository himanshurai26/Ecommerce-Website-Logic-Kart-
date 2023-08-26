
function add_to_card(pid, pname, pprice, ){
    localStorage.getItem("cart");
    
    if(cart == null){
        
        //not card 
        
        let products=[];
       let product={productId:pid,productName:pname,productQuantity:1,prductPrice:pprice}
      products.push(product);
      localStorage.setItem("cart", JSON.stringify(products));
      
   
    
    
    }else{
        
        // card is already present
    }
    
}

