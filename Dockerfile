FROM node:8.6

MAINTAINER André Heuner <andre.heuner@trinimon.de>

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install libgtk2.0-0 libgconf-2-4 libx11-xcb-dev libsecret-1-0 libxss1 libnss3 \ 
                    libxkbfile1 libgl1-mesa-glx libgl1-mesa-dri libasound2 libnotify4 git -y   
    
RUN curl -O https://packages.microsoft.com/repos/vscode/pool/main/c/code/code_1.16.1-1505406497_amd64.deb && \
    dpkg -i ./code_1.16.1-1505406497_amd64.deb && \
    rm ./code_1.16.1-1505406497_amd64.deb     
                
RUN useradd --user-group --create-home developer
ADD extensions/* /home/developer/extensions/
RUN mkdir /home/developer/apps && \ 
    mkdir /home/developer/.vscode && \ 
    chown -R developer:developer /home/developer/.vscode && \
    chown -R developer:developer /home/developer/extensions && \
    chown -R developer:developer /home/developer/apps

USER node

RUN mkdir /home/node/.npm-global
ENV PATH=/home/node/.npm-global/bin:$PATH
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
RUN npm install -g @angular/cli

USER developer    
 
ENV HOME=/home/developer
RUN cp /etc/skel/.bashrc ~ && \
    sed -i "$ a\alias code='/usr/bin/code --user-data-dir ~/.vscode'" ~/.bashrc && \
    find /home/developer/extensions -name '*.vsix' -exec code --install-extension "{}" \;
       
WORKDIR $HOME/apps

VOLUME /home/developer/apps
VOLUME /home/developer/.vscode    

EXPOSE 4200

CMD ["/bin/bash"]
