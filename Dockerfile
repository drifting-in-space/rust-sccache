FROM rust:buster as build

RUN apt-get update && apt-get install --yes libpq-dev wget

#add scache to speed up builds
RUN wget https://github.com/mozilla/sccache/releases/download/v0.3.0/sccache-v0.3.0-x86_64-unknown-linux-musl.tar.gz \
    && tar xzf sccache-v0.3.0-x86_64-unknown-linux-musl.tar.gz \
    && mv sccache-v0.3.0-x86_64-unknown-linux-musl/sccache /usr/local/bin/sccache \
    && chmod +x /usr/local/bin/sccache

RUN cargo install cargo-prefetch
RUN cargo prefetch
