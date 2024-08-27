package himedia.project.bodamae.repository;

import himedia.project.bodamae.dto.Pet;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface PetRepository {

    @Insert("insert into pet (user_id, pet_img, pet_name, pet_detail_img, pet_title, pet_info) values (#{user_id}, #{pet_img}, #{pet_name}, #{pet_detail_img}, #{pet_title}, #{pet_info})")
    boolean petAdd(Pet pet);

    @Select("select * from pet")
    List<Pet> findAllPets();

    @Select("select * from pet order by pet_no desc limit #{limit} offset #{offset}")
    List<Pet> findAllPetsPaging(@Param("limit") int limit, @Param("offset") int offset);

    @Select("select count(*) count from pet")
    int countAllPets();

    @Select("select * from pet where pet_no = #{pet_no}")
    Pet findPetByPetNo(int pet_no);

    @Select("select * from pet limit 4")
    List<Pet> petIndexlList();

    @Delete("delete from pet where pet_no = #{pet_no}")
    boolean deletePetByPetNo(int pet_no);

    @Update("update pet set pet_img = #{pet_img}, pet_name = #{pet_name}, pet_detail_img = #{pet_detail_img}, pet_date = now(), pet_title = #{pet_title}, pet_info = #{pet_info} where pet_no = #{pet_no}")
    boolean updatePet(Pet pet);
}

