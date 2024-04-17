# This file contains the code used to plot a circular dendrogram.

# Loading libraries
library(dendextend)
library(circlize)
library(tidyverse)
library(ggdendro)

data(mtcars)

# The data I used is the `mtcars` dataset, which can be used to perform clustering techniques.

# Plot a classic dendrogram:
  
# Distance matrix
d <- dist(mtcars)

# Create dendrogram
hc <- hclust(d)

# Plot dendrogram and save as .png
png("classic_dendrogram.png", width = 800, height = 600)
par(font = 2)
ggdendrogram(hc)
dev.off()

# Plot a circular dendrogram

# Distance matrix
d <- dist(mtcars)

# Create dendrogram
hc <- hclust(d)

# Color palette creation
label_colors <- c("#d75078", "#f2a300", "#03b4a1")

# Defining number of clusters and colors for the dendrogram
hc <- hc %>%
  color_branches(k = 3, col = label_colors) %>%
  color_labels(k = 3, col = label_colors)

# Plot circular dendrogram and save as .png

png("circular_dendrogram.png", width = 800, height = 800)
par(font = 2)
circlize_dendrogram(hc,
                    labels_track_height = 0.3,
                    dend_track_height = 0.5,
                    labels.cex = 0.5)

# Add title and subtitle
title("Car Classification\n", cex.main = 1.5)
mtext("Visualizing Hierarchical Clustering through Circular Dendrograms",
      side = 3, line = 0.5, cex = 1.2)

dev.off()