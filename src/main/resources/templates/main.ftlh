<#import "parts/common.ftlh" as c>

<@c.page>
    <div class="form-row" xmlns="http://www.w3.org/1999/html">
        <div class="form-group-col-md-6">
            <form method="get" action="/main" class="form-inline">
                <label><input type="text" name="filter" class="form-control" value="${filter!}"
                       placeholder="Search by tag" style="width: 230px;"></label>
                <button type="submit" class="btn btn-primary ms-2 mb-1">Search</button>
            </form>
        </div>
    </div>
    <a class="btn btn-primary mt-3" data-bs-toggle="collapse" href="#collapseAdding"
       role="button" aria-expanded="false" aria-controls="collapseAdding">
        <div>New message</div>
    </a>
    <div class="collapse <#if message??>show</#if>" id="collapseAdding">
        <div class="form-group mt-3">
            <form method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <textarea class="form-control ${(textError??)?string('is-invalid', '')}"
                           value="<#if message??>${message.text}</#if>" name="text"
                           placeholder="Input a message" style="height: 270px; width: 230px;"/></textarea>
                    <#if textError??>
                        <div class="invalid-feedback">
                            ${textError}
                        </div>
                    </#if>
                </div>
                <div class="form-group mt-3">
                    <input type="text" class="form-control ${(tagError??)?string('is-invalid', '')}"
                           value="<#if message??>${message.tag}</#if>" name="tag"
                           placeholder="Tag" style="width: 230px;"/>
                    <#if tagError??>
                        <div class="invalid-feedback">
                            ${tagError}
                        </div>
                    </#if>
                </div>
                <div class="form-group mt-3">
                    <input type="file" class="form-control" name="file" style="width: 230px;"/>
                </div>
                <div><input type="hidden" name="_csrf" value="${_csrf.token}"/></div>
                <div class="form-group mt-3">
                    <button type="submit" class="btn btn-primary">Send</button>
                </div>
            </form>
        </div>
    </div>
    <div class="row row-cols-1 row-cols-md-3 g-4 mt-3">
        <#list messages as message>
            <div class="col">
                <div class="card h-100">
                    <#if message.filename??>
                        <img src="/img/${message.filename}" class="card-img-top">
                    </#if>
                    <div class="card-body">
                        <p class="card-text">
                            <span>${message.text}</span>
                            <i>${message.tag}</i>
                        </p>
                    </div>
                    <div class="card-footer">
                        <small class="text-muted">${message.authorName}</small>
                    </div>
                </div>
            </div>
        <#else>
            <div>No messages</div>
        </#list>
    </div>
</@c.page>