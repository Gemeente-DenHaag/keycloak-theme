<#import "denhaag-logo.ftl" as denhaag>
<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false showAnotherWayIfPresent=true>
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml" class="${properties.kcHtmlClass!}">

        <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width,initial-scale=1">
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <meta name="robots" content="noindex, nofollow">

            <#if properties.meta?has_content>
                <#list properties.meta?split(' ') as meta>
                    <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
                </#list>
            </#if>
            <title>${msg("loginTitle",(realm.displayName!''))}</title>
            <link rel="icon" href="${url.resourcesPath}/img/favicon-196.png" />
            <#if properties.stylesCommon?has_content>
                <#list properties.stylesCommon?split(' ') as style>
                    <link href="${url.resourcesCommonPath}/${style}" rel="stylesheet" />
                </#list>
            </#if>
            <#if properties.styles?has_content>
                <#list properties.styles?split(' ') as style>
                    <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
                </#list>
            </#if>
            <#if properties.scripts?has_content>
                <#list properties.scripts?split(' ') as script>
                    <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
                </#list>
            </#if>
            <#if scripts??>
                <#list scripts as script>
                    <script src="${script}" type="text/javascript"></script>
                </#list>
            </#if>
        </head>

        <body class="denhaag-theme utrecht-document">
            <div class="denhaag-page">
                <div class="denhaag-page-header">
                    <header id="site-header" class="denhaag-header">
                        <div class="denhaag-responsive-content">
                            <div class="denhaag-header__content">
                                <div className="denhaag-header__logo">
                                    <a class="denhaag-logo denhaag-header__link" href="https://www.denhaag.nl" aria-label="Gemeente Den Haag">
                                        <@denhaag.logo />
                                    </a>
                                </div>
                            </div>
                        </div>

                        <nav class="denhaag-breadcrumb" aria-label="Breadcrumb">
                            <div class="denhaag-responsive-content">
                                <ol class="denhaag-breadcrumb__list" itemscope itemtype="https://schema.org/BreadcrumbList">
                                    <li
                                        class="denhaag-breadcrumb__item"
                                        itemscope
                                        itemtype="https://schema.org/ListItem"
                                        itemprop="itemListElement"
                                    >
                                        <a class="denhaag-breadcrumb__link" href="https://denhaag.nl/" itemprop="item">
                                            <span class="denhaag-breadcrumb__text" itemprop="name">
                                                ${msg("breadcrumbHomeLabel")}
                                            </span>
                                            <svg
                                                width="1em"
                                                height="1em"
                                                viewBox="0 0 24 24"
                                                fill="none"
                                                xmlns="http://www.w3.org/2000/svg"
                                                class="denhaag-icon"
                                                focusable="false"
                                                aria-hidden="true"
                                                shape-rendering="auto"
                                            >
                                                <path
                                                d="M9.293 18.707a1 1 0 010-1.414L14.586 12 9.293 6.707a1 1 0 011.414-1.414l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414 0z"
                                                fill="currentColor"
                                                ></path>
                                            </svg>
                                            <meta itemprop="position" content="1" />
                                        </a>
                                    </li>
                                    <li
                                        class="denhaag-breadcrumb__item"
                                        itemscope
                                        itemtype="https://schema.org/ListItem"
                                        itemprop="itemListElement"
                                        aria-current="page"
                                    >
                                        <a
                                            class="denhaag-breadcrumb__link denhaag-breadcrumb__link--current"
                                            itemprop="item"
                                            aria-current="page"
                                        >
                                            <span class="denhaag-breadcrumb__text" itemprop="name">
                                                ${msg("breadcrumbPageTitle")}
                                            </span>
                                            <meta itemprop="position" content="2" />
                                        </a>
                                    </li>
                                </ol>
                            </div>
                        </nav>
                    </header>
                </div>
                <div class="denhaag-page-content">
                    <main class="denhaag-page-content__main">
                        <div class="denhaag-responsive-content">
                            <#-- App-initiated actions should not see warning messages about the need to complete the action -->
                            <#-- during login. -->
                            <#if displayMessage && message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
                                <@alertMessage.showAlert message />
                            </#if>
                            <#--  Render the login.ftl template  -->
                            <#nested "form">
                        </div>
                    </main>
                </div>
            </div>
        </body>
    </html>
</#macro>
