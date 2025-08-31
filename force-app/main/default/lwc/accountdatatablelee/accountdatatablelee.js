import { LightningElement,wire,track,api } from 'lwc';
import fetchaccount from '@salesforce/apex/accountdatatablecall.fetchaccount'
import { getRecord } from "lightning/uiRecordApi";
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { getRelatedListCount } from "lightning/uiRelatedListApi";
import wrapperacccon from '@salesforce/apex/wrapperdataaccconopp.wrapperacccon'
import Id from "@salesforce/schema/Case.Id";
import AccountId from "@salesforce/schema/Case.AccountId";
import contactstatus from '@salesforce/schema/Case.Contact.check_today_birthday_or_not__c'
import Status	 from "@salesforce/schema/Case.Status";


const column = [ { label: 'Name', fieldName: 'Name' },
    { label: 'Phone', fieldName: 'Phone' },
    { label: 'Type', fieldName: 'Type' },
    { label: 'Rating', fieldName: 'Rating' },
    {
        type: "button", label: 'View', initialWidth: 100, typeAttributes: {
            label: 'View',
            name: 'View',
            title: 'View',
            disabled: false,
            value: 'view',
            iconPosition: 'left',
            iconName:'utility:preview',
            variant:'Brand'
        }

},
{ type : 'button', label : 'huree@@@@', typeAttributes : {
    label : "huree@@@@",
    name : "huree@@@@",
    title : "huree@@@@",
    disabled : false,
    value : 'huree@@@@',
    iconName:'utility:preview',
    variant:'Brand'

}}
    ]
   
export default class Accountdatatablelee extends LightningElement {
wrapperdata;
contactt = [];
mouseoverboolean = false;
    case;
columnsss = column;
@track dataas;
@api recordId;
selectedrecid = '';
// @wire(fetchaccount)
// abc({data,error})
// {
//     if(data)
//     {
//          this.dataas = data;
//     }
//     else if(error)
//     {
//         console.log('errro occured');
//           console.log(error);
//     }
// }
@wire(wrapperacccon)
fetchdedata({data,error})
{
    if(data)
    {console.log('wrapperdeata')
        console.log(data)
         this.wrapperdata = data//JSON.parse(JSON.stringify(data));
    }
    else if(error)
    {
        console.log('erooro tankk');
        console.log(error);

    }
}
handlecontact(event)
{ //event.preventDefault();
    console.log(event);
//this.mouseoverboolean = true;
}
handleopportunity(event)
{   console.log(JSON.stringify(event.target.id));
    let words = JSON.stringify(event.target.id).split("-");
    let testt= words[0].substring(1,19);
    console.log(this.wrapperdata)
    const res = this.wrapperdata.find((item) =>{ 
        console.log(item);
        console.log(item.acc.Id);
        return (item.acc.Id).valueOf() === testt.valueOf();
});
console.log(res);
console.log(res.opp);
this.contactt = res.opp;
this.mouseoverboolean = true;
console.log('logoic test@@@@');
   // this.mouseoverboolean = false;
}
hideModalBox()
{
    this.mouseoverboolean = false;
}
// @wire(getRecord, { recordId: "500J4000009H78JIAS", fields: [Id,AccountId, contactstatus,Status]})
// accountRecord({data,error})
// {
//     if(data)
//     {
//         console.log('hureeeeww!!@@nnjjhhh')
//         this.case = data;
//     //     console.log(data)
//     //   console.log('@@@ after spanninhhhhhhhhh '+data.fields.Status.value);
//     //   console.log('@@@&&&&&&& after hhhhhhhhhh!!! '+data.fields.Contact.value);
//     //   console.log('777779999999');
//     //   console.log(data.fields.Contact.Check_today_birthday_or_not__c.value)
//     //     alert('hureeeeeeeeee status is ')
//     }
//     if(error)
//     {
//       console.log('testing warning msssg');
//       console.log(error);
//     }
// }
// promise1()
// {
//     return new Promise((resolve,reject)=>{
//         for(let i =0;i<100000;i++)
//         {
//               console.log('promise 11');
//         }
//         resolve('promise 1 resolved');
//     })
// }
// promise2()
// {
//     return new Promise((resolve,reject)=>{
//         for(let i =0;i<200000;i++)
//         {
//                console.log('hureees promsie2')
//         }
//         resolve('promise 1 resolved');
//     })
// }
// async  callRowAction(event)
// {

// // let promiseresul1 = await this.promise1();
// // console.log('lallala@@@@');
// // let proomiseresult2 = await thiss.promise2();



//     const recId = event.detail.row.Id;
//     const actionName = event.detail.action.name;
//     console.log('lalala');
//     if (actionName === 'huree@@@@') {
//         console.log('hurree!@@@@')
//         this.handleAction(recId, 'huree@@@@');
//     }
//     else if (actionName === 'huree@@@@')
//         {
//             console.log('hurree!@@@@')
//         } else if (actionName === 'Delete') {
//         this.handleDeleteRow(recId);
//     } else if (actionName === 'View') {
//         this.handleAction(recId, 'view');
//     }
// }
// handleAction(recordId, mode)
// {
//     console.log('enterededee');
//  console.log(recordId);
//     console.log('jjj###');
//     this.selectedrecid = recordId;
 
// }

// @wire(getRelatedListCount, {
//     parentRecordId: "$selectedrecid",
//     relatedListId: "Contacts",
//   })
//   listInfo({ error, data }) {
//     if (data) {
//         console.log('hsshhs');
//         console.log(data);
//       this.responseData = data;
//       this.error = undefined;
//     } else if (error) {
//       this.error = error;
//       this.responseData = undefined;
//     }
//   }


}