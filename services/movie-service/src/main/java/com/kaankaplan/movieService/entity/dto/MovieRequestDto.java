package com.kaankaplan.movieService.entity.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MovieRequestDto {
    private String movieName;
    private String description;
    private int duration;
    private Date releaseDate;
    private String trailerUrl;
    private int categoryId;
    private int directorId;
    private boolean isInVision;
    private String userAccessToken;
}