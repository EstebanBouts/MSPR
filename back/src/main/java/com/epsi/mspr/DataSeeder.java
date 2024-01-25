/*
package com.epsi.mspr;

import com.epsi.mspr.entity.*;
import com.epsi.mspr.repository.*;
import com.github.javafaker.Faker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import java.util.Locale;

@Component
public class DataSeeder implements CommandLineRunner {

    @Autowired
    private BotanisteRepository botanisteRepository;

    @Autowired
    private PlanteRepository planteRepository;

    @Autowired
    private UtilisateurRepository utilisateurRepository;

    @Autowired
    private ConseilRepository conseilRepository;
    @Autowired
    private SessionsGardeRepository sessionsGardeRepository;

    @Override
    public void run(String... args) throws Exception {
        Faker faker = new Faker(new Locale("fr"));

        for (int i = 0; i < 50; i++) {

            // Génération d'un Utilisateur
            Utilisateur utilisateur = new Utilisateur();
            utilisateur.setNom(faker.name().lastName()+" "+faker.name().firstName());
            utilisateur.setId(i+1);
            utilisateur.setEmail(faker.internet().emailAddress());
            utilisateur.setMotDePasse(faker.internet().password());
            utilisateur.setType(faker.job().field());

            // Génération d'un Botaniste
            Botaniste botaniste = new Botaniste();
            botaniste.setSpecialisation(faker.job().field());
            botaniste.setAnneesExperience(faker.number().numberBetween(1, 20));
            // Vous devrez également définir l'utilisateur ici en fonction de vos besoins.
            botaniste.setId(i+1);
            botaniste.setIdUtilisateur(utilisateur);
            botaniste.setConseils(null);

            // Génération d'une Plante
            Plante plante = new Plante();
            plante.setNom(faker.name().fullName());
            plante.setType(faker.job().field());
            plante.setInstructionsSoin(faker.lorem().paragraph());
            plante.setIdUtilisateur(utilisateur);


            // Ajoutez d'autres attributs utilisateur ici selon votre modèle.

            // Génération d'un Conseil
            Conseil conseil = new Conseil();
            conseil.setContenu(faker.lorem().paragraph());

            // Génération d'une Session de Garde
            SessionsGarde sessionsGarde = new SessionsGarde();
            sessionsGarde.setDateDebut(faker.date().past(10, java.util.concurrent.TimeUnit.DAYS));
            sessionsGarde.setDateFin(faker.date().future(10, java.util.concurrent.TimeUnit.DAYS));



            // Sauvegarde des instances dans la base de données
            botanisteRepository.save(botaniste);
            planteRepository.save(plante);
            utilisateurRepository.save(utilisateur);
            conseilRepository.save(conseil);
            sessionsGardeRepository.save(sessionsGarde);
        }
    }
}
*/
