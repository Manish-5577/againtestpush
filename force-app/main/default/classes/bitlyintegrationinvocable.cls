public class bitlyintegrationinvocable {

    
    @invocableMethod(label='Shorten URL' description='Genertae short url with bitly API')

    public static void shorten(list<id> courseIds){

        shortenFuture(courseIds);

    }

    @future(callout=true)

    public static void shortenFuture(list<id> courseIds){

        list<Course__c> courselist = [SELECT Id,Name,Course_URL__c from Course__c where id in:courseIds  ];

        bitlyIntegrationandFlow bservice = new bitlyIntegrationandFlow();

        for(Course__c course : courselist){

        string fullURL = course.Course_URL__c;

  /*          if(course.Coupon_Code__c!=null){

            fullURL = fullURL +'?couponCode='+course.Coupon_Code__c;

               

            }*/

            string shorturl = bservice.shorten(fullURL);
system.debug('shorturl is==>'+shorturl);
            course.short_Url__c = shorturl;

        }

        if(courselist.size()>0){

        update courselist;     

        }

    }
    
}