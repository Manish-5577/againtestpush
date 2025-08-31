import getallaccounte from '@salesforce/apex/allaccount2.getallaccounte'

 const getAccounts = () => {
   
    return getallaccounte().then((result) => {
        for(let i =0;i<400;i++){
            console.log('testing');
        }
       return result ;
    }).catch((error) => {
        console.log('getListContact', error);
        return 'error  handling in catch blockkkkk@@@'
    });
}


export { getAccounts };