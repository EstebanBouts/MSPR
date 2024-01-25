package com.epsi.mspr.entity;

import jakarta.persistence.*;
import lombok.*;

import java.util.LinkedHashSet;
import java.util.Set;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "utilisateurs")
public class Utilisateur {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "nom", length = 100)
    private String nom;

    @Column(name = "email", length = 100)
    private String email;

    @Column(name = "mot_de_passe")
    private String motDePasse;

    @OneToMany(mappedBy = "idUtilisateur")
    private Set<Experience> experiences = new LinkedHashSet<>();

    @OneToMany(mappedBy = "idUtilisateur")
    private Set<Plante> plantes = new LinkedHashSet<>();

    @OneToMany(mappedBy = "idUtilisateur")
    private Set<SessionsGarde> sessionsGardes = new LinkedHashSet<>();

}