<#import "parts/common.ftlh" as c>

<@c.page>
    <div><h5><strong>List of users</strong></h5></div>
    <table class="table table-striped table-bordered" style="width: 350px;">
        <thead>
        <tr>
            <th scope="col" style="width: 160px;">Name</th>
            <th scope="col" style="width: 120px;">Role</th>
            <th scope="col" style="width: 70px;">Action</th>
        </tr>
        </thead>
        <tbody>
        <#list users as user>
            <tr>
                <td>${user.username}</td>
                <td><#list user.roles as role>${role}<#sep>, </#list></td>
                <td><a href="/user/${user.id}" role="button" class="btn btn-primary">Edit</a></td>
            </tr>
        </#list>
        </tbody>
    </table>
</@c.page>