
############################################################
# build
############################################################
ARG repo=ossrs/srs:dev
FROM ${repo} AS build
COPY doc /usr/local/srs/doc

############################################################
# dist
############################################################
FROM centos:7 AS dist
# FFMPEG 4.1
COPY --from=build /usr/local/bin/ffmpeg /usr/local/srs/objs/ffmpeg/bin/ffmpeg
# FLV demo file.
COPY --from=build /usr/local/srs/doc /usr/local/srs/doc
# Default workdir and command.
WORKDIR /usr/local/srs
ENV PATH $PATH:/usr/local/srs/objs/ffmpeg/bin
CMD ["ffmpeg", "-re", "-i", "./doc/source.200kbps.768x320.flv", "-c", "copy", "-f", "flv", "rtmp://127.0.0.1/live/livestream"]
