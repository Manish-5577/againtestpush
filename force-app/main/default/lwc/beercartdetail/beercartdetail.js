import { LightningElement,wire,track } from 'lwc';
import {CurrentPageReference}  from 'lightning/navigation'
import getcartitem from '@salesforce/apex/Beercontroller.getcartitem'
import {NavigationMixin} from 'lightning/navigation'
import { deleteRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import couponinfo   from '@salesforce/apex/Beercontroller.couponinfo';
import createorderr from '@salesforce/apex/Beercontroller.createorderr'
import getaddressforloginuser  from '@salesforce/apex/Beercontroller.getaddressforloginuser'
export default class Beercartdetail extends NavigationMixin(LightningElement) {
 showinput = false;
 selectedaddresfordelivery;
cartid;
totalitem =0;
coupon ;
couponvalue;
totalamount =0.00;
totaladdress =0;
addresss;
hideShippingcart= false;
showaddresscomp = false
@track cartitems =[] ;
@wire(CurrentPageReference)
   getpageref(CurrentPageReference)
   {
    if(CurrentPageReference)
    {
        let states = CurrentPageReference.state.c__cartId;
        this.cartid = states;
        console.log('states==>'+JSON.stringify(states));
    }
   }
   
  
   connectedCallback()
   {
       this.usercartdata();
   }
    usercartdata(){
        console.log('this.cartid=>'+this.cartid);
        getcartitem({cartid:this.cartid}).then((data)=>{
              if(data)
              {  console.log('json dataa'+JSON.stringify(data));
                console.log(data);
               this.totalitem = data.length;
               this.cartitems = JSON.parse(JSON.stringify(data));
               console.log('this.totalitem'+this.totalitem);
               for(let i =0;i<data.length;i++)
               {   console.log('item amount ==>'+this.cartitems[i].Item_Amount__c)
 this.totalamount =  this.totalamount + this.cartitems[i].Item_Amount__c;
               }
              }
        }).catch((error)=>{
     console.log('errror');
     console.log(error);
        })
     }

     navigatetosite()
     {
        this[NavigationMixin.Navigate]({
            type: 'standard__navItemPage',
            attributes: {
                apiName: 'Cool_Breeze',
               
            }
           
        });
     }

     applycoupun()
     {   console.log('apply couponn');
                couponinfo({'name':this.coupon}).then((data)=>{
                          if(data)
                          {
                            console.log('lllll');
                            console.log(data);
                            this.couponvalue = data.Price__c;
                            this.totalamount = this.totalamount - this.couponvalue;
                          }
                }).catch((error)=>{

                         console.log('error in coupmn');
                          this.totalamount = this.totalamount + this.couponvalue;
                         this.couponvalue = 0;


                })
     }
handlecoupon()
{
    this.showinput = true;
}
handlecouponchange(event)
{
   this.coupon = event.target.value;
   console.log('this coupon ==>'+this.coupon);
}

     removecartitemfromscreen(event)
     {// event.event.preventDefault();
      let found = this.cartitems.find(function (element) {
    return element.Id == event.detail;
});
let idd = event.detail;
 let index = this.cartitems.indexOf(found);
console.log('found or not !!'+JSON.stringify(found));
 console.log('indexxx@@@@!!!!==>'+index);

      deleteRecord(idd).then(()=>{
            this.cartitems.splice(index,1);
            this.totalamount = this.totalamount - found.Item_Amount__c;
            console.log('successfullly  deleted !!!!!!!!!!!!');
      }).catch((error)=>{
        console.log('error');

              console.log(error);
      })

     }


          handleproceed()
          {
                  getaddressforloginuser().then((data)=>{
                    
                          console.log('data of address===>'+JSON.stringify(data));
                          this.addresss = JSON.parse(JSON.stringify(data));
                          this.totaladdress = this.addresss.length;
                          if(this.addresss.length>0)
                          {
                               this.hideShippingcart  =true;
                          }else{
                               this.showaddresscomp   =true;
                          }
                  }).catch((error)=>{
                    console.log(error);
                  })


          }
          showaddreess()
          {this.showaddresscomp   =false;
            this.handleproceed();
            
          }
hidethiscomp()
{
  this.hideShippingcart  =false;
  this.showaddresscomp   =true;
}

showselectedaddress(event)
{
  console.log('evetndata fom deliverr');
   console.log(event);
 let selectedaddress =  this.addresss.find((element)=>{
               return element.Id == event.detail;
   })
   console.log('selected addresss !!!'+JSON.stringify(selectedaddress));
   this.selectedaddresfordelivery = selectedaddress;
    console.log('selecedt variable !!!'+JSON.stringify(this.selectedaddresfordelivery));
}

handleorder()
{
      if(!this.selectedaddresfordelivery)
      {
              alert('Kindly select deivery address first in order to place order ');
              return;
      }else{

        createorderr({cartid: this.cartid,selectedaddressid: this.selectedaddresfordelivery.Id,totalAmount:this.totalamount } ).then(()=>{
                  console.log('suucesss!!! order placedede');
        }).catch(()=>{
             console.log('error while pplacing orderedede')
        })

      }

}



}