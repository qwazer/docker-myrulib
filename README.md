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
 -v /home/{$USER}/myrulib:/root 
  \ myrulib
```
  


