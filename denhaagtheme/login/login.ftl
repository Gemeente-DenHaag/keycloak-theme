<#import "template.ftl" as layout>
<#import "card-group.ftl" as render>
<#import "alert-message.ftl" as alertMessage>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        ${msg("loginAccountTitle")}
    <#elseif section = "form">
        <#if realm.password && social.providers??>
            <#-- Create an object with all providers and image locations -->
            <#assign digidImg = "${url.resourcesPath}/img/digid.svg">
            <#assign eHerkenningImg = "${url.resourcesPath}/img/eherkenning.png">
            <#assign eidasImg = "${url.resourcesPath}/img/eidas.svg">

            <#assign digid = "digid">
            <#assign digidMachtigen = "digid machtigen">
            <#assign eHerkenning = "eherkenning">
            <#assign eHerkenningBewindvoering = "eherkenning bewindvoering">
            <#assign eidas = "eidas">
            <#assign containsAuthorisedRegex = ".*(machtigen|bewindvoering).*">
            <#assign digidObj = {"imageUrl": digidImg, "footerUrl": "https://digid.nl "}>
            <#assign digidMachtigenObj = {"imageUrl": digidImg, "footerUrl": "https://machtigen.digid.nl "}>
            <#assign eHerkenningObj = {"imageUrl": eHerkenningImg, "footerUrl": "https://eherkenning.nl/nl/eherkenning-aanvragen"}>
            <#assign eHerkenningBewindvoeringObj = {"imageUrl": eHerkenningImg, "footerUrl": "https://bvd.mev.logius.nl/bewind/faq"}>
            <#assign eidasObj = {"imageUrl": eidasImg, "footerUrl": "https://www.government.nl/topics/online-access-to-public-services-european-economic-area-eidas/everything-you-need-to-know-about-eidas"}>
            <#assign staticProviderData = {digid: digidObj, eHerkenning: eHerkenningObj, eidas: eidasObj}>
            <#assign staticAuthorisedProviderData = {digidMachtigen: digidMachtigenObj, eHerkenningBewindvoering: eHerkenningBewindvoeringObj, eidas: eidasObj}>
            <#assign authorisedInfoNotification = {"type": "info", "summary": msg("authorisedNotification")}>

            <#-- Based on the current situation, where authorised provider aliases contains 'machtigen' or 'bewindvoering' -->
            <#assign normalProviders = []>
            <#assign authorisedProviders = []>
            <#list social.providers as p>
                <#if p.alias?matches(containsAuthorisedRegex)>
                    <#assign authorisedProviders = authorisedProviders + [p]>
                <#else>
                    <#assign normalProviders = normalProviders + [p]>
                </#if>
            </#list>

            <#-- First render the authentication cards for the normal providers  -->
            <#if normalProviders?size != 0>
                <h2 class="utrecht-heading-2">${msg("loginTitle")}</h2>
                <#if authorisedProviders?size != 0>
                    <p class="utrecht-paragraph">${msg("loginSubTitle")} <a href="#gemachtigde-heading" class="denhaag-link"><span class="denhaag-link__label">${msg("loginSubTitleLinkText")}</span></a>${msg("loginSubTitlePostLink")}</p>
                </#if>
                <@render.cardGroup providers=normalProviders providersData=staticProviderData />
            </#if>
            <#-- Render the authentication cards for the authorised providers  -->
            <#if authorisedProviders?size != 0>
                <h2 class="utrecht-heading-2" id="gemachtigde-heading">${msg("authorisedLoginTitle")}</h2>
                <@alertMessage.showAlert message=authorisedInfoNotification />
                <@render.cardGroup providers=authorisedProviders providersData=staticAuthorisedProviderData/>
            </#if>
        </#if>
    </#if>

</@layout.registrationLayout>
