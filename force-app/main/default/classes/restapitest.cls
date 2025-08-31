public class restapitest {
    
  
    public static response  calltesting(string lastname, string firstname,string salutation, 
                                        string mediaOutlet, string usoutside, string areaofEnquiry,
                                        string email, string phone, string deadline, string mediarequest )
    {
        response res;
        try{
            
            if(!string.isblank(email) &&   (!string.isblank(firstname)   || (!string.isblank(lastname)))   &&   !string.isblank(mediaOutlet) 
               &&  !string.isblank(areaofEnquiry)  &&  !string.isblank(mediarequest))
            {   
                list<Requestor__c>  Exstreq =  [select id,email__c,phone__c from Requestor__c where mediaoutlet__c =: mediaOutlet and email__c =:email limit 1 ];
                if(Exstreq.size() >0 )
                {
                    try{
                        media_request__c medreq = new media_request__c();
                        medreq.mediaissue__c =  mediarequest;
                        medreq.areaofenquiry__c = areaofEnquiry;
                        medreq.Requestor__c = Exstreq[0].id;
                        insert medreq;
                        media_request__c medreqrec = [select id,name from media_request__c where id =: medreq.id];
                        res = new response('success','',medreqrec.name );
                    }
                    catch(exception ex){
                        // **********************need to mention for which field issue occured
                        res = new response('failed','Unable to process request'+ ex.getmessage() ,''  );
                        return res;
                    }
                    
                }else{
                    try{
                        // do we need to rollback transaction think on it ????yes required 
                        Requestor__c reqs = new Requestor__c();
                        reqs.Saluation__c = salutation;
                        reqs.firstname__c = firstname;
                        reqs.lastname__c =  lastname;
                        reqs.mediaoutlet__c = mediaOutlet;
                        reqs.email__c = email;
                        reqs.phone__c = phone;
                        insert reqs;
                        
                        media_request__c medreq = new media_request__c();
                        medreq.mediaissue__c =  mediarequest;
                        medreq.areaofenquiry__c = areaofEnquiry;
                        medreq.Requestor__c = reqs.id;
                        insert medreq;
                        system.debug(medreq);
                        media_request__c medreqrec = [select id,name from media_request__c where id =: medreq.id limit 1];
                        res = new response('success','' , medreqrec.Name);
                    }
                    catch(exception ex)
                    {
                        res = new response('failed','Oops Something went happen'+ ex.getmessage() , '');
                        return res;
                    }   
                }
                
            }
            else {
                string missingfield = '';
                if(string.isblank(email) )
                {
                    missingfield += 'email' + ',';
                }
                if(string.isblank(firstname) && string.isblank(lastname))
                {
                    missingfield += 'firstName' + ' ' + 'lastName';
                }
                
                if(string.isblank(mediaOutlet))
                {
                    missingfield += 'mediaOutlet';
                }
                if(string.isblank(areaofEnquiry))
                {
                    missingfield += 'areaofEnquiry'; 
                }
                if(string.isblank(mediarequest))
                {
                    missingfield += 'mediarequest';
                }
                res = new response('failed' ,'required fields are missing '+ missingfield.removeEnd(','), '');
               return res;
            }
        }
        catch (exception ex)
        {
            res = new response('failed', 'Oops somthing went wrong'+ ex.getmessage() + ex.getLineNumber(),'');
        }
        return res;
    }
    
    public class response
    {
        public string status;
        public string mssg;
        public string requestId;
        public response(string status, string mssg ,string requestid)
        {
            this.status = status;
            this.mssg = mssg;
            this.requestId = requestid;
        }
    }
}