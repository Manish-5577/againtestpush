public class WordFileGenerator {
    @AuraEnabled(cacheable=false)
    public static String generateAccountWordFile(Id accountId) {
        Account acc = [
            SELECT Name, Industry, Phone, Website 
            FROM Account 
            WHERE Id = :accountId 
            LIMIT 1
        ];

        // Get logo as base64 from static resource
    

    //    String logoUrl = 'https://tccss-dev-ed.develop.my.salesforce.com/resource/tigere';    
     //   String logoImgTag = '<img src="' + logoUrl + '" width="100" height="50"/>';

        StaticResource logoResource = [SELECT Body FROM StaticResource WHERE Name = 'tigere' LIMIT 1];
        String logoBase64 = EncodingUtil.base64Encode(logoResource.Body);
        String logoImgTag = '<img src="data:image/png;base64,' + logoBase64 + '" width="100" height="50"/>';

    /*    String htmlContent = ''
            + '<!DOCTYPE html>'
            + '<html xmlns:w="urn:schemas-microsoft-com:office:word">'
            + '<head>'
            + '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">'
            + '<style>'
            + '@page { size: A4; margin: 1in; mso-header-space: 1in; mso-footer-space: 1in; }'
            + 'div.header { mso-element:header; text-align: center; }'
            + 'div.footer { mso-element:footer; text-align: center; }'
            + 'body { font-family: Arial, sans-serif; font-size: 12pt; }'
            + '</style>'
            + '</head>'
            + '<body>'
            + '<div class="header">' + logoImgTag + '</div>'
            + '<div class="footer">' + logoImgTag + '</div>'
            + '<h2>Account Information</h2>'
            + '<p><strong>Name:</strong> ' + acc.Name + '</p>'
            + '<p><strong>Industry:</strong> ' + acc.Industry + '</p>'
            + '<p><strong>Phone:</strong> ' + acc.Phone + '</p>'
            + '<p><strong>Website:</strong> ' + acc.Website + '</p>'
            + '</body>'
            + '</html>';*/
        String htmlContent = ''
    + '<!DOCTYPE html>'
    + '<html xmlns:w="urn:schemas-microsoft-com:office:word">'
    + '<head>'
    + '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">'
    + '<style>'
    + '@page { size: A4; margin: 1in; mso-header-space: 1in; mso-footer-space: 1in; }'
    + 'body { font-family: Arial, sans-serif; font-size: 12pt; }'
    + '</style>'
    + '</head>'
    + '<body>'
    + '<div style="mso-element:header; text-align: center;">' + logoImgTag + '</div>'
    + '<div style="mso-element:footer; text-align: center;">' + logoImgTag + '</div>'
    + '<h2>Account Information</h2>'
    + '<p><strong>Name:</strong> ' + acc.Name + '</p>'
    + '<p><strong>Industry:</strong> ' + acc.Industry + '</p>'
    + '<p><strong>Phone:</strong> ' + acc.Phone + '</p>'
    + '<p><strong>Website:</strong> ' + acc.Website + '</p>'
    + '</body>'
    + '</html>';
        Blob wordBlob = Blob.valueOf(htmlContent);
        return EncodingUtil.base64Encode(wordBlob);
    }
}