import { LightningElement,api} from 'lwc';

export default class Configurationntest extends LightningElement {
@api recordId;
    @api test1;
    @api test2;
   
    contact = [{name:"mani",phone:"838383",email:"mani@dkjd.com"},
        {name:"mani22",phone:"8399",email:"mani@dd.com"},
        {name:"mani33",phone:"83874755",email:"mhhf@dkjd.com"},
        {name:"mani44",phone:"8382321",email:"mewew@dkjd.com"},
        {name:"mani55",phone:"838459459",email:"mcjksdjk@dkjd.com"},
        {name:"mani55",phone:"838459459",email:"mcjksdjk@dkjd.com"}]
}