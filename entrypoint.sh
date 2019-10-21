#! /bin/sh

set -e
set -x

# clean up old files to cleanly regenerate the gallery
rm -rf /usr/share/nginx/html

# make sure webserver base directory exists
install -d /usr/share/nginx/

# try to generate the gallery
if ! /fgallery/fgallery -v -j3 /images /usr/share/nginx/html/ "${GALLERY_TITLE:-Gallery}"; then
    # if anything goes wrong, copy the error page instead
    cp -v /error.html /usr/share/nginx/html/index.html
fi

# fix permissions to make directory readable by webserver
(
    cd /usr/share/nginx/html
    find -type f -exec chmod 0644 '{}' \;
    find -type d -exec chmod 0755 '{}' \;
)

# start webserver in foreground
exec nginx -g 'daemon off;'
