#Loading the Kanye images from getty images
'https://depositphotos.com/stock-photos/kanye-west.html' %>%
  read_html %>%
  html_nodes('._file-image') %>%
  html_attr('src')%>% .[!is.na(.)] -> kw_imgs
