#Loading the Kanye images from getty images
'https://www.gettyimages.com/photos/kanye-west?family=editorial&phrase=kanye%20west&sort=mostpopular' %>%
  read_html %>%
  html_nodes('.gallery-mosaic-asset__thumb') %>%
  html_attr('src') -> kw_imgs
