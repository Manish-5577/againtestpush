public class deserializationapexx {
    
    
    public static void sendrequesttopostal(string office)
    {
        
        
        string endPoint='https://api.postalpincode.in/postoffice/';
        endPoint = endPoint + office;
        Http h1=new Http();
        HttpRequest req1=new HttpRequest();
        HttpResponse hresp1=new HttpResponse();
        //req1.setHeader('Authorization','Bearer '+accToken);
        req1.setHeader('Content-Type','application/json');
        //req1.setHeader('Accept','application/json');
        req1.setMethod('GET');
        req1.setEndpoint(endPoint);
        integer mm= 0;
        hresp1=h1.send(req1);
        system.debug(hresp1.getBody());
        list<Object> m = (list<Object>)JSON.deserializeUntyped(hresp1.getBody());
        List<postainfo> pp = new list<postainfo> ();        
        Map<string,object> mm1 = (map<string,object>)m[0];       
        list<object> kk = ( list<object>)mm1.get('PostOffice'); 
        for(object hh : kk)
        {
            Map<string,object> mmp =  (Map<string,object>)hh;
            string kk1 = (string)mmp.get('PINCode');
            system.debug('string value is ==>'+kk1);
            postainfo pp1 = new postainfo((string)mmp.get('Name'),(string)mmp.get('Description'),(string)mmp.get('Pincode'),(string)mmp.get('BranchType'),(string)mmp.get('DeliveryStatus'),(string)mmp.get('Circle'),(string)mmp.get('District'),(string)mmp.get('Division'),(string)mmp.get('Region'),(string)mmp.get('State'),(string)mmp.get('Country'));
            pp.add(pp1);
        }
        
    }
    public class postainfo{
        
        public string  name;
        public string  Description;
        public string  PINCode;
        public string   BranchType;
        public string  DeliveryStatus;
        public string  circle;
        public string District;
        public string  Division;
        public string Region;
        public string State;
        public string Country;
        
        postainfo(string name,string description,string pincode,string branchtype,string deliverystatus,string circle,string district,string division,string region,string state,string country){
            
            this.name = name;
            this.Description =description;
            this.pincode = pincode;
            this.branchtype = branchtype;
            this.DeliveryStatus  = deliverystatus;
            this.circle = circle;
            this.District = district;
            this.Division = division;
            this.Region = region;
            this.state = state;
            
            this.country = country;
        }
    }
}