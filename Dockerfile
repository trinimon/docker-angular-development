FROM node:8.6

MAINTAINER André Heuner <andre.heuner@trinimon.de>

RUN curl -O https://packages.microsoft.com/repos/vscode/pool/main/c/code/code_1.16.1-1505406497_amd64.deb && \
    dpkg -i ./code_1.16.1-1505406497_amd64.deb || true && \
    rm ./code_1.16.1-1505406497_amd64.deb && \
    echo "### Please kindly ignore errors from installation above. ###"    

RUN apt-get update && \
    apt-get install -f -y && \
    apt-get upgrade -y && \
    apt-get install libgtk2.0-0 libx11-xcb-dev libxss1 git -y
                     
RUN useradd --user-group --create-home --shell /bin/false developer

USER node
RUN mkdir /home/node/.npm-global

ENV PATH=/home/node/.npm-global/bin:$PATH
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
RUN npm install -g @angular/cli

USER developer     
ENV HOME=/home/developer
WORKDIR $HOME/apps
    
VOLUME /home/developer/apps

EXPOSE 4200

CMD ["/bin/bash"]
