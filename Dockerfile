FROM rocker/shiny:4.2
RUN install2.r rsconnect shinyMobile rvest shinyWidgets
WORKDIR /home/shinyusr
COPY . .
CMD Rscript deploy.R
