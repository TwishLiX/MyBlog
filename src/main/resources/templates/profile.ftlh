<#import "parts/common.ftlh" as c>

<@c.page>
    <h5><strong>${username}</strong></h5>
    ${message!}
    <form method="post">
        <div class="mb-3">
            <label class="form-label">Email</label>
            <div><input type="email" class="form-control" name="email" style="width: 230px;"
                               placeholder="some@some.com" value="${email!''}"/></div>
        </div>
        <div class="mb-3">
            <label class="form-label">Password</label>
            <div><input type="password" class="form-control" name="password"
                        style="width: 230px;" placeholder="Password"/></div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <div><button class="btn btn-primary" type="submit">Save</button></div>
    </form>
</@c.page>