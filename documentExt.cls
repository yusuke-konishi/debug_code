/* Spring '18, v42.0
apex:inputFile | Visualforce Developer Guide | Salesforce Developers
https://developer.salesforce.com/docs/atlas.en-us.212.0.pages.meta/pages/pages_compref_inputFile.htm

File Size Limits in Salesforce
https://help.salesforce.com/articleView?id=collab_files_size_limits.htm&type=5
*/

public class documentExt {
    public documentExt(ApexPages.StandardController controller) {
        Document d = (Document) controller.getRecord();
        d.folderid = UserInfo.getUserId(); //this puts it in My Personal Documents
    }
}

/*
(If the larger file is uploaded,)
- This file exceeds the maximum size limit of 5MB.
- Document Name: Required fields are missing: [Document Name]
*/