package com.sda.javagda31.webappdemo.modelDogs;


import lombok.*;

import javax.persistence.*;

@Entity
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Pet {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;


    private Integer age;
    private String ownerName;

    private double weight;

    private boolean pureRace;

    @Enumerated(value = EnumType.STRING)
    private Race race;

    @ManyToOne(fetch = FetchType.LAZY)
    @EqualsAndHashCode.Exclude
    @ToString.Exclude

    private Owner owner;




}
