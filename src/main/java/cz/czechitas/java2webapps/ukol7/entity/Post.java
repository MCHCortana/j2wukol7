package cz.czechitas.java2webapps.ukol7.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

import java.math.BigInteger;
import java.time.LocalDate;

@Entity
public class Post {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private BigInteger id;
    private String slug;
    @NotBlank
    @NotNull(message = "Zadej jmeno autora")
    private String author;

    @NotBlank
    @NotNull(message = "Zadej jmeno název")
    private String title;

    @NotBlank
    @NotNull(message = "Zadej krátky text o članku")
    private String perex;

    @NotBlank
    @NotNull(message = "Mužeš psát článek")
    private String body;
    @NotNull(message = "Zadej datum vydání článku")
    private LocalDate published;

    public Post() {
    }

    public Post(String slug,
                String author,
                String title,
                String perex,
                String body,
                LocalDate published) {
        this.slug = slug;
        this.author = author;
        this.title = title;
        this.perex = perex;
        this.body = body;
        this.published = published;
    }

    public BigInteger getId() {
        return id;
    }

    public void setId(BigInteger id) {
        this.id = id;
    }

    public String getSlug() {
        return slug;
    }

    public void setSlug(String slug) {
        this.slug = slug;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getPerex() {
        return perex;
    }

    public void setPerex(String perex) {
        this.perex = perex;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public LocalDate getPublished() {
        return published;
    }

    public void setPublished(LocalDate published) {
        this.published = published;
    }
}