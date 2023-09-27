FROM ubuntu:22.04
MAINTAINER nicolaipre <redacted>

# Install dependencies
RUN apt update && apt install -y git golang-go cmake python3 python3-dev python3-pip libcapstone4 libcapstone-dev

# Install Keystone from source
WORKDIR /opt/keystone
RUN git clone https://github.com/keystone-engine/keystone.git /opt/keystone
RUN mkdir /opt/keystone/build
RUN cd /opt/keystone/build && \
    ../make-share.sh && \
    cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=ON -DLLVM_TARGETS_TO_BUILD="AArch64;X86" -G "Unix Makefiles" .. && \
    make -j8 && \
    make install
RUN ldconfig

# REBot
WORKDIR /opt/rebot
RUN git clone https://github.com/Cryptogenic/REBot.git /opt/rebot
RUN cd /opt/rebot && \
    sed -i 's/165177089035599873/1337/g' main.go && \
    sed -i 's/gapstone.New(arch, uint(mode))/gapstone.New(arch, int(mode))/g' /opt/rebot/commands-asm.go && \
    go mod init github.com/Cryptogenic/rebot && \
    go get github.com/bnagy/gapstone && \
    go get github.com/bwmarrin/discordgo && \
    go get github.com/go-ini/ini && \
    go get github.com/keystone-engine/keystone/bindings/go/keystone && \
    go build

ADD config.ini /opt/rebot/config.ini

ENTRYPOINT ["/opt/rebot/rebot"]
