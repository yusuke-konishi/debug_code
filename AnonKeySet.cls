/* Spring '18, v42.0
Map Class | Apex Developer Guide | Salesforce Developers
https://developer.salesforce.com/docs/atlas.en-us.212.0.apexcode.meta/apexcode/apex_methods_system_map.htm
*/

Map<String, String> colorCodes = new Map<String, String>();

colorCodes.put('Red', 'FF0000');
colorCodes.put('Blue', '0000A0');

Set <String> colorSet = new Set<String>();
colorSet = colorCodes.keySet();

System.debug('colorCodes: ' + colorCodes);
System.debug('colorSet: ' + colorSet);

/* USER_DEBUG
19:12:54.2 (3575755)|USER_DEBUG|[9]|DEBUG|colorCodes: {Blue=0000A0, Red=FF0000}
19:12:54.2 (3642224)|USER_DEBUG|[10]|DEBUG|colorSet: {Blue, Red}
*/