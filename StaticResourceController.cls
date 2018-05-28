/* Spring '18, v42.0
Building a Custom Controller | Visualforce Developer Guide | Salesforce Developers
https://developer.salesforce.com/docs/atlas.en-us.212.0.pages.meta/pages/pages_controller_custom.htm

visualforce - Read text file as a static resource and display in a VF page? - Salesforce Stack Exchange
https://salesforce.stackexchange.com/questions/41385/read-text-file-as-a-static-resource-and-display-in-a-vf-page
*/

public class StaticResourceController {
    private final StaticResource sr;

    public StaticResourceController() {
        sr = [SELECT Body FROM StaticResource WHERE Name = 'TextFile'];
    }

    public String getText() {
        return sr.Body.toString();
    }
}