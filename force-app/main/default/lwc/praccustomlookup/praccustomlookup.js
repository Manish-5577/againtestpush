import { LightningElement,api,track } from 'lwc';

import searchRecords from '@salesforce/apex/CustomSearchController.searchRecords';

export default class Praccustomlookup extends LightningElement {

    @api objectName = 'Account';
    @api fieldName = 'Name';
    @api iconname = 'standard:record';
    @api label = 'Account';
    @api parentidfield = 'AccountId';

    @track records;
    @track selectedRecord;
    handlekeyword(event){
        var searchval = event.detail;
            searchRecords({ objName: this.objectName,

                fieldName: this.fieldName,
    
                searchKey: searchval}).then(data=>{

                    if(data){
                        let parseresponse = JSON.parse(data);
                        let searchrecordlist = parseresponse[0];
                        for(let i =0; i<searchrecordlist;i++){
                            let record = searchrecordlist[i];
                            record.name = record[this.fieldName];
                        }
                        this.records = searchrecordlist;
                        console.log('this record is',this.records);
                    }
                }).catch(error=>{
                    console.log('errror',error);
                })
    }
    handledpracselected(event){
        console.log('step entered in handlesprarcselected');
        console.log('step entered in handlesprarcselected',event.detail.selRec);
        var selectedvalue = event.detail.selRec;
        this.selectedRecord = selectedvalue;
        let finalRecEvent = new CustomEvent('select', {

            detail: { selectedRecordId: this.selectedRecord.Id, parentfield: this.parentidfield }

        });

        this.dispatchEvent(finalRecEvent);
        console.log('steps entered',this.selectedRecord);

    }
}