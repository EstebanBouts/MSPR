package com.epsi.mspr.controller;

import com.epsi.mspr.entity.Experience;
import com.epsi.mspr.entity.Plante;
import com.epsi.mspr.repository.ExperienceRepository;
import com.epsi.mspr.service.PlanteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api")
public class MainController {

    @Autowired
    private PlanteService planteService;
    @Autowired
    private ExperienceRepository experienceRepository;

    @GetMapping("/hello")
    public String index() {
        return "Hello World!";
    }

    @GetMapping("/plantes")
    public List<Plante> getPlantes() {
        return planteService.getPlantes();
    }

    @GetMapping("/experiences")
    public List<Experience> getExperiences() {
        return experienceRepository.findAll();
    }
}
