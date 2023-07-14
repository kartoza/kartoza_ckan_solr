**This repo was created to replace the ckan solr image that is depricated on docker**

# Build the image
- `docker build --tag kartoza_ckan_solr .`

# Run the image
- `docker run -d --restart=always -p 8983:8983 kartoza_ckan_solr` 