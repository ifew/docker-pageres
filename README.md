# Pageres in Docker

Website capture screen with Node JS via Puppeteer and Chromium headless. 
Don't worries about OS. it's can use anywhere

## Pull docker image ready to use

```
$ docker pull ifew/docker-pageres
```

## Runing 

```
docker run --rm -v `pwd`:/pageres/output --security-opt seccomp=chrome.json ifew/docker-pageres "https://myifew.com" 1920x8000 --delay=15
```

## Building by your self

```
$ git clone https://github.com/ifew/docker-pageres
$ docker build --rm -t ifew/docker-pageres .
```

Thank You
- [puppeteer](https://pptr.dev/)
- [pageres](https://github.com/sindresorhus/pageres)
- [docker-pageres](https://github.com/justone/docker-pageres)
- [jessfraz](https://blog.jessfraz.com/post/how-to-use-new-docker-seccomp-profiles/)
- [jessfraz - chrome profile](https://github.com/jessfraz/dotfiles/blob/master/etc/docker/seccomp/chrome.json)