package com.epsi.mspr.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.*;

import java.io.Serializable;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "conseils")
public class Conseil implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_conseil", nullable = false)
    private Integer id;

    @Lob
    @Column(name = "contenu")
    private String contenu;

    @ManyToOne()
    @JoinColumn(name = "id_experience") // Assuming 'id_experience' is the correct column name
    private Experience experience; // Changed from idUserExperience to experience

    @ManyToOne()
    @JoinColumn(name = "id_plante")
    private Plante plante;
}
