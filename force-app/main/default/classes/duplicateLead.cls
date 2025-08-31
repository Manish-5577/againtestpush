public class duplicateLead {

@AuraEnabled    
    public static List<lead> duplicateLeads(string recordId)
    {
        lead ll = [select id,name,lastname,phone,email from lead where id =:recordId];
        string lastnames,phones,emails;
        lastnames = ll.lastname; phones = ll.Phone; emails =ll.Email;
        System.debug('lastname'+ll.lastname);System.debug('lastname'+ll.Phone);System.debug('lastname'+ll.Email);
        list<lead> llc = [select id,name,phone,email,lastname from lead where lastname =:lastnames and phone =: phones and email =: emails];
        return llc;
    }
}