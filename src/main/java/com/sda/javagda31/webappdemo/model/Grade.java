package com.sda.javagda31.webappdemo.model;


import lombok.*;

import javax.persistence.*;

@Entity
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Grade {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private double value; // 1, 2, 3, 4, 5

    @Enumerated(value = EnumType.STRING)
    private GradeSubject subject;

    @ManyToOne()
    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    private Student student;
}
