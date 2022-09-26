FROM rocker/shiny:4.2
RUN install2.r rsconnect shinyMobile rvest shinyWidgets
WORKDIR /home/shinyusr
COPY app.R app.R
COPY setup.R setup.R
COPY deploy.R deploy.R
COPY ui ui
COPY www www
COPY src src
RUN chmod -R 777 ui 
RUN chmod -R 777 ui/components 
RUN chmod -R 777 www 
RUN chmod -R 777 src
CMD Rscript deploy.R
