[#ftl]
[#import '_imports/_common.ftlh' as c]
[#import "/spring.ftl" as spring]

[@c.page pageTitle="Přidat článek"]
    <div class="container">
        <a href="/blog" class="back-link">← Zpět na blog</a>
        <h1>Přidat nový článek</h1>

        <form id="postForm" action="/addPost" method="POST">
            <div class="form-group">
                <label for="title">Nadpis článku</label>
                [@spring.formInput path="addPost.title" attributes='maxlength="200"' /]
                <div class="error">[@spring.showErrors "</br>"/]</div>
            </div>

            <div class="form-group">
                <label for="author">Autor</label>
                [@spring.formInput path="addPost.author" attributes='placeholder="Napiš svůj článek zde..."' /]
                <div class="error">[@spring.showErrors "</br>"/]</div>
            </div>

            <div class="form-group">
                <label for="perex">Perex</label>
                [@spring.formTextarea path="addPost.perex" attributes='placeholder="Napiš krátké summary článku"' /]
                <div class="error">[@spring.showErrors "</br>"/]</div>
            </div>

            <div class="form-group">
                <label for="body">Obsah článku</label>
                [@spring.formTextarea path="addPost.body" attributes='placeholder="Napiš svůj článek zde..."' /]
                <div class="error">[@spring.showErrors "</br>"/]</div>
            </div>

            <div class="form-group">
                <label for="date">Datum vydání članku</label>
                [@spring.formInput path="addPost.published" attributes='type="date"' /]
                <div class="error">[@spring.showErrors "</br>"/]</div>
            </div>

            <button type="submit">Uložit článek</button>
        </form>
    </div>
[/@c.page]