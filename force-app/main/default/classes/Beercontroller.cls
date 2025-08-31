public class Beercontroller {
/*
    @Auraenabled(cacheable= true)
    public static list<sobject> fetchbeerrecord(string searchterm)
    {
        
        string finalsearch = '%' + searchterm + '%';
        string querys  ='';
        if(searchterm != null)
        { 
            querys = 'SELECT Id, Name, CreatedDate, LastModifiedDate, Alcohol__c, Id__c, Image__c, Price__c, Tags__c, Total_Quantity__c, brewery_Name__c, brewery_id__c, Consumed_Quantity__c, Remaining_Quantity__c FROM Beer__c where name like : finalsearch limit 50 ';
        }
        else {
            querys = 'SELECT Id, Name, CreatedDate, LastModifiedDate, Alcohol__c, Id__c, Image__c, Price__c, Tags__c, Total_Quantity__c, brewery_Name__c, brewery_id__c, Consumed_Quantity__c, Remaining_Quantity__c FROM Beer__c limit 50';
        }
       return  database.query(querys);
        
    }
    public static string generateCardId()
    {
        string charlist = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNLOPQRSTUVWXYZ0123456789_';
        integer position ;
        integer lengthrequired = 30;
        string res = '';
        for(integer i =0; i<= lengthrequired;i++)
        {
            position = Integer.valueof(String.valueof(Math.roundToLong(Charlist.length()*Math.random())))-1;
            res += charlist.substring(position,position+1);
        }
        return res;
    }
    
    public static string getcouponinfo(string name)
    {
        coupon__c cc = [select id,name,Price__c from coupon__c where expired__c = false and name =:name];
        return cc.Id;
    }
    @AuraEnabled(cacheable=false)
    public static string getcardid()
    {
        list<cart__c> cartinfo = [select id,name from cart__c where user__C =: userinfo.getuserId() and cart_status__c = 'open' and is_active__c = true];
        if(cartinfo != null && cartinfo.size() >0)
        {
            list<cart_item__c> cc = [select id,name,beer__c, cart__C,item_quantity__c,item_amount__C from cart_item__c where cart__C =: cartinfo[0].id];
            integer cartquuanity =0;
            for(cart_item__c dd : cc)
            {
                cartquuanity = cartquuanity + integer.valueof(dd.Item_Quantity__c);
            }
            string cartitem ='';
          wrappercart   wc = new wrappercart();
wc.count = cartquuanity ;
wc.cartid =cartinfo[0].id;
            wc.items = cc;
            return  JSON.serialize(wc);
           
        }
        else {
            cart__c defaultcart = new cart__c();
            string coupinid = getcouponinfo('default');
            defaultcart.cart_id__c = generateCardId();
            defaultcart.cart_status__c = 'open';
            defaultcart.is_active__c = true;
            defaultcart.coupon__c = coupinid;
            defaultcart.user__C = userinfo.getuserId();
            insert defaultcart;
              wrappercart  wc = new wrappercart();
            wc.count = 0;
            wc.cartid = defaultcart.Id;
            wc.items = null;
            
            return JSON.serialize(wc);
        }
    }
    @Auraenabled
    public static string createcartitem(string cartid, string beerid,decimal amount)
    {   system.debug('cartid ==>'+cartid+ 'beerid===>'+beerid+ 'amount!!!=>'+amount);
         map<id,cart_item__c> cartitemm = getbeercafrtitem(cartid);
          cart_item__c item  = new cart_item__C();
        if(cartitemm.containskey(beerid))
        {         
             item = cartitemm.get(beerid);
            system.debug('item !@@@@==>'+item);
            system.debug('item quantity---*'+item.Item_Quantity__c);
            item.Item_Quantity__c = item.Item_Quantity__c +1;
            item.Item_Amount__c = item.Item_Amount__c + amount;
            update item;
        }
        else {
      
        item.beer__C = beerid;
        item.Cart__c = cartid;
        item.Item_Quantity__c = 1;
        item.Item_Amount__c = Amount;
        insert  item;
        }
        return item.id;
        
    }
    
    public static map<id,cart_item__c>   getbeercafrtitem(string cartid)
    {system.debug('cartid!!!***===>'+cartid);
           map<id,cart_item__c> jj = new map<id,cart_item__c>();
        for(cart_item__c  ss : [select id,beer__c,cart__C,item_quantity__c, item_amount__c from cart_item__c where cart__c =:cartid])
        {
            jj.put(ss.beer__c,ss);
        }
     system.debug('jj==>'+jj);
        return jj;
    }
    @auraenabled(cacheable=true)
    public static  list<cart_item__c> getcartitem(string cartid)
    {system.debug('cartid'+cartid);
        list<cart_item__c> ll = [select id, Beer__r.Total_Quantity__c,Beer__r.Price__c,Beer__r.Name,Item_Quantity__c,item_amount__c from cart_item__c where Cart__c =: cartid];
        return ll;
    }
    public class wrappercart
    {
        @auraenabled
        public string cartid;
        @auraenabled
        public integer count;
            @auraenabled 
            public list<cart_item__c> items;
    }
    @Auraenabled
    public static coupon__c couponinfo(string name)
    {
        coupon__c cc = getcouponinformation(name);
        return cc;
    }
    
    public static coupon__c getcouponinformation(string name)
    {
        coupon__c rr = [select id,name,price__c from coupon__c where expired__c = false and (remaining_quantity__c> 0 or name = 'default') and name =:name];
        return rr;
    }
    @auraenabled
    public static list<Address_Book__c> getaddressforloginuser()
    {
        list<Address_Book__c> adb = [SELECT Id, City__c, Country__c, Postal_Code__c, State__c, Street__c, User__c, CreatedDate, Name FROM Address_Book__c where user__c != '' and user__c =: userinfo.getuserid()];
   return adb;
    }
    
    
    @auraenabled
    public static void saveaddress(string adressdata)
    {try{
        Address_Book__c ab = (Address_Book__c)JSON.deserialize(adressdata,Address_Book__c.class);
        ab.User__c  = userinfo.getuserid();
        insert ab;
    }
     catch(exception ee)
     {
         throw new AuraHandledException(ee.getMessage());
     }
        
    }
    @auraenabled
    public static order__c createorderr(string cartid, string selectedaddressid, decimal totalAmount)
    {
        
        order__C oo =  new order__C();
        oo.User__c = userinfo.getuserid();
        oo.Cart__c = cartid;
        oo.Shipping_Address__c = selectedaddressid;
        oo.subTotal__c = totalAmount;
        insert oo;
        return oo;
        
    }
    
    
    */
    
    
}