package himedia.project.bodamae.controller.user;

import himedia.project.bodamae.dto.Pet;
import himedia.project.bodamae.repository.PetRepository;
import himedia.project.bodamae.service.Pagination;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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
        return "redirect:/community/pets";
    }

    @GetMapping("/modify/{pet_no}")
    public String petModify(Model model, @PathVariable int pet_no) {
        model.addAttribute("pet", petRepository.findPetByPetNo(pet_no));
        System.out.println(petRepository.findPetByPetNo(pet_no));
        return "user/community/pet/petModify";
    }

    @PostMapping("/modify")
    public String petModifyPost(@ModelAttribute("pet") Pet pet) {
        int pet_no = pet.getPet_no();
        boolean result = petRepository.updatePet(pet);
        return "redirect:"+pet_no;
    }

    @GetMapping("/delete/{pet_no}")
    public String petDelete(@PathVariable int pet_no) {
        boolean result = petRepository.deletePetByPetNo(pet_no);
        return "redirect:/community/pets";
    }

    @GetMapping("/{pet_no}")
    public String petDetail(@PathVariable("pet_no") int pet_no, Model model) {
        model.addAttribute("pet", petRepository.findPetByPetNo(pet_no));
        return "user/community/pet/petDetail";
    }
}
