<#import "login-card.ftl" as render>

<#macro cardGroup providers providersData>
    <div class="denhaag-card-group denhaag-card-group--responsive denhaag-card-group--distanced">
        <#list providers as p>
            <@render.loginCard provider=p providerData=providersData />
        </#list>
    </div>
</#macro>
