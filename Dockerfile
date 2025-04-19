FROM manjarolinux/base
ENV pwd=c48a9ae4c17ab81b2bb257142cad18f2
RUN pacman -Sy --noconfirm neofetch nodejs npm sudo wget gcc
RUN useradd manjabot -m && echo "${pwd}" | passwd --stdin manjabot
RUN echo "manjabot ALL=(ALL:ALL) ALL" >> /etc/sudoers

WORKDIR /manjabot
COPY package*.json .
RUN npm install

COPY . .
RUN chmod 777 /manjabot && chmod 777 * && chmod 777 /home/manjabot
USER manjabot

CMD ["node", "/manjabot/index.js", "--sudo=${pwd}", "--token=${pwd}", "--cai=${pwd}"]
