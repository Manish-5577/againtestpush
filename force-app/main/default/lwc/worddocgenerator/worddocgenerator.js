import { LightningElement } from 'lwc';
import { loadScript } from 'lightning/platformResourceLoader';
import docxLib from '@salesforce/resourceUrl/Docx';
import tigere from '@salesforce/resourceUrl/tigere';
export default class Worddocgenerator extends LightningElement {
    docxInitialized = false;

    renderedCallback() {
        if (this.docxInitialized) return;
        this.docxInitialized = true;

        loadScript(this, docxLib)
            .then(() => {
                console.log('docx library loaded');
            })
            .catch(error => {
                console.error('Failed to load docx library', error);
            });
    }

    async generateDoc() {
        if (!window.docx) {
            console.error('docx library not loaded');
            return;
        }

        const { Document, Packer, Paragraph, Header, ImageRun } = window.docx;

        try {
            const response = await fetch(tigere);
            const imageBuffer = await response.arrayBuffer();

            const doc = new Document({
                sections: [{
                    headers: {
                        default: new Header({
                            children: [
                                new Paragraph({
                                    children: [
                                        new ImageRun({
                                            data: imageBuffer,
                                            transformation: {
                                                width: 100,
                                                height: 50,
                                            },
                                        }),
                                    ],
                                }),
                            ],
                        }),
                    },
                    children: [
                        new Paragraph("Hello from Salesforce LWC!"),
                    ],
                }],
            });

            const blob = await Packer.toBlob(doc);
            const link = document.createElement('a');
            link.href = URL.createObjectURL(blob);
            link.download = 'Generated.docx';
            link.click();
        } catch (error) {
             console.log('test'+JSON.stringify(error));
            console.error('Error generating document:', error);
           
        }
    }
}