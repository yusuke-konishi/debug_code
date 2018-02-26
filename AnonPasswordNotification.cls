/* Spring '18, v42.0
Datetime Class | Apex Developer Guide | Salesforce Developers
https://developer.salesforce.com/docs/atlas.en-us.212.0.apexcode.meta/apexcode/apex_methods_system_datetime.htm

I need to send an email reminder to users before 10 days from their password exp - Answers - Salesforce Trailblazer Community
https://success.salesforce.com/answers?id=90630000000gwaAAAQ
*/

Integer PasswordExpirationDays = 90;
Integer NotificationDaysBefore = 7;

// Notify if BaseDate < LastPasswordChangeDate < BaseDatePlus
Datetime BaseDate = Datetime.now().addDays(NotificationDaysBefore - PasswordExpirationDays);
Datetime BaseDatePlus = BaseDate.addDays(1);

System.debug('BaseDate: ' + BaseDate);
System.debug('BaseDatePlus: ' + BaseDatePlus);

User[] userList = [
    SELECT Id, Name, Email, LastPasswordChangeDate 
    FROM User 
    WHERE LastPasswordChangeDate > :BaseDate AND LastPasswordChangeDate < :BaseDatePlus
];
System.debug(userList);

for (User user : userList) {
    System.debug('Name: ' + user.Name);
    System.debug('Email: ' + user.Email);
    System.debug('LastPasswordChangeDate: ' + user.LastPasswordChangeDate);
    System.debug('Password Expiration Date: ' + user.LastPasswordChangeDate.addDays(PasswordExpirationDays));
}

/* USER_DEBUG
23:17:22.1 (2164484)|USER_DEBUG|[8]|DEBUG|BaseDate: 2017-12-04 14:17:22
23:17:22.1 (2229876)|USER_DEBUG|[9]|DEBUG|BaseDatePlus: 2017-12-05 14:17:22
23:17:22.1 (12522004)|USER_DEBUG|[16]|DEBUG|(User:{Id=USER_RECORD_ID, Name=LASTNAME FIRSTNAME, Email=EMAIL_ADDRESS, LastPasswordChangeDate=2017-12-05 00:36:44})
23:17:22.1 (12884539)|USER_DEBUG|[19]|DEBUG|Name: LASTNAME FIRSTNAME
23:17:22.1 (12925270)|USER_DEBUG|[20]|DEBUG|Email: EMAIL_ADDRESS
23:17:22.1 (13012717)|USER_DEBUG|[21]|DEBUG|LastPasswordChangeDate: 2017-12-05 00:36:44
23:17:22.1 (13111565)|USER_DEBUG|[22]|DEBUG|Password Expiration Date: 2018-03-05 00:36:44
*/