package com.epsi.mspr.repository;

import com.epsi.mspr.entity.Plante;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface PlanteRepository extends JpaRepository<Plante, Integer> {
    Plante findByNom(String nom);
}