import { LightningElement, api } from 'lwc';
import fieldListToRender from '@salesforce/apex/DynamicRenderinglogic.fieldListToRender'
import fetchvalidationaError from '@salesforce/apex/DynamicRenderinglogic.fetchvalidationaError'
import LightningToast from "lightning/toast";

export default class Dynamicrecordeditformchild extends LightningElement {

  validationMap = new Map();

  dependencycheckMap = new Map();

  @api objectApiName;

  fieldsapiNameList = [];

  errorMssgToRender = [];

  @api recordId;

  @api
  get fieldlist() {
    return this.fieldsapiNameList;
  }
  set fieldlist(value) {
    let arrayy = value.split(",");
    arrayy.forEach(element => {
      let objecttt = {};
      objecttt["fields"] = element.split(":")[0]
      if (element.split(":")[1] == "true") {
        objecttt["mandatory"] = true
      }
      else if (element.split(":")[1] == "false") {
        objecttt["nonmandatory"] = true;
      }
      else {
        objecttt["required"] = "parentid";
      }
      this.fieldsapiNameList.push(objecttt);
    });
    console.log(JSON.stringify(this.fieldsapiNameList));
  }

@api
 get dependencycheck()
 {
    return this.dependencycheckMap;
 }
 set dependencycheck(value)
 {   if(value != null){
    value.split(",").forEach(element=>{
      this.dependencycheckMap.set(element.split(":")[0],element.split(":")[1]);
    })
 }
 }
  handleclick(event) {

  }
  handlesubmit(event) {
    try {
      event.preventDefault();
      const field = event.detail.fields;
      this.errorMssgToRender = [];
      Object.keys(field).forEach(element => {
        if (Object.keys(this.validationhandler(element, field[element])).length > 0) {
          this.errorMssgToRender.push(this.validationhandler(element, field[element]));
        }
      })
      if(this.dependencycheckMap != null){
         this.dependencycheckMap.forEach((value, key)=>{
          console.log(field[this.dependencycheckMap.get(key)]);
         if(field[this.dependencycheckMap.get(key)] == null || field[this.dependencycheckMap.get(key)].length ===0)
         {
                let errorobj ={} ;
                 errorobj["errorfield"] = this.dependencycheckMap.get(key);
                 errorobj["reasonforError"]  = "Fields are required !!!!";
                 if(Object.keys(errorobj).length > 0)
                 {
                   this.errorMssgToRender.push(errorobj);
                 }
         }
         })
      }
    }
    catch (error) {
      console.log('eororor',error);
      console.log(JSON.stringify(error))
    }
  }
  connectedCallback() {
    fetchvalidationaError().then((response) => {
      response.forEach(element => {
        this.validationMap.set(element.fieldApiName, element);
      })
      console.log(JSON.stringify(this.validationMap))
    }).catch((error) => {
      console.log('error')
      console.log(JSON.stringify(error));
    })

  }

  validationhandler(fieldapiname, fieldValue) {
    let errorobj = {};console.log('line 103');
    if (this.validationMap.get(fieldapiname) != null) {
      this.validationMap.get(fieldapiname).validationRec.fieldToConsider__c.split(",").forEach(element => {
        if (element == 'max_length__c') {
          if (fieldValue != null && (fieldValue.length > parseInt(this.validationMap.get(fieldapiname).validationRec.max_length__c))) {
            errorobj["errorfield"] = fieldapiname;
            errorobj["reasonforError"] = this.validationMap.get(fieldapiname).errorMssgRec.max_length__c;
          }
        }
        else if (element == 'min_Length__c') {
          if (fieldValue == null || fieldValue.length === 0 || fieldValue.length < parseInt(this.validationMap.get(fieldapiname).validationRec.min_Length__c)) {
            console.log('line 114')
            errorobj["errorfield"] = fieldapiname;
            errorobj["reasonforError"] = this.validationMap.get(fieldapiname).errorMssgRec.min_Length__c;
          }
        }
      })
    }
    return errorobj;
  }
}