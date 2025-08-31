trigger duplicatecheck on Contact (before insert,after update) {

    if(trigger.isbefore && trigger.isinsert){
        if(!recursionavoid.recursive){
       aftertriggerhandler.duplicatecon(trigger.new);
        }
        
    }
    if(trigger.isafter && trigger.isupdate){
        aftertriggerhandler.afterupdateoncontact(trigger.new);
       
    }
      
      
      
      
      
      
      
      /*
    string lastnme=''; string email = '';integer count =0;
    for(contact cc :trigger.new){
        lastnme = cc.LastName;
        email = cc.Email;
    }
    
    
  List<contact> cc = [select id,lastname,email from contact ];
    for(contact kk : cc){
        if( (kk.email == email)  && kk.lastname == lastnme){
            
            count++;
        }
    }
    if(count >0 ){
      
           trigger.new[0].adderror('duplicate exist !!!!!!!!!!!!');
        
    }
    
    */
    
    
    
    
}