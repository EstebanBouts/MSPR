package com.epsi.mspr.entity;

import jakarta.persistence.*;
import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "conseils")
public class Conseil {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_conseil", nullable = false)
    private Integer id;

    @Lob
    @Column(name = "contenu")
    private String contenu;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_experience") // Assuming 'id_experience' is the correct column name
    private Experience experience; // Changed from idUserExperience to experience

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_plante")
    private Plante idPlante;
}
