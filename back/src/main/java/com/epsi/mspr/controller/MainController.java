package com.epsi.mspr.controller;

import java.util.*;

import com.epsi.mspr.entity.*;
import com.epsi.mspr.repository.*;
import org.antlr.v4.runtime.tree.pattern.ParseTreePattern;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class MainController {

    @Autowired
    private SpecialisationRepository specialisationRepository;
    @Autowired
    private ExperienceRepository experienceRepository;
    @Autowired
    private UtilisateurRepository utilisateurRepository;
    @Autowired
    private ConseilRepository conseilRepository;
    @Autowired
    private PlanteRepository planteRepository;
    @Autowired
    private SessionsGardeRepository sessionsGardeRepository;

    @GetMapping("/map")
    public Map<String, String> getAllRoutes() {
        Map<String, String> routes = new TreeMap<>();

        routes.put("Plante", "/plantes");
        routes.put("Plante/{id}", "/plantes/{id}");
        routes.put("Plante/{id}/conseils", "/plantes/{id}/conseils");
        routes.put("Plante/{nom}/", "/plantes/{nom}/");
        routes.put("Utilisateur", "/utilisateurs");
        routes.put("Experience", "/experiences");
        routes.put("Conseil", "/conseils");
        routes.put("SessionsGarde", "/sessions-garde");
        routes.replaceAll((k, v) -> "http://localhost:8080/api" + v);
        return routes;
    }

    @GetMapping("/plantes")
    public List<Plante> getAllPlantes() {
        return planteRepository.findAll();
    }

    @GetMapping("/plantes/{id}")
    public Plante getPlanteById(Integer id) {
        return planteRepository.findById(id).orElse(null);
    }

    @GetMapping("/plantes/{nom}/")
    public Plante getPlanteByNom(String nom) {
        return planteRepository.findByNom(nom);
    }

    @GetMapping("/utilisateurs")
    public List<Utilisateur> getAllUtilisateurs() {
        return utilisateurRepository.findAll();
    }

    @GetMapping("/experiences")
    public List<Experience> getAllExperiences() {
        return experienceRepository.findAll();
    }

    @GetMapping("/conseils")
    public List<Conseil> getAllConseils() {
        return conseilRepository.findAll();
    }
    @GetMapping("/sessions-garde")
    public List<SessionsGarde> getAllSessionsGarde() {
        return sessionsGardeRepository.findAll();
    }


}


