#Loading the Kanye images from getty images
'https://www.gettyimages.com/photos/kanye-west?family=editorial&phrase=kanye%20west&sort=mostpopular' %>%
  read_html %>%
  html_nodes(
    'body > div.content_wrapper > section > div > main > section > div.search-content__gallery-pager-wrapper > div > div.search-content__gallery > div > div > div.search-content__gallery-assets > div > article > a > figure > img'
  ) %>%
  html_attr('src') -> kw_imgs
