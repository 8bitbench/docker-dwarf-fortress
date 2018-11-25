FROM ubuntu:16.04
# Update cache and install base packages
#https://www.tecmint.com/access-linux-server-terminal-in-web-browser-using-wetty/

RUN addgroup media --gid=1050 \
    && useradd -ms /bin/bash media --uid=1050 --gid=1050


RUN apt-get update ; apt-get install -y \
    cron \
    curl \
    wget \
    libsdl1.2debian \
    libsdl-image1.2 \
    libSDL-ttf2.0-0 \
    bzip2  \
    libgtk2.0-0 \
    libglu1-mesa


RUN BASE_DWARF_URL="http://www.bay12games.com/dwarves" \
  && LATEST_BUILD=`curl -s $BASE_DWARF_URL/|grep bz2|grep Linux |grep -v OSX| sed -e 's/^.*href="//g' | sed -e 's/">.*$//g'` \
  && wget $BASE_DWARF_URL/$LATEST_BUILD 
RUN tar -xjf *.bz2 \
  && echo hello 
RUN sed -i 's/\[PRINT_MODE:2D\]/\[PRINT_MODE:TEXT\]/' df_linux/data/init/init.txt

RUN apt-get install -y \
  git nodejs npm
  #epel-release git nodejs npm
#INSTALL NODE
RUN curl -sL https://deb.nodesource.com/setup_9.x | bash -
RUN apt-get install -y nodejs
RUN npm install npm@latest -g

RUN mkdir -p /toolbox/app/bin
COPY files/bin/script.sh /toolbox/app/bin/

CMD ["/toolbox/app/bin/script.sh"]
