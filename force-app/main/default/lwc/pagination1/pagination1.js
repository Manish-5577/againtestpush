import { LightningElement,wire,track,api } from 'lwc';
import { deleteRecord } from 'lightning/uiRecordApi';
import { refreshApex } from '@salesforce/apex';
import { getRelatedListRecords } from 'lightning/uiRelatedListApi';
import getaccount from '@salesforce/apex/paginationbuilding.getaccount'
import updateAccount from '@salesforce/apex/paginationbuilding.updateAccount';
import { 
    getRecord, 
    notifyRecordUpdateAvailable, 
    getFieldValue 
} from 'lightning/uiRecordApi';
import ACCOUNT_NAME from "@salesforce/schema/Account.Name";
import ACCOUNT_DESCRIPTION from "@salesforce/schema/Account.Description";
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

const columns = [{label : "Id", fieldName: "Id",
 type: 'url',
        typeAttributes: { label: { fieldName: 'Id' }, target: '_blank' }},
{label : "Name", fieldName : "Name"},
{label : "Rating", fieldName : "Rating"}]

export default class Pagination1 extends LightningElement {

column = columns;
@track datas
relatedcontactid;


 @api recordId;
    name;
    description;
    isLoaded = false;
@wire(getaccount,{})
abc
  // abc({data ,error})
  // {
  //   if(data)
  //   {  console.log('lalalals');
  //            let response =  JSON.parse(JSON.stringify(data));
  //               response.forEach(res => {
  //               res.Id = '/' + res.Id;
  //           });
  //      console.log(data);
  //      this.datas = response;
  //   }
  //   else{
  //         console.log(error);
  //   }
  // }

   @wire( getRecord, {
        recordId: '$recordId',
        fields: [ ACCOUNT_NAME, ACCOUNT_DESCRIPTION ]
    } )
    wiredRecord( { error, data } ) {

        if ( error ) {

            console.log(
                'Inside error block'
            );
            let message = 'Unknown error';

            if ( Array.isArray( error.body ) ) {

                message = error.body.map(e => e.message).join(', ');

            } else if ( typeof error.body.message === 'string' ) {

                message = error.body.message;

            }

            this.dispatchEvent(
                new ShowToastEvent( {
                    title: 'Some error occurred',
                    message,
                    variant: 'error',
                } ),
            );

        } else if ( data ) {

            console.log(
                'Data is',
                JSON.stringify( 
                    data
                )
            );
            this.name = getFieldValue( 
                data, 
                ACCOUNT_NAME 
            );
            this.description = getFieldValue( 
                data, 
                ACCOUNT_DESCRIPTION
            );

        }

    }

    async updateAccountRecord() {

        this.isLoaded = true; 
        await updateAccount( 
            { strRecordId : this.recordId }
        );
        await notifyRecordUpdateAvailable( 
            [ { recordId: this.recordId } ] 
        );
        this.isLoaded = false;

    }




  handlecontact(event)
  {
    console.log(event.currentTarget.dataset.index);
    console.log(event.currentTarget.dataset.id);
    console.log('jiooooooo');
  }
  handledelete(event)
  {
     console.log(event.currentTarget.dataset.index);
    let s1= event.currentTarget.dataset.id;
console.log(s1);
    deleteRecord(s1).then(()=>{
        refreshApex(this.abc);
        console.log('referedheded@@@@@@')
    }).catch((error)=>{
          console.log(error)
    })
  }

}