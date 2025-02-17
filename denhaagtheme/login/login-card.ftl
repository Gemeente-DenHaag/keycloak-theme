<#macro loginCard provider providerData>
    <#assign imageSrc = "">
    <#assign footerSrc = "">
    <#assign providerType = "">
    <#if provider.displayName??>
        <#list providerData?keys as key>
            <#if provider.displayName?lower_case?contains(key)>
                <#assign providerType = key?replace(" ", "")>
                <#assign providerDataObj = providerData[key]>
                <#assign imageSrc = providerDataObj.imageUrl>
                <#assign footerSrc = providerDataObj.footerUrl>
            </#if>
        </#list>
    </#if>
    
    <#assign cardTitleLabel = msg(providerType + "LoginTitle")>
    <#assign cardSubTitleLabel = msg(providerType + "LoginSubTitle")>
    <#assign cardImageAltLabel = msg(providerType + "LogoAltText")>
    <#assign cardLinkButtonAltLabel = msg(providerType + "LoginLinkButtonAltTitle")>
    <#assign cardFooterLabel = msg(providerType + "FooterText")>
    <#assign cardFooterLinkLabel = msg(providerType + "FooterLinkText")>


    <section class="denhaag-card-authentication">
        <header class="denhaag-card-authentication__header">
            <hgroup class="denhaag-card-authentication__heading">
                <h3 class="utrecht-heading-3 denhaag-card-authentication__title">${cardTitleLabel}</h3>
                <p class="utrecht-paragraph denhaag-card-authentication__subtitle">${cardSubTitleLabel}</p>
            </hgroup>
            <#if imageSrc != "">
                <p class="denhaag-image denhaag-card-authentication__logo"><img width="80" height="80" src="${imageSrc}" class="denhaag-image__image" alt="${cardImageAltLabel}" loading="lazy"></p>
            </#if>
        </header>
        <div class="denhaag-card-authentication__cta">
            <div class="denhaag-button-group denhaag-button-group--single">
                <a id="${provider.alias}" class="denhaag-card-authentication__cta-link denhaag-button denhaag-button--large denhaag-button--primary-action denhaag-button--end-icon" href="${provider.loginUrl}" target="_self" title="${cardLinkButtonAltLabel}">
                    ${msg("loginButton")}
                    <span class="denhaag-button__icon">
                        <svg aria-hidden="true" class="denhaag-icon" focusable="false" height="1em" viewBox="0 0 24 24" width="1em" xmlns="http://www.w3.org/2000/svg">
                            <path d="M12.293 5.293a1 1 0 011.414 0l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414-1.414L16.586 13H5a1 1 0 110-2h11.586l-4.293-4.293a1 1 0 010-1.414z"></path>
                        </svg>
                    </span>
                </a>
            </div>
        </div>
        <#if footerSrc != "" || cardFooterLabel != cardFooterLabelKey>
            <footer class="denhaag-card-authentication__footer">
                <p class="utrecht-paragraph">
                    ${cardFooterLabel}
                    <br />
                    <#if footerSrc != "">
                        <a href="${footerSrc}" class="denhaag-link denhaag-link--with-icon denhaag-link--with-icon-end denhaag-link--external">
                            <span class="denhaag-link__icon">
                                <svg width="1em" height="1em" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="denhaag-icon" focusable="false" aria-hidden="true" shape-rendering="auto">
                                    <path d="M14 5C13.4477 5 13 4.55228 13 4C13 3.44772 13.4477 3 14 3H20C20.2652 3 20.5196 3.10536 20.7071 3.29289C20.8946 3.48043 21 3.73478 21 4L21 10C21 10.5523 20.5523 11 20 11C19.4477 11 19 10.5523 19 10L19 6.41422L9.70711 15.7071C9.31658 16.0976 8.68342 16.0976 8.29289 15.7071C7.90237 15.3166 7.90237 14.6834 8.29289 14.2929L17.5858 5H14ZM3 7C3 5.89543 3.89543 5 5 5H10C10.5523 5 11 5.44772 11 6C11 6.55228 10.5523 7 10 7H5V19H17V14C17 13.4477 17.4477 13 18 13C18.5523 13 19 13.4477 19 14V19C19 20.1046 18.1046 21 17 21H5C3.89543 21 3 20.1046 3 19V7Z" fill="currentColor"></path>
                                </svg>
                            </span>
                            <span class="denhaag-link__label">${cardFooterLinkLabel}</span>
                        </a>
                    </#if>
                </p>
            </footer>
        </#if>
    </section>
</#macro>
