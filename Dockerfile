FROM rocker/shiny:4.2
RUN install2.r rsconnect shinyMobile rvest shinyWidgets
WORKDIR /srv/connect/apps
COPY app/ /kanye/
RUN ls -la /kanye/*
CMD Rscript /kanye/deploy.R
