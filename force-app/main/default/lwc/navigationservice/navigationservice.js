import { LightningElement } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
export default class Navigationservice extends NavigationMixin(LightningElement) {

    url ='https://tccss-dev-ed.develop.lightning.force.com/lightning/n/calculator'
    // openSFDCFacts(){
    //     this[NavigationMixin.Navigate]({
    //         type : 'standard__webPage',
    //         attributes: {
    //             url : 'https://sfdcfacts.com'
    //         }
    //     });
    // }

    openAcountHome(){
        this[NavigationMixin.Navigate]({
            type : 'standard__objectPage',
            attributes: {
                objectApiName: 'Account',
                actionName: 'Home'
            }
        });
    }

    createNewContact(){
        this[NavigationMixin.Navigate]({
            type : 'standard__objectPage',
            attributes: {
                objectApiName: 'Contact',
                actionName: 'new'
            }
        });
    }

    openOppListView(){
        this[NavigationMixin.Navigate]({
            type : 'standard__objectPage',
            attributes: {
                objectApiName: 'Opportunity',
                actionName: 'list'
            }
        });
    }

    openCaseRecord(){
        this[NavigationMixin.Navigate]({
            type : 'standard__recordPage',
            attributes: {
                recordId: "5005j00000f9NfpAAE",
                objectApiName: 'Case', // objectApiName is optional
                actionName: 'view'
            }
        });
    }

    openMeetingRoom(){
        this[NavigationMixin.Navigate]({
            type : 'standard__navItemPage',
            attributes: {
                apiName: 'Calling_Apex'//note Calling_Apex is lightning page u can see unser lightnign app builder 
            }
        });
    }
    
    navigateToRelatedList() {
        // Navigate to the CaseComments related list page
        // for a specific Case record.
        this[NavigationMixin.Navigate]({
          type: "standard__recordRelationshipPage",
          attributes: {
            recordId: "5005j00000f9NfpAAE",
            objectApiName: "Case",
            relationshipApiName: "CaseComments",
            actionName: "view",
          },
        });
      }
    // previewFile(){
    //     this[NavigationMixin.Navigate]({
    //         type: 'standard__namedPage',
    //         attributes: {
    //             pageName: 'filePreview'
    //         },
    //         state : {
    //             recordIds: '0696D0000004eENQAY,0696D0000004eEIQAY',
    //             selectedRecordId:'0696D0000004eENQAY'
    //         }
    //     });
    // }
    navigateTogenerateurl()
    {
        this[NavigationMixin.GenerateUrl]({
            type: 'standard__webPage',
            attributes: {
               // url: 'https://tccss-dev-ed.develop.lightning.force.com/lightning/n/calculator'
               url :'/lightning/app/06m5j0000036hQWAAY'
            }
        }).then(generatedUrl => {
            window.open(generatedUrl);
        });
       
    }
    navigateToapp()
    { this[NavigationMixin.Navigate]({
        type: 'standard__app',
        attributes: {
            appTarget: 'standard__Sales',
        }
    });
    }
    Navigatiottolwccomponent()
    {this[NavigationMixin.Navigate]({
        type: 'comm__loginPage',
        
        attributes: {
            actionName: 'login'
        }
    })
    }
    Navigatiottolwccomponent2()
    {
        this[NavigationMixin.Navigate]({

            type: "standard__component",
            attributes: {
              componentName: "c__firstcalculator",
            },
            state: {
              c__propertyValue: "2000",
              c__abcd : "jjjjjj",
              c__uuuue:"eeoeeoei",
              c__:{abc:332, mani: 355}
            }
        })
    }

}