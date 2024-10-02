# Run Docker
# docker build -t edk3588 .
# docker run -v ./:/edk2-rk3588 edk3588 --device orangepi-5plus --release Release
FROM ubuntu:22.04 as builder

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends ca-certificates \
        wget git python3 python3-pkg-resources xz-utils cmake make pkg-config g++-aarch64-linux-gnu \
        git gcc g++ build-essential gcc-aarch64-linux-gnu iasl python3-pyelftools libfl-dev uuid uuid-dev \
        device-tree-compiler \
    && pwd

RUN date

WORKDIR /edk2-rk3588

ENTRYPOINT ["./build.sh"]
CMD ["--device rock-5b --release Release"]