import { LightningElement,wire,track } from 'lwc';
import { getRecord} from "lightning/uiRecordApi"; 
import { ShowToastEvent } from "lightning/platformShowToastEvent";

export default class Getrecordpractisefinal extends LightningElement {
  @track datas;
  
  @wire(getRecord, { recordId: "0035j00001DCIAVAA5", layoutTypes: ["Full"], modes: ["Edit"] })
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
        } else if (data) {
          this.datas = data;
         console.log(data);
          console.log('name value ==>'+data.fields.LastName.value);
        //   this.name = this.contact.fields.Name.value;
        //   this.phone = this.contact.fields.Phone.value;
        }
      }

    get name()
    {  //this.data = this.Contactrecord.data;
      //  console.log('this data==>'+this.Contactrecord.data);
        console.log('this.dat===>'+this.datas.fields.LastName.value);
        return this.datas.fields.LastName.value;
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
    handleClick()
    {
        alert('contact record '+this.Contactrecord);
        console.log(JSON.stringify(this.Contactrecord));
    }

}