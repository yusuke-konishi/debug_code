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
22:38:40.2 (1000370196)|USER_DEBUG|[7]|DEBUG|Status: OK
22:38:40.2 (1000480487)|USER_DEBUG|[8]|DEBUG|StatusCode: 200
22:38:40.2 (1000549444)|USER_DEBUG|[9]|DEBUG|Body: <library><book><author>Joe Smith</author><title>Chatty</title><isbn>1234567890</isbn></book><book><author>Carol Yang</author><title>Animal Shelter Volunteering</title><isbn>1111122222</isbn></book></library>
22:38:40.2 (1000729459)|USER_DEBUG|[12]|DEBUG|HeaderKeys: (Transfer-Encoding, Cache-Control, Server, Connection, Date, Via, Content-Type, X-Powered-By)
22:38:40.2 (1001026983)|USER_DEBUG|[14]|DEBUG|Transfer-Encoding: chunked
22:38:40.2 (1001097785)|USER_DEBUG|[14]|DEBUG|Cache-Control: no-cache
22:38:40.2 (1001158468)|USER_DEBUG|[14]|DEBUG|Server: Apache/2.4.10 (Unix)
22:38:40.2 (1001217892)|USER_DEBUG|[14]|DEBUG|Connection: keep-alive
22:38:40.2 (1001276036)|USER_DEBUG|[14]|DEBUG|Date: Sun, 25 Feb 2018 13:38:41 GMT
22:38:40.2 (1001369961)|USER_DEBUG|[14]|DEBUG|Via: 1.1 vegur
22:38:40.2 (1001471322)|USER_DEBUG|[14]|DEBUG|Content-Type: text/html; charset=UTF-8
22:38:40.2 (1001534872)|USER_DEBUG|[14]|DEBUG|X-Powered-By: PHP/5.6.5
*/