public class AccountWordController {
    public Account account { get; set; }
    public String logoBase64 { get; set; }

    public AccountWordController() {
        Id accountId = ApexPages.currentPage().getParameters().get('id');
        account = [
            SELECT Name, Industry, Phone, Website
            FROM Account
            WHERE Id = :accountId
            LIMIT 1
        ];

        StaticResource logo = [SELECT Body FROM StaticResource WHERE Name = 'tigere' LIMIT 1];
        logoBase64 = EncodingUtil.base64Encode(logo.Body);
    }
}