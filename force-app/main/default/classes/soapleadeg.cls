Global class soapleadeg {

    
    
    webservice  static string createNewLead(string leadFirstName,string leadLastName,string LeadCompanyName,string leadEmail,string leadphone){
        try{
            Lead ld = new lead();
            ld.FirstName = leadFirstName;
            ld.LastName = leadLastName;
            ld.Company  = LeadCompanyName;
            ld.Email    = leadEmail;
            ld.Phone    = leadphone;
            insert ld;
            system.debug('id s');
            return ld.id;
        }
        catch(exception ex){
            exceptionhandling.handle(ex,'webservice soapleadeg');
            return 'Error during processing';
        }
    
}
}