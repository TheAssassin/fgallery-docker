# fgallery Docker container recipe

This project provides a simple to use image gallery based on the awesome [fgallery](https://gitlab.com/wavexx/fgallery) project.


## Usage

It's recommended to use [docker-compose](https://docs.docker.com/compose/) to manage the container.

Copy `docker-compose.yml.example` to `docker-compose.yml`. Insert the path of the directory containing your images in the `volumes:` section. Optionally, you can change the gallery title in the environment variables, or the ports your gallery webserver will listen on.

During startup, the container will generate the gallery from scratch. This might take a while, depending on the performance of your computer and the amount of images your gallery shall contain. You can track the progress in the logs of the container. Once done, the container will start the webserver.


## Credits and Licensing

The project took inspiration from https://github.com/docwhat/docker-image-gallery, but since that project lacks a license has been rewritten from scratch and released under the terms of the MIT license. See the file `LICENSE.txt` for more information.
