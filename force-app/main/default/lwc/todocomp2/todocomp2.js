import { LightningElement,wire,track } from 'lwc';
import fetchalltask from '@salesforce/apex/taskpicklist.fetchalltask'
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { NavigationMixin } from 'lightning/navigation';
export default class Todocomp2 extends NavigationMixin(LightningElement) {
    @track csss;
@track showmodal = false;
    @track todorecord
    @track viewselectedrecord;
@track editmodal = false;
    @track  edidtedrecordetail;
error;
    @wire(fetchalltask)
    wirerecord({data,error}){
        if(data){
            console.log('dat is ',data);
          //  this.todorecord = data;
          let currentdate = new Date();
       //   console.log('current date ',currentdate);
          this.todorecord = data.map(todo=>{
            let activitydate = todo.ActivityDate;
          //  console.log('activitydate==>',activitydate);
            let activitydateconverted = new Date(activitydate);
          //  console.log('activitydateconverted==>',activitydateconverted);
            return{
                
                ...todo,
                
                //headstyle:currentdate>activitydateconverted ?'color:red':'color:black'
            }
          })   
           
        }
        if(error){  this.todorecord = undefined;
            console.log('error reason is ',error);
        }
    }
    handleClick(){
  this.showmodal = true;
    }
    makemodalfalse(event){
        console.log('makemodadispatc');
        this.showmodal = event.detail.selectrecd
    }
    viewrecord(event){
  event.preventDefault();
  
  let recordId = event.target.dataset.recordId;
 

  this.viewselectedrecord =  this.todorecord.find((todo) =>
{
    return todo.Id ===recordId;
}
);
 

console.log('selectddbkjhdk132198321301',this.viewselectedrecord.ActivityDate );

//   this[NavigationMixin.Navigate]({
//     type:'standard__recordPage',
//     attributes:{
//         actionName:"view",
//         recordId :recordId,
//         objectApiName:"Task"
//     }
//   })
    }
    editrecord(event){

        event.preventDefault();
        this.editmodal = true;
        let recordId = event.target.dataset.recordId;
             
        this.edidtedrecordetail = this.todorecord.find((todo) =>
        {
            return todo.Id ===recordId;
        }
        );
        console.log('editedrecoirdnis==>', this.edidtedrecordetail);
        console.log('editedrecoirdnis3333333==>', this.edidtedrecordetail.headstyle);
//   this[NavigationMixin.Navigate]({
//     type:'standard__recordPage',
//     attributes:{
//         actionName:"edit",
//         recordId :recordId,
//         objectApiName:"Task"
//     }
//   })
    }

    handlecross()
    {
      this.showmodal = false;
    }
}