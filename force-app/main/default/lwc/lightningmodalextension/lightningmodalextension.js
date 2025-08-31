import { api,track} from 'lwc';
import lightningModal from 'lightning/modal';
import returnproduct  from '@salesforce/apex/databasequery.returnproduct'

const columnslist = [
    {label : 'Name',fieldName : 'Name', type :'addlink',typeAttributes:{
        recordId :{
            fieldName : "Id"
        },
        recordName :{
            fieldName : "Name"
        }
    }},
    {label : 'Product Code',fieldName : 'ProductCode'},
    {label : 'Product Family',fieldName : 'ProductCode'},
    {label : 'Is Active ?',fieldName : 'IsActive'}
]
export default class Lightningmodalextension extends lightningModal {

    @api pricebookId;
    @api index ;
    @api content;
   @track record;
   @track column = columnslist;
    handlecancel()
    {
       this.close('okay')
    }
    handlesave()
    {
            this.close('coolll!!');
    }
    // connectedCallback()
    // {
    //     if(this.content)
    //     {
    //         this.showdata();
    //     }
    // }
    connectedCallback()
    {
        console.log('what is content'+this.content);
        if(this.content != '')
        {
            handlechangee(this.content);
        }
    }
    showdata(event)
    {event.preventDefault();
let textt = event.target.value;
this.handlechangee(textt);
        console.log('this.content'+this.content);
    
    }
    handlechangee(searchkeyword)
    {
        returnproduct({
            searchkey :searchkeyword,
            pricebookId : this.pricebookId
        }).then((data)=>{
           
            console.log('received data'+JSON.stringify(data))
                this.record =  data;
            }).catch(()=>{
            })
    }
    handlereceivedrecordid(event)
    {
         let details  = JSON.parse(JSON.stringify(event.detail));
         details.index = this.index;
  console.log('final details '+JSON.stringify(details));
     this.close('modal closedde@@')
    }
}