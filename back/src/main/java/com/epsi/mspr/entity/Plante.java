package com.epsi.mspr.entity;

import jakarta.persistence.*;
import lombok.*;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "plantes")
public class Plante implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_plante", nullable = false)
    private Integer id;

    @Column(name = "nom", length = 100)
    private String nom;

    @Column(name = "type", length = 100)
    private String type;

    @Lob
    @Column(name = "instructions_soin")
    private String instructionsSoin;

    @ManyToOne()
    @JoinColumn(name = "id_utilisateur")
    private Utilisateur utilisateur;

    @OneToMany(mappedBy = "plante")
    private Set<Conseil> conseils = new HashSet<>();

    @OneToMany(mappedBy = "plante")
    private Set<SessionsGarde> sessionsGardes = new HashSet<>();

}