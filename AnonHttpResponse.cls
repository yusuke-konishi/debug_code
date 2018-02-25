/* v42.0
HttpResponse Class | Apex Developer Guide | Salesforce Developers
https://developer.salesforce.com/docs/atlas.en-us.212.0.apexcode.meta/apexcode/apex_classes_restful_http_httpresponse.htm
*/

Http http = new Http();
HttpRequest req = new HttpRequest();
req.setEndpoint('https://docsample.herokuapp.com/xmlSample');
req.setMethod('GET');
HttpResponse res = http.send(req);

System.debug('Status: ' + res.getStatus());
System.debug('StatusCode: ' + res.getStatusCode());
System.debug('Body: ' + res.getBody());

String[] keys = res.getHeaderKeys();
System.debug('HeaderKeys: ' + keys);
for(String key: keys) {
    System.debug(key + ': ' + res.getHeader(key));
}

/* USER_DEBUG
12:35:49.1 (957831470)|USER_DEBUG|[15]|DEBUG|Status: OK
12:35:49.1 (957947848)|USER_DEBUG|[16]|DEBUG|StatusCode: 200
12:35:49.1 (958019559)|USER_DEBUG|[17]|DEBUG|Body: <library><book><author>Joe Smith</author><title>Chatty</title><isbn>1234567890</isbn></book><book><author>Carol Yang</author><title>Animal Shelter Volunteering</title><isbn>1111122222</isbn></book></library>
12:35:49.1 (958197771)|USER_DEBUG|[18]|DEBUG|HeaderKeys: (Transfer-Encoding, Cache-Control, Server, Connection, Date, Via, Content-Type, X-Powered-By)
12:35:49.1 (958433517)|USER_DEBUG|[21]|DEBUG|Transfer-Encoding: chunked
12:35:49.1 (958518085)|USER_DEBUG|[21]|DEBUG|Cache-Control: no-cache
12:35:49.1 (958586936)|USER_DEBUG|[21]|DEBUG|Server: Apache/2.4.10 (Unix)
12:35:49.1 (958651460)|USER_DEBUG|[21]|DEBUG|Connection: keep-alive
12:35:49.1 (958714853)|USER_DEBUG|[21]|DEBUG|Date: Sun, 25 Feb 2018 03:35:50 GMT
12:35:49.1 (958778227)|USER_DEBUG|[21]|DEBUG|Via: 1.1 vegur
12:35:49.1 (958842074)|USER_DEBUG|[21]|DEBUG|Content-Type: text/html; charset=UTF-8
12:35:49.1 (958906303)|USER_DEBUG|[21]|DEBUG|X-Powered-By: PHP/5.6.5
*/