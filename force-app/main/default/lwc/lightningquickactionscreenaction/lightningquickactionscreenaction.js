import { LightningElement,api} from 'lwc';

export default class Lightningquickactionscreenaction extends LightningElement {

    _recordId;

@api
get recordId() {
    return this._recordId;
}

set recordId(recordId) {
    if (recordId !== this._recordId) {
        this._recordId = recordId;
   }
}
}