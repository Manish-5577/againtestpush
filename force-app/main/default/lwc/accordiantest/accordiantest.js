import { LightningElement,track } from 'lwc';
export default class Accordiantest extends LightningElement {


@track section1Loaded = true; // load the first visible section
@track section2Loaded = false;

handleSectionToggle(event) {
const openSections = event.detail.openSections;
if (openSections.includes('section2') && !this.section2Loaded) {
this.section2Loaded = true;
// Maybe call a method to fetch heavy data here
}
}
}