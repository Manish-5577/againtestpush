import { LightningElement } from 'lwc';
export default class Conditionalrendering extends LightningElement {

userinput ;
userinputvalue  =''
 mm = [{name: 'mani',age : '12', sirname : 'chhh'},
   {name: 'suni',age : '13', sirname : 'kioo'},
   {name: 'luni',age : '14', sirname : 'neioooo'},
   {name: 'puni',age : '15', sirname : 'pioioio'},
     {name: 'sunii',age : '16', sirname : 'ioererw'}]

handleClick(event)
{
  this.userinput = this.userinputvalue;
}

handlechange(event)
{
    console.log(event.target.value);
    this.userinputvalue = event.target.value;
}
get childone()
{
    return  this.userinput == 'childone'
}
get childtwo()
{
    return  this.userinput == 'childtwo'
}
get childthree()
{
    return  this.userinput == 'childthree'
}
}