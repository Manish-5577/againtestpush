import { LightningElement } from 'lwc';
import {mm, nn}  from 'c/sharingasyncawait';
export default class Sharingjsconcept extends LightningElement {



 async handleasyncawait()
{ console.log('lalalla');
  let mon = await mm();
  console.log('pomise one excutted')
  let  non = await nn();
  console.log('promise two executed')
//    mm().then((response)=>{
//     console.log('kdkkdkdkdk')
//        console.log(response)
//    }).catch((error)=>{
//       console.log(error)
//    })
//    console.log('is it reachedde')
//   console.log('llll'+JSON.stringify(mon));
//   console.log(mon)
//   let non = await  nn();
//  console.log('nnnnnn'+non);

}
}