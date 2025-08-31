trigger eventtest on notification_test__e (after insert) {


for(notification_test__e ne : trigger.new)
{

contact cc = new contact();
cc.lastname = 'createdby platformevent';
cc.email = 'platccccformevent@gmail.com';
cc.phone = '23123123';
insert cc;

}
}