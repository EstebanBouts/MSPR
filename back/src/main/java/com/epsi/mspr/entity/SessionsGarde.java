package com.epsi.mspr.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.*;

import java.io.Serializable;
import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "sessions_garde")
public class SessionsGarde implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_session", nullable = false)
    private Integer id;

    @JsonIgnore // Prevents the lazy-loaded 'plante' from being serialized
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_plante")
    private Plante plante;

    @JsonIgnore // Prevents the lazy-loaded 'utilisateur' from being serialized
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_utilisateur")
    private Utilisateur utilisateur;

    @Column(name = "date_debut")
    private Date dateDebut;

    @Column(name = "date_fin")
    private Date dateFin;

    @Lob
    @Column(name = "commentaires")
    private String commentaires;

}
