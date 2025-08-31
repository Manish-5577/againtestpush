console.log("WELCOME TO LIGHTNING STUDIO");
import getallaccounte from '@salesforce/apex/allaccount2.getallaccounte'


function mm1 ()
{
  return   getallaccounte().then((result)=>{
          console.log('lalallala@@ ')
          return  result;
    }).catch((error)=>{
            console.log('ellllll@@@');
    })
}
export {mm1}