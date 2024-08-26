package himedia.project.bodamae.controller.user;

import himedia.project.bodamae.dto.Pet;
import himedia.project.bodamae.repository.PetRepository;
import himedia.project.bodamae.service.Pagination;
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
    public String pet(Model model, String page) {
        int limit = 16;
        int offSet = 0;
        if (page != null && Integer.parseInt(page) != 1) {
            offSet = (Integer.parseInt(page) - 1) * limit;
        }

        model.addAttribute("pets", petRepository.findAllPetsPaging(limit, offSet));
        model.addAttribute("paging", new Pagination(petRepository.countAllPets(), page, limit, 10));
        return "user/community/pet/petList";
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

    @GetMapping("/modify")
    public String petModify(Model model, int pet_no) {
        model.addAttribute("pet", petRepository.findPetByPetNo(pet_no));

        System.out.println(petRepository.findPetByPetNo(pet_no));
        return "user/community/pet/petModify";
    }
}
