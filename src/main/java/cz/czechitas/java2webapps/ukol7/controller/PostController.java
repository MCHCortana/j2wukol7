package cz.czechitas.java2webapps.ukol7.controller;

import cz.czechitas.java2webapps.ukol7.entity.Post;
import cz.czechitas.java2webapps.ukol7.service.PostService;
import jakarta.validation.Valid;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PostController {

    PostService postService;

    public PostController(PostService postService) {
        this.postService = postService;
    }

//    NO pageable implemented example
//    @GetMapping("/")
//    public ModelAndView listPosts() {
//        ModelAndView modelAndView = new ModelAndView("posts");
//        return modelAndView.addObject("posts", postService.listPosts());
//    }

    @GetMapping("/")
    public ModelAndView listPosts(@RequestParam(name = "page", defaultValue = "0") int pageNumber) {
        ModelAndView modelAndView = new ModelAndView("posts");
        Pageable pageable = PageRequest.of(pageNumber, 2);
        Page<Post> page = postService.listPostsPage(pageable);
        modelAndView.addObject("posts", page.getContent());
        modelAndView.addObject("page", page);

        return modelAndView;
    }

    @GetMapping("/post/{slug}")
    public ModelAndView findPostBySlug(@PathVariable("slug") String slug) {
        ModelAndView modelAndView = new ModelAndView("post");
        return modelAndView.addObject("post", postService.getPostBySlug(slug));
    }

    @GetMapping("/addPost")
    public ModelAndView getAddNewPost() {
        ModelAndView modelAndView = new ModelAndView("addPost");
        modelAndView.addObject(new Post());
        return modelAndView;
    }

    @PostMapping("addPost")
    public Object addNewPost(@Valid @ModelAttribute("addPost") Post post, BindingResult bindingResult) {
        ModelAndView modelAndView = new ModelAndView("addPost");
        if (bindingResult.hasErrors()) {
            return "addPost";
        }
        postService
                .saveNewPost(post);
        return "redirect:/";
    }
}
