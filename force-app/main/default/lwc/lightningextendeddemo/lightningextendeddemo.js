import { LightningElement,track,wire} from 'lwc';
import LightningDatatable from 'lightning/datatable';
import  returnaccount from '@salesforce/apex/databasequery.returnaccount'
const columns = [
    {label :'Name',fieldName :'Name'},
    {label : 'Name', fieldName : 'Name',type: 'addlink', typeAttributes:{
        recordId :{
            fieldName : "Id"
        },
        recordName :{
            fieldName : "Name"
        }
    }},
    {label:'Industry',fieldName :'Industry'},
    {label:'Industry', fieldName : 'Industry', type : 'picklist', wrapText: true,typeAttributes :{
        Name :'Industry',
        label : 'Industry',
        placeholder :'Select Industry',
        options :[
            { label :'Agricultures',value :'Agricultures'},
            { label :'Apparel',value :'Apparel'},
            { label :'Banking',value :'Banking'},
            { label :'IT',value :'IT'},
            { label :'Biotechnology',value :'Biotechnology'},
            { label :'Chemicals',value :'Chemicals'},
            { label :'Communications',value :'Communications'},
            { label :'Construction',value :'Construction'},
            { label :'Consulting',value :'Consulting'},
            { label :'Education',value :'Education'},
            { label :'Electronics',value :'Electronics'},
            { label :'Energy',value :'Energy'},
            { label :'Engineering',value :'Engineering'},
            { label :'Entertainment',value :'Entertainment'},
            { label :'Environmental',value :'Environmental'},
            { label :'Finance',value :'Finance'},
            { label :'Healthcare',value :'Healthcare'},

        ],
        variant : 'label-hidden'
    }},
    {label :'Phone',fieldName :'Phone', type :'Phone'},
    {label :'LOGO', fieldName :'IMAGE_URL',type:'image',typeAttributes :{
        height : 50,
        width: 50,
        alt :'Logo demo'
    }}
    // {label :'Type',fieldName :'Type'}
]
export default class Lightningextendeddemo extends LightningElement {

    @track column = columns;
    @track records;
    @track errors;

    @wire(returnaccount)
    accountdata({data,error}){
        if(data)
        {
  // this.records = data
       this.records = data.map((item)=>{
        return{
            ...item,
            IMAGE_URL :'https://tccss-dev-ed--c.develop.vf.force.com/resource/1716789039000/tigere',
           // ICON_NAME : 'standard:contact'
           
        }
       })
  
        }
        if (error)
        {
       this.errors = error;
       console.log(error)
        }
    }
    handleselect(event)
    {
           event.preventDefault()
    }
    handlereceivedrecordid(event)
    {
        console.log(JSON.stringify(event.detail));
    }
}