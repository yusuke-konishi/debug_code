/* Summer '18, v43.0
Apex Server-Side Controller Overview | Lightning Components Developer Guide | Salesforce Developers
https://developer.salesforce.com/docs/atlas.en-us.214.0.lightning.meta/lightning/controllers_server_apex.htm

Calling a Server-Side Action | Lightning Components Developer Guide | Salesforce Developers
https://developer.salesforce.com/docs/atlas.en-us.214.0.lightning.meta/lightning/controllers_server_actions_call.htm
*/

public with sharing class SimpleServerSideController {

    //Use @AuraEnabled to enable client- and server-side access to the method
    @AuraEnabled
    public static String serverEcho(String firstName) {
        return ('Hello from the server, ' + firstName);
    }
}