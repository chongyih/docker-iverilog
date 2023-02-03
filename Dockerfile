FROM debian:stretch as builder

ENV IVERILOG_VERSION=v11-branch

RUN apt-get -y update && \
    apt-get install -y \
        automake \
        autoconf \
        gperf \
        build-essential \
        flex \
        bison \
		vim \
        git && \
    rm -rf /var/lib/apt/lists/*

RUN git clone --branch=${IVERILOG_VERSION} https://github.com/steveicarus/iverilog && \
    cd iverilog && \
    bash autoconf.sh && \
    ./configure && \
    make && \
    make install && \
    cd && \
    rm -rf iverilog

FROM debian:stretch

COPY --from=builder /usr/local/bin /usr/local/bin
COPY --from=builder /usr/local/lib/ivl /usr/local/lib/ivl
COPY iverilog.sh .

RUN chmod +x /iverilog.sh
