package ru.itsyga.service_desk.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "ticket")
public class Ticket {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false, unique = true)
    private Long id;

    @Column(name = "number", length = 9, nullable = false, unique = true)
    private String number;

    @ManyToOne(optional = false)
    @JoinColumn(name = "feedback_id", nullable = false)
    private Feedback feedback;
}