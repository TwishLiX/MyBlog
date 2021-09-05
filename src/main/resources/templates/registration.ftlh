<#import "parts/common.ftlh" as c>
<#import "parts/log.ftlh" as l>

<@c.page>
    <div class="mb-3">
        <strong>Register an account</strong>
    </div>
    ${message!}
    <@l.login "/registration" true />
</@c.page>