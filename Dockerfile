FROM rocker/shiny:4.2
RUN install2.r rsconnect shinyMobile rvest shinyWidgets
WORKDIR /home/shinyusr
COPY app.R /home/shinyusr/app.R
COPY setup.R /home/shinyusr/setup.R
COPY deploy.R /home/shinyusr/deploy.R
COPY ui /home/shinyusr/ui
COPY www /home/shinyusr/www
COPY src /home/shinyusr/src
RUN chmod -R 777 /home/shinyusr/ui 
RUN chmod -R 777 /home/shinyusr/ui/components 
RUN chmod -R 777 /home/shinyusr/www 
RUN chmod -R 777 /home/shinyusr/src
CMD Rscript deploy.R
