package ru.itsyga.service_desk.service;

import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import ru.itsyga.service_desk.entity.Category;
import ru.itsyga.service_desk.repository.CategoryRepository;

@Service
@RequiredArgsConstructor
public class CategoryService {
    private final CategoryRepository categoryRepository;

    public Page<Category> getCategories(PageRequest pageRequest) {
        return categoryRepository.findAll(pageRequest);
    }

    public Page<Category> getCategoriesByName(String name, PageRequest pageRequest) {
        return categoryRepository.findCategoriesByNameContainsIgnoreCase(name, pageRequest);
    }
}