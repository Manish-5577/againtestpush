import { LightningElement,track } from 'lwc';

export default class Publicpropertyparentrevison extends LightningElement {
   @track selectedroom ;
    meetingroominfos= [
        {roomname : 'A02',roomcapacity :'12'},
        {roomname : 'A03',roomcapacity :'13'},
        {roomname : 'A04',roomcapacity :'14'},
        {roomname : 'A05',roomcapacity :'15'},
        {roomname : 'A06',roomcapacity :'16'},
        {roomname : 'A07',roomcapacity :'17'},
        {roomname : 'A08',roomcapacity :'18'},
    ]

    handlingeventinparent(event){
        const meetinginfo =  event.detail;
        this.selectedroom = meetinginfo.roomname;
    }
}