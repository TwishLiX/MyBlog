<#import "parts/common.ftlh" as c>
<#import "parts/log.ftlh" as l>

<@c.page>
    <#if Session?? && Session.SPRING_SECURITY_LAST_EXCEPTION?? && !(message??)>
        <div class="alert alert-danger" role="alert" style="display:inline-block;">
            ${Session.SPRING_SECURITY_LAST_EXCEPTION.message}
        </div>
    </#if>
    <#if message??>
        <div class="alert alert-${messageType}" role="alert" style="display:inline-block;">
            ${message}
        </div>
    </#if>
    <div class="mb-3">
        <strong>Sign in to MyBlog</strong>
    </div>
    <@l.login "/login" false />
    <div class="mt-3">New to MyBlog? <a href="/registration">Create an account.</a></div>
</@c.page>