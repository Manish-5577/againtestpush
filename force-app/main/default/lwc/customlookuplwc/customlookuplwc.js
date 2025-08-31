import { LightningElement,api,track } from 'lwc';
import findrecord from '@salesforce/apex/lookupcontroller.findrecord';
export default class Customlookuplwc extends LightningElement {

@api objectname;
@api fieldname;
@api  iconname;
@track record;
@track errors;
@track selectedrecord;
@api testrecord;
    handleevent(event){
        const searchvalue = event.detail;
           console.log('searchvalue is@@@@@@',searchvalue);
           console.log('objectapiname'+this.objectname);
           console.log('fieldApiName'+this.fieldname);
           console.log('iconname'+this.iconname);
       findrecord({ objectname:this.objectname , fieldname:this.fieldname,  search:searchvalue,}).then(result=>{
                      console.log('Record are',result);
                      this.record = result;
for(let i =0;i<this.record.length;i++)
{
    if(this.record[i]){
        console.log('this record[iiiiiii]',this.record[i],'type of result is ',typeof this.record[i]);
        this.record[i].Namesss = this.record[i][this.fieldname];//this will assign fieldname to record as a key 
        //eg name:'mani;
      //  this.record[i].test =this.record[i][this.fieldname];
                  //  subject:'ksdkaksdha'//note record.name == fieldname base 
        console.log('&&%%^#@==============>',this.record[i].Name,'========>>>>>>',this.record[i][this.fieldname]);
    }
    console.log('result[iiiiiiiiiiii]',result[i]);
}

                      this.error = undefined;
        }).catch(error=>{
            this.record = undefined;
            this.error = error.body.message;
        })
    }
    handlerecdlistevent(event){
        const selrecord = event.detail;
        const selectedrec= this.record.find(records => selrecord === records.Id);
        console.log('selecte record',selectedrec);
        this.selectedrecord= selectedrec;
        const selectevent2  = new CustomEvent(
            'select1',{
                detail :selrecord
            }
        );
        this.dispatchEvent(selectevent2);
        console.log('event displatched2222');
    }
    handleremove(){
        this.selectedrecord=undefined;
        this.errors= undefined;
        this.records= undefined;
    }

    handlerecord(event){
           this.testrecord = event.detail;
           console.log('test started');
           const selecteventtest  = new CustomEvent(
            'selecttets',{
                detail :this.testrecord
            }
        );
        this.dispatchEvent(selecteventtest);
        console.log('dispatchevent!!!!!');

    }
}