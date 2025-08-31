import { LightningElement,wire} from 'lwc';
import getOpportunities from '@salesforce/apex/testingstatuscode.getOpportunity';
const COLUMNS = [
        {
                label: 'Name',
                fieldName: 'opportunityLink',
                type: 'url',
                typeAttributes: { label: { fieldName: 'Name' }, target: '_blank' }
                // target:Determines how the link behaves when clicked
                // '_blank': Opens the link in a new browser tab or window
                // '_self': Opens the link in the same tab (default behavior)
        }, {
                label: 'Amount',
                fieldName: 'Amount',
                type: 'currency',
                typeAttributes: { currencyCode: 'INR' }
        },{
                label: 'CloseDate',
                fieldName: 'CloseDate',
                type: 'date',
        }, {
                label: 'Stage',
                fieldName: 'StageName',
        }
];
export default class Datatablewithhyperlink extends LightningElement {
  data = [];
        columns = COLUMNS;

        @wire(getOpportunities)
        opportunities({ data, error }) {
                if (data) {
                        data = JSON.parse(JSON.stringify(data));
                        data.forEach(res => {
                                res.opportunityLink = '/' + res.Id;
                        });
                        this.data = data;
                } else if (error) {
                        console.error(error);
                }
        }
}