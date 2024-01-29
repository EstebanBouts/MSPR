package com.epsi.mspr.repository;

import com.epsi.mspr.entity.Conseil;
import com.epsi.mspr.entity.Plante;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ConseilRepository extends JpaRepository<Conseil, Integer> {
}