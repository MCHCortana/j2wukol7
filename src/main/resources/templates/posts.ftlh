[#ftl]
[#import '_imports/_common.ftlh' as c]
[@c.page pageTitle="Blogujeme"]
<main class="container">
    <h1>Můj Blog</h1>

    <section class="posts">
        [#list posts as post]
            <a href="/post/${post.slug}">
            <article class="post">
                <span class="badge badge--published">Published</span>
                <h2>${post.title}</h2>
                <p class="published-date">Published on ${post.published?string("dd.MM.yyyy")}</p>
                <p class="perex">${post.perex?no_esc}</p>
            </article>
            </a>
        [/#list]
    </section>

    <nav class="pagination">
        [#if page.hasPrevious()]
            <a class="pagination__link" href="?page=${page.number - 1}">← Předchozí</a>
        [/#if]

        <span class="pagination__current">Stránka ${page.number + 1}</span>

        [#if page.hasNext()]
            <a class="pagination__link" href="?page=${page.number + 1}">Další →</a>
        [/#if]
    </nav>
</main>
[/@c.page]
