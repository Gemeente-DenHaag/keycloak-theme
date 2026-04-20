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
                <h4 class="utrecht-heading-4">${kcSanitize(message.title)?no_esc}</h4>
                <#if message.text?has_content>
                    <p class="nl-paragraph">${kcSanitize(message.text)?no_esc}</p>
                </#if>
                <#if message.listItems?? && message.listItems?size gt 0>
                    <ul role="list" class="utrecht-unordered-list denhaag-unordered-list">
                        <#list message.listItems as listItem>
                            <li class="utrecht-unordered-list__item denhaag-unordered-list__item">${kcSanitize(listItem)?no_esc}</li>
                        </#list>
                    </ul>
                </#if>
            </div>
        </div>
    </div>
</#macro>
