package com.kaankaplan.movieService.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "saloon")
public class Saloon {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int saloonId;
    private String saloonName;

    @ManyToOne
    @JoinColumn(name = "city_id")
    @JsonIgnore
    private City city;
}