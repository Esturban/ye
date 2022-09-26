FROM rocker/shiny:4.2
RUN install2.r rsconnect shinyMobile rvest shinyWidgets
WORKDIR /home/shinyusr/
COPY app/ .
RUN ls -la ./*
CMD Rscript deploy.R
