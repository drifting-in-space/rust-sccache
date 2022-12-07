FROM rust:buster as build

RUN apt-get update && apt-get install --yes libpq-dev wget

#add scache to speed up builds
RUN cargo install --root=/usr/local/bin sccache

RUN cargo install cargo-prefetch
RUN cargo prefetch
