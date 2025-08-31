import { LightningElement,track } from 'lwc';
import NAME_FIELD from '@salesforce/schema/Contact.Name';
import Phone_FIELD from '@salesforce/schema/Contact.Phone';
import Email_FIELD from '@salesforce/schema/Contact.Email';
import Account_FIELD from '@salesforce/schema/Contact.AccountId';

export default class Lightningdataservice extends LightningElement {
    nameField = NAME_FIELD;
    phonefield = Phone_FIELD;
    emailfield = Email_FIELD;
    accountfield = Account_FIELD;
   fields = [NAME_FIELD,Phone_FIELD,Email_FIELD,Account_FIELD];
}