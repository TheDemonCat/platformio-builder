# platformio-builder


Oбраз для сборки приложений фреймворком platformio

Пример сборки:

```
docker run -it --rm \
    -v "$(pwd)":/app  \
    demoncat/platformio-builder:latest platformio run
```