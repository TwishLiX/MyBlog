<#import "parts/common.ftlh" as c>

<@c.page>
    <div><h5><strong>User editor</strong></h5></div>
    <form action="/user" method="post">
        <div class="mt-3">
            <input type="text" class="form-control" name="username" style="width: 230px;" value="${user.username}">
            <#list roles as role>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox"
                           name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}
                </div>
            </#list>
            <input type="hidden" name="user_id" value="${user.id}">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <div class="mt-2">
                <button class="btn btn-primary" type="submit">Save</button>
            </div>
        </div>
    </form>
</@c.page>