<#include "security.ftlh">

<#macro login path isRegisterForm>
    <form action="${path}" method="post">
        <div class="mb-3">
            <label class="form-label">Username</label>
            <input type="text" class="form-control ${(usernameError??)?string('is-invalid', '')}"
                               name="username" value="<#if user??>${user.username}</#if>"
                               placeholder="Username" style="width: 230px;"/>
            <#if usernameError??>
                <div class="invalid-feedback">
                    ${usernameError}
                </div>
            </#if>
        </div>
        <#if isRegisterForm>
            <div class="mb-3">
                <label class="form-label">Email</label>
                <input type="email" class="form-control ${(emailError??)?string('is-invalid', '')}"
                                   name="email" value="<#if user??>${user.email}</#if>"
                                   placeholder="some@some.com" style="width: 230px;"/>
                <#if emailError??>
                    <div class="invalid-feedback">
                        ${emailError}
                    </div>
                </#if>
            </div>
        </#if>
        <div class="mb-3">
            <label class="form-label">Password</label>
            <input type="password" class="form-control ${(passwordError??)?string('is-invalid', '')}"
                               name="password" placeholder="Password" style="width: 230px;"/>
            <#if passwordError??>
                <div class="invalid-feedback">
                    ${passwordError}
                </div>
            </#if>
        </div>
        <#if isRegisterForm>
            <div class="mb-3">
                <label class="form-label">Retype password</label>
                <input type="password" class="form-control ${(password2Error??)?string('is-invalid', '')}"
                                   name="password2" placeholder="Retype password" style="width: 230px;"/>
                <#if password2Error??>
                    <div class="invalid-feedback">
                        ${password2Error}
                    </div>
                </#if>
            </div>
            <div class="mb-3">
                <div class="g-recaptcha"
                     data-sitekey="6LcXaEccAAAAAF1Ma--o7EbND6JGTkINEEUKAGCs" data-size="compact"></div>
                <#if captchaError??>
                    <div class="alert alert-danger mb-3" role="alert" style="width: 157px;">
                        ${captchaError}
                    </div>
                </#if>
            </div>
        </#if>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <div><button class="btn btn-primary" type="submit"><#if isRegisterForm>Sign up<#else>Sign in</#if></button></div>
    </form>
</#macro>

<#macro logout>
    <#if isActive>
        <form action="/logout" method="post">
            <div><input type="hidden" name="_csrf" value="${_csrf.token}"/></div>
            <div><button class="btn btn-primary" type="submit">Sign out</button></div>
        </form>
    </#if>
</#macro>