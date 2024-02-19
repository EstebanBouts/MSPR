package com.epsi.mspr.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;
import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "experiences")
public class Experience implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id; // Primary key

    @JsonIgnore // Already applied, to ignore the 'utilisateur' foreign key
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_utilisateur")
    private Utilisateur utilisateur; // Foreign key

    @JsonIgnore // To ignore the 'specialisation' in JSON serialization
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "specialisation")
    private Specialisation specialisation;

    @Column(name = "annees_experience")
    private Integer anneesExperience;

    @JsonIgnore // To ignore the 'conseils' relationship in JSON serialization
    @OneToMany(mappedBy = "experience")
    private Set<Conseil> conseils = new LinkedHashSet<>();
}
