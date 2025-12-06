[#ftl]
[#import '_imports/_common.ftlh' as c]
[@c.page pageTitle="${post.title}"]
    <main class="container">
        <section class="posts">
            <article class="post">
                <h2><a href="#">${post.title}</a></h2>
                <p class="published-date">Published on ${post.published?string("dd.MM.yyyy")}</p>
                <p class="perex">${post.perex?no_esc}</p>
                <span class="badge badge--published">Published</span>
            </article>
        </section>
        <nav class="pagination">
            <a class="pagination__link" href="/">← Zpět na výpis</a>
        </nav>
    </main>
[/@c.page]