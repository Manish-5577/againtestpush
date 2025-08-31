import { LightningElement ,api} from 'lwc';

export default class Getterandsetterparent extends LightningElement {
@api mama
@api mama2 ='lalallaal'
@api mama1 = 'setinlwc'
@api
inputValue;
    abcpara = 'hello';
    handlechange(event)
    {
        this.abcpara = event.target.value;

    }
    handleClick()
    {
        this.mama2 = 'test222';
    }
    handleee(event)
    {event.preventDefault();
        console.log('event .prevet defaultlt');
        
    }
    handlegreatchild(event)
    {
                 console.log('evet ==>'+JSON.stringify(event));
                 console.log(JSON.stringify(event.detail.record));
    }
    constructor()
    {
        super();
this.template.addEventListener("cc", (evt) => {
    console.log("Notification event", JSON.stringify(evt.detail));
  });
    }
    connectedCallback()
    {       console.log('abcbpapre==lightining studiooo@@@@>'+this.abcpara);
        this.template.addEventListener("cc", (evt) => {
            console.log("Notification event in connected callback", JSON.stringify(evt.detail));
            let hh = evt.detail;
             hh.name = 'manuchanged';

          });
    }

    renderedCallback()
    {
        console.log('rendere callback in parrrent top mostt@@@')
    }
}