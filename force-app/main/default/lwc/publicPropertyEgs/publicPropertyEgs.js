import { LightningElement,api } from 'lwc';

export default class PublicPropertyEgs extends LightningElement {
    @api meetingRoom;
    @api booleanpp = false;
}