# srs-docker

![](http://ossrs.net:8000/gif/v1/sls.gif?site=github.com&path=/docker/ubuntu20)
[![](https://cloud.githubusercontent.com/assets/2777660/22814959/c51cbe72-ef92-11e6-81cc-32b657b285d5.png)](https://github.com/ossrs/srs/wiki/v1_CN_Contact#wechat)

CentOS docker for [SRS](https://github.com/ossrs/srs) developer.

## Usage

**Install docker**

Download docker from [here](https://www.docker.com/products/docker-desktop) then start docker.

**Pull docker image**

```
docker pull ossrs/srs:ubuntu20
```

**Clone SRS**

```
git clone https://github.com/ossrs/srs.git && cd srs
```

**Start docker**

```
docker run -it -v `pwd`:/tmp/srs -w /tmp/srs/trunk -p 1935:1935 \
  -p 1985:1985 -p 8080:8080 -p 8085:8085 ossrs/srs:ubuntu20 bash
```

> Note: Recommend to use [AliyunCR](https://cr.console.aliyun.com/) `registry.cn-hangzhou.aliyuncs.com/ossrs/srs:ubuntu20`, because it's much faster.

**Build SRS in docker**

```
./configure && make
```

**Run SRS in docker**

```
./objs/srs -c conf/console.conf
```

## EXEC

To enter your container:

```
dockerID=`docker ps --format "{{.ID}} {{.Image}}" |grep 'ossrs/srs:ubuntu20' |awk '{print $1}'` &&
docker exec -it $dockerID bash
```

## GDB

To run docker with `--privileged` for GDB, or it fail for error `Cannot create process: Operation not permitted`.

## Api Server

To run api-server at 8085 in docker:

```
(cd objs/CherryPy-3.2.4 && python setup.py install --user) &&
python research/api-server/server.py 8085
```

## Features

- [x] v0.3, Go, dstat, lsb_release.
- [x] v0.2, NetTools, GDB.
- [x] v0.2, OpenSSL 1.1.0e
- [x] v0.1, FFMPEG 4.1 with x264 core.157
- [x] v0.1, GIT
