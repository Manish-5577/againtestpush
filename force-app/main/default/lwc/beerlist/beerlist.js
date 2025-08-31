import { LightningElement,wire,track } from 'lwc';
import fetchbeerrecord from '@salesforce/apex/Beercontroller.fetchbeerrecord'
import abcd  from '@salesforce/resourceUrl/neocart'
import {NavigationMixin} from 'lightning/navigation'
import getcardid from '@salesforce/apex/Beercontroller.getcardid'
import  createcartitem from '@salesforce/apex/Beercontroller.createcartitem'
// import  force-app\main\default\staticresources\cartt\cart\image\cart image.png
export default class Beerlist extends NavigationMixin(LightningElement) {

    totalitemincart=0;
   @track beerRecords;
   @track ff = abcd;
   cartid;
@wire(fetchbeerrecord,{})
   fetchedrecord({data,error})
   {
    if(data)
    {
        console.log('wire');
        this.beerRecords = data;
        console.log(data);
    }
    if(error)
    {
        console.log('error in wire');
        console.log(error);
    }
   }
   connectedCallback()
   {
     this.defaultcartid();
   }
   defaultcartid()
   {
    getcardid().then(data=>{
        console.log('default step')
        console.log(data)
      let dd =   JSON.parse(data)
        this.cartid =dd.cartid;
        this.totalitemincart = dd.count;
             console.log(data);
    }).catch(error=>{
        console.log('error in default step')
             console.log(error)
    })
   }

    searchbeer(event)
    {
        let receivedtext = event.detail;
        fetchbeerrecord({searchterm:receivedtext}).then((data)=>{
              console.log(data);
              this.beerRecords = data;
        }).catch((error)=>{
             console.log(error)
        })
    }

    handlecart(event)
    {
                 const beeridd = event.detail;
const selectedreorddetail = this.beerRecords.find(
    record => record.Id === beeridd
)

createcartitem({
    cartid : this.cartid,
    beerid :beeridd,
    amount : selectedreorddetail.Price__c
}).then(()=>{
    console.log(event.detail);
        this.totalitemincart = this.totalitemincart + 1;
}).catch((error)=>{

})
        
    }

    navigatetocartdetail()
    {
        this[NavigationMixin.Navigate]({
            type: 'standard__navItemPage',
            attributes: {
                apiName: 'cardetails',
               
            },
            state:{
                c__cartId : this.cartid
            }
        });
    }




}