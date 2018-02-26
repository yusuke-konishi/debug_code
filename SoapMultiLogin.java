/* Spring '18, v42.0
login() | SOAP API Developer Guide | Salesforce Developers
https://developer.salesforce.com/docs/atlas.en-us.212.0.api.meta/api/sforce_api_calls_login.htm
*/

import com.sforce.soap.enterprise.EnterpriseConnection;
import com.sforce.soap.enterprise.GetUserInfoResult;
import com.sforce.ws.ConnectionException;
import com.sforce.ws.ConnectorConfig;
import java.time.LocalDateTime;

public class SoapMultiLogin {
    public static void main(String[] args) {
        for (int i = 1; i <= 10; i++) {
            try {
                ConnectorConfig config = new ConnectorConfig();
                config.setUsername("USERNAME");
                config.setPassword("PASSWORD");
                config.setAuthEndpoint("https://login.salesforce.com/services/Soap/c/24.0/");

                EnterpriseConnection connection = new EnterpriseConnection(config);

                GetUserInfoResult userInfo = connection.getUserInfo();
                System.out.println("UserName: " + userInfo.getUserName());
                System.out.println("SessionID: " + config.getSessionId());

                connection.logout();
            } catch (ConnectionException ce) {
                ce.printStackTrace();
            }
            System.out.println("SOAP Login #" + i + ": " + LocalDateTime.now());
        }
    }
}

/* Console
UserName: USERNAME
SessionID: SESSION_ID_#1
SOAP Login #1: 2018-02-26T23:20:51.859
UserName: USERNAME
SessionID: SESSION_ID_#2
SOAP Login #2: 2018-02-26T23:20:53.984
UserName: USERNAME
SessionID: SESSION_ID_#3
SOAP Login #3: 2018-02-26T23:20:56.645
...
UserName: USERNAME
SessionID: SESSION_ID_#10
SOAP Login #10: 2018-02-26T23:21:15.123
*/