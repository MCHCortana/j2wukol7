package cz.czechitas.java2webapps.ukol7.service;

import cz.czechitas.java2webapps.ukol7.entity.Post;
import cz.czechitas.java2webapps.ukol7.repository.PostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.Random;

@Service
public class PostService {

    private PostRepository postRepository;

    @Autowired
    public PostService(PostRepository postRepository) {
        this.postRepository = postRepository;
    }

    public Page<Post> listPostsPage(Pageable pageable) {
        LocalDate today = LocalDate.now();
        return postRepository.findByPublishedIsNotNullAndPublishedLessThanEqualOrderByPublishedDesc(today, pageable);
    }

    public Post getPostBySlug(String slug) {
        return postRepository.findBySlug(slug);
    }

    public Post saveNewPost(Post post) {
        String slug = generateSlug(8);
        return postRepository
                .save(new Post(
                        slug,
                        post.getAuthor(),
                        post.getTitle(),
                        post.getPerex(),
                        post.getBody(),
                        LocalDate.now()));
    }

    static String generateSlug(Integer length) {
        Random random = new Random();
        String chars = "abcdefghijklmnopqrstuvwxyz0123456789";
        StringBuilder slugEndId = new StringBuilder();
        for (int i = 0; i < length; i++) {
            String newChar = Character.toString(chars.charAt(random.nextInt(36)));
            slugEndId.append(newChar);
        }

        return "post-" + random.nextInt() + slugEndId;
    }
}
