
noto-sans-jp.css:
	curl -o $@ -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36' 'https://fonts.googleapis.com/css?family=Noto+Sans+JP'

.PHONY: unicode-range
unicode-range: noto-sans-jp.css
	./extract-unicode-range.pl < noto-sans-jp.css

genjyuugothic.zip:
	curl -L -o $@ 'https://osdn.net/frs/chamber_redir.php?m=nchc&f=%2Fusers%2F8%2F8642%2Fgenjyuugothic-20150607.zip'

genjyuugothic-x.zip:
	curl -L -o $@ 'https://osdn.net/frs/chamber_redir.php?m=tuna&f=%2Fusers%2F8%2F8644%2Fgenjyuugothic-x-20150607.zip'

genjyuugothic-l.zip:
	curl -L -o $@ 'https://osdn.net/frs/chamber_redir.php?m=constant&f=%2Fusers%2F8%2F8643%2Fgenjyuugothic-l-20150607.zip'

.PHONY: subsets
subsets: genjyuugothic.zip genjyuugothic-x.zip genjyuugothic-l.zip unicode-range
	docker build -t genjyuugothic-fonttools .
	docker run --name genjyuugothic-fonttools-tmp genjyuugothic-fonttools
	docker wait genjyuugothic-fonttools-tmp
	rm -rf subsets
	docker cp genjyuugothic-fonttools-tmp:/genjyuugothic/dist subsets
	docker rm genjyuugothic-fonttools-tmp

.PHONY: package
package:
	./package.pl < variants.txt

VERSION=$(shell cat VERSION)

release:
	ghr -draft $(VERSION) dist
	PUBLISH=1 ./update-gh-pages.sh
