<#import "parts/common.ftlh" as c>

<@c.page>
    <h5>${username}</h5>
    ${message!}
    <form method="post">
        <div class="mb-3">
            <label class="form-label">Email</label>
            <div><label><input type="email" class="form-control" name="email" placeholder="some@some.com" value="${email!''}"/></label></div>
        </div>
        <div class="mb-3">
            <label class="form-label">Password</label>
            <div><label><input type="password" class="form-control" name="password" placeholder="Password"/></label></div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <div><button class="btn btn-primary" type="submit">Save</button></div>
    </form>
</@c.page>