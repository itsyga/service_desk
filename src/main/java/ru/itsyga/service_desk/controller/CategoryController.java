package ru.itsyga.service_desk.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PagedModel;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import ru.itsyga.service_desk.entity.Category;
import ru.itsyga.service_desk.service.CategoryService;

import java.util.Optional;

@RestController
@RequestMapping("/api/categories")
@RequiredArgsConstructor
public class CategoryController {
    private final CategoryService categoryService;

    @GetMapping
    public ResponseEntity<PagedModel<Category>> getCategories(
            @RequestParam Optional<String> name,
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "15") int size,
            @RequestParam(name = "sort_by", defaultValue = "id") String sortBy,
            @RequestParam(defaultValue = "asc") String order) {
        var pageRequest = PageRequest.of(page, size, Sort.by(Sort.Direction.fromString(order), sortBy));
        return ResponseEntity.ok(
                name.map(categoryName ->
                        new PagedModel<>(categoryService.getCategoriesByName(categoryName, pageRequest))
                ).orElseGet(() ->
                        new PagedModel<>(categoryService.getCategories(pageRequest)))
        );
    }
}