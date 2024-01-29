package com.epsi.mspr.repository;

import com.epsi.mspr.entity.Experience;
import com.epsi.mspr.entity.Utilisateur;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository

public interface ExperienceRepository extends JpaRepository<Experience, Integer> {
}