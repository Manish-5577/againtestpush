trigger leadtrigger on Lead (after insert) {

    list<account> acclist = new list<account>();
for(integer i = 0 ; i< 251;i++)
{
    if(i < 201)
    {
        account acc = new account();
        acc.rating = 'cold';
        acc.name = 'i '  + i + 'abcd';
        acclist.add(acc);
    }
    else
    {
        account acc = new account();
        acc.rating = 'hot';
        acc.name = 'i '  + i + 'abcd';
        acclist.add(acc);
    }
    
}
    system.debug('hureeeeee');
}