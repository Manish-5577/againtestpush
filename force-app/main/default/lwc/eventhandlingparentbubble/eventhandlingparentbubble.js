import { LightningElement,track } from 'lwc';

export default class Eventhandlingparentbubble extends LightningElement {
hh;
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
    handlingeventinparent2(event){
        console.log('jjj!!!!!'+JSON.stringify(event.detail));
          event.detail.one = 555;
          this.hh.one = 544;
    }
    testingcallbyreefernce()
    { console.log('d!!!!@@@22')
        this.hh = {two:444, three:55};
     
    }
    constructor(){
        super();
        this.template.addEventListener('anyeventname',this.handlingeventinparent.bind(this));
        
        this.template.addEventListener('compulsory',this.handlingeventinparent2.bind(this));

    }
}