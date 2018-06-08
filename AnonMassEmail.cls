/* Spring '18, v42.0
MassEmailMessage Class | Apex Developer Guide | Salesforce Developers
https://developer.salesforce.com/docs/atlas.en-us.212.0.apexcode.meta/apexcode/apex_classes_email_outbound_mass.htm

SingleEmailMessage Methods | Apex Developer Guide | Salesforce Developers
https://developer.salesforce.com/docs/atlas.en-us.212.0.apexcode.meta/apexcode/apex_classes_email_outbound_single.htm
*/

Messaging.MassEmailMessage message = new Messaging.MassEmailMessage();
ID[] userIds = new ID[]{'USER RECORD ID #1', 'USER RECORD ID #2', 'USER RECORD ID #3'};

message.setTargetObjectIds(userIds);
message.setTemplateId('TEMPLATE RECORD ID');
message.setSaveAsActivity(false);  // needed if User IDs are specified in setTargetObjectIds()

Messaging.MassEmailMessage[] messages = new Messaging.MassEmailMessage[] {message};
Messaging.sendEmail(messages);