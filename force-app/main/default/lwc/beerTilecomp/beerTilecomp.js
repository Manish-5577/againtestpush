import { LightningElement,api } from 'lwc';

export default class BeerTilecomp extends LightningElement {

    @api beerRecord;

    handleaddtocart()
    {
        const sentselectbeerid  = new CustomEvent('beerincart',{
            detail : this.beerRecord.Id
        })  
        this.dispatchEvent(sentselectbeerid);
    }
}