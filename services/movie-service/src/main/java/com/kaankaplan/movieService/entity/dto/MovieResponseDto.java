package com.kaankaplan.movieService.entity.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MovieResponseDto {
    private int movieId;
    private String movieName;
    private String description;
    private int duration;
    private Date releaseDate;
    private boolean isDisplay;
    private int categoryId;
    private String categoryName;
    private String imageUrl;
    private String movieTrailerUrl;
    private String directorName;
}