import { LightningElement,api } from 'lwc';
import doraemonImage from '@salesforce/resourceUrl/birthdaydoremonballon';
//import backgroundSound from '@salesforce/resourceUrl/BirthdaySong';
export default class BirthdayPage extends LightningElement {
 
    @api birthdayMessage = 'Happy Birthday! 🎉';
    isFirstScreen = true;
    isSecondScreen = false;
    isThirdScreen = false;
    isFourthScreen = false;

    doraemonImage = doraemonImage;

    images = [
        { id: 1, url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0B6hSmItSFDDm_tbmnMxX5O0jfg33HqerH3h9i7dBXwEdwTTg8AYU7pKN3hwVT57RzVc&usqp=CAU', message: 'Our first project together ❤️', className: 'flip-card-inner' },
        { id: 2, url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTo7aRfg2fgau2p_ZTXBiuI4IkSY__0Pe27FA&s', message: 'Unforgettable outing! 😍', className: 'flip-card-inner' },
        { id: 3, url: 'https://static1.makeuseofimages.com/wordpress/wp-content/uploads/2016/10/camera-photo-lens-stock-images.jpg', message: 'Surprise birthday celebration 🎂', className: 'flip-card-inner' }
    ];

    handleProceed() {
        this.isFirstScreen = false;
        this.isSecondScreen = true;
    }

    goToThirdScreen() {
        this.isSecondScreen = false;
        this.isThirdScreen = true;
    }

    goToFourthScreen() {
        this.isThirdScreen = false;
        this.isFourthScreen = true;
    }

    handleFlip(event) {
        const clickedId = parseInt(event.currentTarget.dataset.id, 10);
        this.images = this.images.map((img) => {
            if (img.id === clickedId) {
                return { ...img, className: img.className.includes('flipped') ? 'flip-card-inner' : 'flip-card-inner flipped' };
            }
            return img;
        });
    }


}