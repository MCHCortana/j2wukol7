[#ftl]
[#import '_imports/_common.ftlh' as c]
[@c.page pageTitle="Přidat článek"]
    <div class="container">
        <a href="/blog" class="back-link">← Zpět na blog</a>
        <h1>Přidat nový článek</h1>

        <form id="postForm" action="/addPost" method="POST">
            <div class="form-group">
                <label for="title">Nadpis článku *</label>
                <input type="text" id="title" name="title" required maxlength="200">
            </div>

            <div class="form-group">
                <label for="author">Autor</label>
                <input type="auhor" id="author" name="author" required placeholder="Napiš svůj článek zde..." />
            </div>

            <div class="form-group">
                <label for="perex">Perex</label>
                <textarea id="perex" name="perex" required placeholder="Napiš krátké summary clánku" ></textarea>
            </div>

            <div class="form-group">
                <label for="body">Obsah článku</label>
                <textarea type="text" id="body" name="body" required placeholder="Napiš svůj článek zde..."></textarea>
            </div>

            <div class="form-group">
                <label for="date">Datum vydání članku</label>
                <input type="date" id="date" name="date" required/>
            </div>
            
            <button type="submit">Uložit článek</button>
        </form>
    </div>
[/@c.page]