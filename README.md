# docker-myrulib

Simple docker image for [myrulib](https://github.com/lintest/myrulib/) app.

# Why?

The myrulib is not supported for modern linux distributions.
Provided packages deb and rmp is outdated.
Installing from source code via `.configure && make` fails.

So dockerizing of this app is rescue for modern linux distributions users.
  
# How to use
  
Install docker on your machine.

Enable access from foreign clients to X 
```bash
 xhost +
 ```
and run with

```bash
docker run  --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix \
 -v /home/${USER}/myrulib:/root \ 
   qwazer/docker-myrulib
```
`/home/${USER}/myrulib` will be used as home folder for root user inside container.

Currently myrulib execuded by root.

## HI DPI support

To adjust resolution for HI DPI screens pass `GTK_SCALE` parameter


```bash
docker run  --rm -e GTK_SCALE=2 -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix \
 -v /home/${USER}/myrulib:/root \ 
   qwazer/docker-myrulib
```
  
# Limitation

It's quick and dirty image, so myrulib process executed via root user inside container.
Track [issue #1](https://github.com/qwazer/docker-myrulib/issues/1) for myrulib process user permissions.
