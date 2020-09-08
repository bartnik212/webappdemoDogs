package com.sda.javagda31.webappdemo.modelDogs;


import lombok.*;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.Formula;

import javax.persistence.*;
import java.util.Set;

@Entity
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor

public class Owner {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String firstName;
    private String lastName;


    private Set<Pet> pets;

    @Formula("(SELECT AVG(p.age) from Pet p where p.owner_id=id)")
    private Double petAverage;


    @Formula("(Select COUNT(p.name) from Pet p where p.owner_id=id)")
    private Integer quantityOfPets;

    @OneToMany(mappedBy = "student", fetch = FetchType.EAGER, cascade = CascadeType.REMOVE)
    @Cascade(value = org.hibernate.annotations.CascadeType.REMOVE)
    @EqualsAndHashCode.Exclude

    private Integer age;




}
