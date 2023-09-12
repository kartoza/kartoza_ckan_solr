FROM solr:8.11.2

EXPOSE 8983

ARG CKAN_BRANCH="dev-v2.10"

WORKDIR /home/solr

ENV SOLR_CONFIG_DIR="/opt/solr/server/solr/configsets"
ENV SOLR_SCHEMA_FILE="$SOLR_CONFIG_DIR/ckan/conf/managed-schema"

USER root

RUN chmod 777 /

# Create a CKAN configset by copying the default one
RUN cp -R $SOLR_CONFIG_DIR/_default $SOLR_CONFIG_DIR/ckan

# Update the schema
ADD managed-schema /opt/solr/server/solr/configsets/ckan/conf/managed-schema
ADD solrconfig.xml /opt/solr/server/solr/configsets/ckan/conf/solrconfig.xml
RUN chmod 644 $SOLR_SCHEMA_FILE 

USER solr

CMD ["sh", "-c", "solr-precreate ckan $SOLR_CONFIG_DIR/ckan"]