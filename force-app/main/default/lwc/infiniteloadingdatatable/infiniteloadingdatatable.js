import { LightningElement,wire } from 'lwc';
import getAccounts from '@salesforce/apex/readonly.getAccounts'
import getdatabyIdapproach from '@salesforce/apex/readonly.getdatabyIdapproach'
import initialoaddata from '@salesforce/apex/readonly.initialoaddata'
import initialoaddata333 from '@salesforce/apex/readonly.initialoaddata333'
import initialoaddata33344 from '@salesforce/apex/readonly.initialoaddata33344'

const column = [ { label: 'Account Id', fieldName: 'Id', type: 'text' },
    {label: 'Name', fieldName: 'Name', type: 'text' }
    ]
export default class Infiniteloadingdatatable extends LightningElement {

columnss = column;
rowsize = 50;
offset = 0;
datas = [];
databyid =[];

connectedCallback()
{ console.log('connecedcallbackinfinite loading')
this.loaddata();
this.loaddatabyIdinitializer();
}


@wire(initialoaddata333,{})
datat({data,error})
{ console.log('wire outside first')
    if(data)
    {  console.log('inside wire first')
        console.log('huree testingg@@##');

    }
    else if(error)
    {
        console.log('without cache!!!!!!!!!!!!!!');
        console.log(error);
    }
}
@wire(initialoaddata33344,{})
datat({data,error})
{  console.log('wire outside second')
    if(data)
    {    console.log('inside wire second')
        console.log('huree testingg@@')
    }
    else if(error)
    {
        console.log('with cache');
        console.log(error);
    }
}

@wire(initialoaddata,{})
datat({data,error})
{   console.log('wire outside third')
    if(data)
    { console.log('wire inside third')
        console.log('huree testingg@@')
    }
    else if(error)
    {
        console.log('jjjjjj');
        console.log(error);
    }
}
async loaddata()
{

  let response = await getAccounts({limitsize :this.rowsize, offsets : this.offset})
  if(response)
  {
    console.log('testing infinte loading!!!!');
    console.log(response)
    this.datas = [...this.datas, ...response];
  }
}
async loaddatabyIdinitializer()
{
    try{
    let response = await initialoaddata();
    if(response)
     { console.log('testing with cache in !!!!!!!!')
        this.databyid =  [...this.databyid, ...response];
     }
     console.log('testing with cache in 55555555')
    }
    catch(ee)
    {
        console.log('handled error');
        console.log(ee)
    }
}
async loaddatahandler(event)
{
   this.offset = this.offset + this.rowsize;
  this.loaddata();
}
async  loaddatahandlerbyid()
{
    try{
    let allrecord = this.databyid;
    let lastrecord = allrecord[allrecord.length-1];
    console.log('last record details'+lastrecord);
  let response =await  getdatabyIdapproach({lastname :lastrecord.Name,lastid : lastrecord.Id});
    if(response)
    {  console.log('is it coming');
        this.databyid = [...this.databyid , ...response]
        console.log('array size'+this.databyid.length)
    }
}
catch(error)
{
    console.log('error handling');
   console.log(error)
}
}
}