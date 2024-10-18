package ru.itsyga.service_desk.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import ru.itsyga.service_desk.entity.Category;

public interface CategoryRepository extends JpaRepository<Category, Integer> {
    Page<Category> findCategoriesByNameContainsIgnoreCase(String name, Pageable pageable);
}