<#import "alert-message-icon.ftl" as icon>

<#macro showAlert message>

    <#--  Accept only the known types, otherwise default to warning.  -->
    <#assign type = message.type>
    <#if type != 'success' && type != 'info' && type != 'warning' && type != 'error'>
        <#assign type = "warning">
    </#if>
        

    <div class="denhaag-alert denhaag-alert--${type}">
        <div class="denhaag-alert__main-content">
            <div class="denhaag-alert__icon">
                <#if type = 'success'>
                    <@icon.success />
                <#elseif type = 'info'>
                    <@icon.info />
                <#elseif type = 'error'>
                    <@icon.error />
                <#else>
                    <@icon.warning />
                </#if>
            </div>
            <div class="denhaag-alert__content">
                <h4 class="utrecht-heading-4">${kcSanitize(message.summary)?no_esc}</h4>
            </div>
        </div>
    </div>
</#macro>
