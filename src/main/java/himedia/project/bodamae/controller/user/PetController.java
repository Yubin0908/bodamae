package himedia.project.bodamae.controller.user;

import himedia.project.bodamae.dto.Pet;
import himedia.project.bodamae.repository.PetRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/community/pets")
@Slf4j
public class PetController {

    private final PetRepository petRepository;

    @Autowired
    public PetController(PetRepository petRepository) {
        this.petRepository = petRepository;
    }

    @GetMapping("")
    public String pet(Model model) {
        model.addAttribute("pets", petRepository.findAllPets());
        return "user/community/pet/pet";
    }

    @GetMapping("/write")
    public String petWrite() {
        return "user/community/pet/petWrite";
    }

    @PostMapping("/write")
    public String petWritePost(@ModelAttribute("pet") Pet pet) {
        boolean result = petRepository.petAdd(pet);
        return "redirect:community/pets";
    }
}
