const  mm = () => {
    // for(let i =0;i<1000;i++)
    // {
    //     console.log('manish test11');
    // }
    console.log('hureee')
    return new Promise((resolve)=>{
           setTimeout(()=>{
                     resolve('promise resolve first')
           },3000)
    })
    
    
}
function nn()
{
    // for(let i =0;i<5000;i++)
    // {
    //     console.log('manish test37');
    // }
     return new Promise((resolve)=>{
           setTimeout(()=>{
                     resolve('promise resolve  2nd' )
           },3000)
    })
}

export {mm,nn}