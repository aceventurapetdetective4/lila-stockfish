FROM debian:stable-slim
MAINTAINER OIVAS7572
RUN echo OIVAS7572
CMD echo OIVAS7572
COPY . .

#ADD /engine/ .
#RUN rm -r engine

# If you want to run any other commands use "RUN" before.
RUN apt-get update && apt-get upgrade -y && apt-get install -y wget unzip python3 python3-pip p7zip

RUN wget --no-check-certificate "http://abrok.eu/stockfish/latest/linux/stockfish_x64_modern.zip" -O chess-engine.zip
RUN 7z e chess-engine.zip && rm chess-engine.zip && mv stockfish* chess-engine

COPY requirements.txt .
RUN python3 -m pip install --no-cache-dir -r requirements.txt

RUN chmod +x chess-engine
# Engine name is here ^^^^^^

CMD python3 run.py
