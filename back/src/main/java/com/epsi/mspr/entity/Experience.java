package com.epsi.mspr.entity;
import jakarta.persistence.*;
import lombok.*;

import java.util.LinkedHashSet;
import java.util.Set;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "experiences")
public class Experience {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id; // Primary key

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_utilisateur")
    private Utilisateur idUtilisateur; // Foreign key

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "specialisation")
    private Specialisation specialisation;

    @Column(name = "annees_experience")
    private Integer anneesExperience;

    @OneToMany(mappedBy = "experience")
    private Set<Conseil> conseils = new LinkedHashSet<>();
}
