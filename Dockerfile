FROM python:3.9

ENV FONTTOOLS_VERSION=4.24.4

# ref. https://www.mitsue.co.jp/knowledge/blog/frontend/201912/19_0000.html
RUN pip install -U pip \
    && pip install fonttools==$FONTTOOLS_VERSION \
    && pip install brotli

RUN apt-get update && apt-get install -y parallel && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY genjyuugothic.zip /genjyuugothic/genjyuugothic.zip
COPY genjyuugothic-x.zip /genjyuugothic/genjyuugothic-x.zip
COPY genjyuugothic-l.zip /genjyuugothic/genjyuugothic-l.zip
COPY unicode-range /genjyuugothic/unicode-range
WORKDIR /genjyuugothic
RUN unzip -o genjyuugothic.zip && unzip -o genjyuugothic-x.zip && unzip -o genjyuugothic-l.zip

# create subsets and convert to WOFF2
RUN for FONT in *.ttf; do \
    mkdir -p ./dist/${FONT%.ttf} && \
    ls ./unicode-range/*.txt | parallel "pyftsubset ./$FONT --unicodes-file={} --layout-features='*' --flavor=woff2 --output-file=./dist/${FONT%.ttf}/${FONT%.ttf}-{/.}.woff2"; done

CMD ["/bin/true"]
