package himedia.project.bodamae.repository;

import himedia.project.bodamae.dto.Pet;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface PetRepository {

    @Insert("insert into pet (user_id, pet_img, pet_name, pet_detail_img, pet_title, pet_info) values (#{user_id}, #{pet_img}, #{pet_name}, #{pet_detail_img}, #{pet_title}, #{pet_info})")
    boolean petAdd(Pet pet);

    @Select("select * from pet")
    List<Pet> findAllPets();
}

