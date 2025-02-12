# FROM rocker/rstudio:4.4.2

# # Switch to root to install system dependencies
# # USER root
# # RUN Rscript -e "install.packages('renv', repos = c(CRAN = 'https://cloud.r-project.org'))"
# # RUN Rscript -e "install.packages('remotes', repos = c(CRAN = 'https://cloud.r-project.org'))"
# # RUN apt-get update && apt-get install -y \
# #     libcurl4-openssl-dev \
# #     libssl-dev \
# #     libxml2-dev \
# #     && rm -rf /var/lib/apt/lists/*

# # Set working directory
# # WORKDIR /home/rstudio

# # Copy renv files into the container
# # COPY renv.lock renv.lock
# COPY renv/ /home/rstudio/renv/
# # COPY .Rprofile .Rprofile

# # Set permissions for rstudio user
# # RUN chown -R rstudio:rstudio /home/rstudio

# # Switch to rstudio user to restore environment
# # USER rstudio

# # Restore the R environment with renv
# # RUN Rscript -e "renv::restore()"

# # EXPOSE 8787

# # Start RStudio Server by default
# CMD ["/init"]

# Use the Rocker RStudio image
FROM rocker/rstudio:4.4.2



# Install remotes package to enable version pinning
RUN Rscript -e 'install.packages("remotes", repos = c(CRAN = "https://cloud.r-project.org"))'

# Install renv package
RUN Rscript -e 'remotes::install_version("renv", version = "1.0.11", repos = "https://cloud.r-project.org")'

# Install cowsay package
RUN Rscript -e 'remotes::install_version("cowsay", version = "1.0.0", repos = "https://cloud.r-project.org")'
