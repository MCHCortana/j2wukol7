[#ftl]
[#import '_imports/_common.ftlh' as c]
[#import "/spring.ftl" as spring]

[@c.page pageTitle="Přidat článek"]
    <div class="container">
        <a href="/" class="back-link">← Zpět na blog</a>
        <h1>Přidat nový článek</h1>

        <form id="postForm" class="post" action="/addPost" method="POST" class="form">
            <div class="form-group">
                <label class="form-label" for="title">Nadpis článku</label>
                [@spring.formInput path="addPost.title" attributes='maxlength="200" class="form-input"' /]
                <div class="error">[@spring.showErrors "<br>"/]</div>
            </div>

            <div class="form-group">
                <label class="form-label" for="author">Autor</label>
                [@spring.formInput path="addPost.author" attributes='placeholder="Napiš svůj článek zde..." class="form-input"' /]
                <div class="error">[@spring.showErrors "<br>"/]</div>
            </div>

            <div class="form-group">
                <label class="form-label" for="perex">Perex</label>
                [@spring.formTextarea path="addPost.perex" attributes='placeholder="Napiš krátké summary článku" class="form-textarea"' /]
                <div class="error">[@spring.showErrors "<br>"/]</div>
            </div>

            <div class="form-group">
                <label class="form-label" for="body">Obsah článku</label>
                [@spring.formTextarea path="addPost.body" attributes='placeholder="Napiš svůj článek zde..." class="form-textarea"' /]
                <div class="error">[@spring.showErrors "<br>"/]</div>
            </div>

            <div class="form-group">
                <label class="form-label" for="date">Datum vydání článku</label>
                [@spring.formInput path="addPost.published" fieldType="date" attributes='class="form-input"' /]
                <div class="error">[@spring.showErrors "<br>"/]</div>
            </div>

            <button class="btn-submit" type="submit">Uložit článek</button>
        </form>
    </div>
[/@c.page]
