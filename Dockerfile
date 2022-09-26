FROM rocker/shiny-verse:4.2
RUN install2.r rsconnect shinyMobile rvest shinyWidgets DBI RColorbrewer
WORKDIR /home/shinyusr/
COPY app/ .
RUN ls -la ./*
CMD Rscript deploy.R
