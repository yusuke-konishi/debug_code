/* Summer '18, v43.0
Building a Controller Extension | Visualforce Developer Guide | Salesforce Developers
https://developer.salesforce.com/docs/atlas.en-us.214.0.pages.meta/pages/pages_controller_extension.htm
*/

public with sharing class myControllerExtension {

    private final Account acct;

    public myControllerExtension(ApexPages.StandardController stdController) {
        this.acct = (Account)stdController.getRecord();
    }

    public List<Account> getAcctList() {
        return [SELECT Id, Name FROM Account];
    }
}