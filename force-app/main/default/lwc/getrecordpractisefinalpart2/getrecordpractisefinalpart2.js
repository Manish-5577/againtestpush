import { LightningElement,wire } from 'lwc';
import { getRecord} from "lightning/uiRecordApi"; 
import { ShowToastEvent } from "lightning/platformShowToastEvent";
const FIELDS = ["Contact.Name", "Contact.Phone", "Contact.Email"];
export default class Getrecordpractisefinalpart2 extends LightningElement {
    datas;
   @wire(getRecord,{recordId: "0035j00001EgWNTAA3",fields: FIELDS,optionalFields:["Contact.finacialyearcheck__c"]})
   Contactrecord({ error, data }) {
    if (error) {
        console.log(error);
      let message = "Unknown error";
      if (Array.isArray(error.body)) {
        message = error.body.map((e) => e.message).join(", ");
      } else if (typeof error.body.message === "string") {
        message = error.body.message;
      }
      this.dispatchEvent(
        new ShowToastEvent({
          title: "Error loading contact",
          message,
          variant: "error",
        }),
      );
    } 
     if (data) {
      this.datas = data;
      console.log('testing');
     console.log(data);
     console.log('testing2');
     
    //   this.name = this.contact.fields.Name.value;
    //   this.phone = this.contact.fields.Phone.value;
    }
  }

get name()
{  //this.data = this.Contactrecord.data;
  //  console.log('this data==>'+this.Contactrecord.data);
   // console.log('this.dat===>'+this.datas.fields.LastName.value);
//    Note :: Name field is not available when u mentioned layout its only  available in field 
      console.log('name==>'+this.datas.fields.Name.value);
    return this.datas.fields.Name.value;
}
get phone()
{ 
    return this.datas.fields.Phone.value;
}
get email()
{    
    console.log(this.Contactrecord);
    console.log(JSON.stringify(this.Contactrecord));
    return this.datas.fields.Email.value;
}
get financialyear()
{
  return this.datas.fields.finacialyearcheck__c.value;
}
}