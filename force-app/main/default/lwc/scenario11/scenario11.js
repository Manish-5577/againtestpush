import { LightningElement } from 'lwc';

export default class Scenario11 extends LightningElement {

  
    showhide = true;
        // basic data source with minimal content
        myMenuItems = [
            {
                id: 'item-01',
                label: 'Alpha',
                value: 'alpha',
            },
            {
                id: 'item-02',
                label: 'Beta',
                value: 'beta',
            },
            {
                id: 'item-03',
                label: 'Gamma',
                value: 'gamma',
            },
            {
                id: 'item-04',
                label: 'Delta',
                value: 'delta',
            },
            {
                id: 'item-05',
                label: 'Epsilon',
                value: 'epsilon',
            },
        ];
    
        // more complex data source with additional content
        myComplexMenuItems = [
            {
                id: 'item-01',
                label: 'Alpha',
                value: 'alpha',
                disabled: false,
                prefixIconName: 'utility:bookmark',
                iconName: 'utility:animal_and_nature',
            },
            {
                id: 'item-02',
                label: 'Beta',
                value: 'beta',
                disabled: true,
                iconName: 'utility:company',
            },
            {
                id: 'item-03',
                label: 'Gamma',
                value: 'gamma',
                prefixIconName: 'utility:date_input',
            },
            {
                id: 'item-04',
                label: 'Delta',
                value: 'delta',
                checked: true,
            },
            {
                id: 'item-05',
                label: 'Epsilon',
                value: 'epsilon',
                iconName: 'utility:knowledge_base',
            },
        ];
    
        handlechange(event)
        {
            const label = event.currentTarget.label;
            const fieldvalue = event.currentTarget.value;
            //event.currentTarget.dataset.index;
            if(label == 'Alpha'){
            var loop = this.template.querySelectorAll('lightning-input');
            loop.forEach((element)=>{
                console.log('tttttlalalaala');
                console.log(element);
                if(element.label == 'Epsilon' )
                { console.log('comingg !!1' )
                    this.showhide = false;

                }else{
                    this.showhide = true;
                }
            })
        }
    }

}