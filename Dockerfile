# Ultroid - UserBot
# Copyright (C) 2020 TeamUltroid
# This file is a part of < https://github.com/TeamUltroid/Ultroid/ >
# PLease read the GNU Affero General Public License in <https://www.github.com/TeamUltroid/Ultroid/blob/main/LICENSE/>.

FROM programmingerror/ultroid:v0.0.1

ENV TZ=Asia/Kolkata
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get install aria2 -y

RUN git clone -b vc-setup https://github.com/TeamUltroid/Ultroid.git /root/TeamUltroid/

RUN git clone https://github.com/1Danish-00/glitch_me.git && pip install -e ./glitch_me
WORKDIR /root/TeamUltroid/

RUN pip install -r requirements.txt

RUN npm install -g npm@7.11.2 -g
RUN npm install -g heroku
RUN npm install
RUN npm run build
