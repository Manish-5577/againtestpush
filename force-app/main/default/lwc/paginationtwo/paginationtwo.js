import { LightningElement,track } from 'lwc';
import paginateapproach from '@salesforce/apex/paginationbuilding.paginateapproach'

const column = [{label :"Id", fieldName: "Id"},{label : "Name", fieldName :"Name"},{label : "Rating", fieldName: "Rating"}]
export default class Paginationtwo extends LightningElement {

limitt = 20;
offsett = 0;
warehouse = [];
currentpage = 1;
@track accmap = new Map();
 connectedCallback() {
     this.handlecallback();
}
handleNext()
{
    
}

async handlecallback()
{
    try{
       let response = await paginateapproach({limits : this.limitt, offsett : this.offsett });    
    // let listresponse = JSON.parse(JSON.stringify(response));
     console.log(response)
     console.log('response');
     this.accmap.set(this.currentpage,response);
     this.warehouse = response;
    }
    catch(error)
    {  console.log('errorororro');
      console.log(error);
    }
}

handleNext()
{  this.currentpage  = this.currentpage +1;
console.log(this.currentpage);
this.offsett = this.offsett + this.limitt;
this.warehouse = [];
     if(this.accmap.has(this.currentpage))
     {    
         this.warehouse =  [...this.accmap.get(this.currentpage), ...this.warehouse];
     }
     else{
            this.handlecallback();
     }
}

handleprevious()
{
    this.currentpage  = this.currentpage -1;
    console.log('cuureent page'+this.currentpage);
  // 
 
console.log(typeof Number(this.currentpage));
    if(this.currentpage > 0 )
    {
     if(this.accmap.has(this.currentpage))
     {    console.log('jjjj');
        console.log(this.accmap.get(this.currentpage));
         this.warehouse = [];
         this.warehouse = [...this.accmap.get(this.currentpage), ...this.warehouse];
     }
    }

}




}