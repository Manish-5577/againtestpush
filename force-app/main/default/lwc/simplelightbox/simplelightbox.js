import { LightningElement,track } from 'lwc';
import SL from '@salesforce/resourceUrl/imgg';
import { loadStyle, loadScript } from 'lightning/platformResourceLoader';
export default class Simplelightbox extends LightningElement {

@track image = SL;
  
}