package com.epsi.mspr.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.*;

import java.io.Serializable;
import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "utilisateurs")
public class Utilisateur implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "nom", length = 100)
    private String nom;

    @Column(name = "email", length = 100)
    private String email;

    @JsonIgnore // To protect sensitive information
    @Column(name = "mot_de_passe")
    private String motDePasse;

    @JsonIgnore // To avoid circular references in JSON serialization
    @OneToMany(mappedBy = "utilisateur")
    private Set<Experience> experiences = new LinkedHashSet<>();

    @JsonIgnore // To avoid circular references in JSON serialization
    @OneToMany(mappedBy = "utilisateur")
    private Set<Plante> plantes = new LinkedHashSet<>();

    @JsonIgnore // To avoid circular references in JSON serialization
    @OneToMany(mappedBy = "utilisateur")
    private Set<SessionsGarde> sessionsGardes = new LinkedHashSet<>();
}
