<!-- Summer '18, v43.0
Apex Server-Side Controller Overview | Lightning Components Developer Guide | Salesforce Developers
https://developer.salesforce.com/docs/atlas.en-us.214.0.lightning.meta/lightning/controllers_server_apex.htm

Calling a Server-Side Action | Lightning Components Developer Guide | Salesforce Developers
https://developer.salesforce.com/docs/atlas.en-us.214.0.lightning.meta/lightning/controllers_server_actions_call.htm
-->

<aura:application controller="SimpleServerSideController">
    <aura:attribute name="firstName" type="String" default="world"/>
    <lightning:button label="Call server" onclick="{!c.echo}"/>
</aura:application>