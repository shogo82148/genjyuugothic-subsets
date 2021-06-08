
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
	./package.pl GenJyuuGothic-ExtraLight GenJyuuGothic 250
	./package.pl GenJyuuGothic-Light GenJyuuGothic 300
	./package.pl GenJyuuGothic-Normal GenJyuuGothic 350
	./package.pl GenJyuuGothic-Regular GenJyuuGothic 400
	./package.pl GenJyuuGothic-Medium GenJyuuGothic 500
	./package.pl GenJyuuGothic-Bold GenJyuuGothic 700
	./package.pl GenJyuuGothic-Heavy GenJyuuGothic 900

	./package.pl GenJyuuGothic-P-ExtraLight GenJyuuGothicP 250
	./package.pl GenJyuuGothic-P-Light GenJyuuGothicP 300
	./package.pl GenJyuuGothic-P-Normal GenJyuuGothicP 350
	./package.pl GenJyuuGothic-P-Regular GenJyuuGothicP 400
	./package.pl GenJyuuGothic-P-Medium GenJyuuGothicP 500
	./package.pl GenJyuuGothic-P-Bold GenJyuuGothicP 700
	./package.pl GenJyuuGothic-P-Heavy GenJyuuGothicP 900

	./package.pl GenJyuuGothic-Monospace-ExtraLight GenJyuuGothicMonospace 250
	./package.pl GenJyuuGothic-Monospace-Light GenJyuuGothicMonospace 300
	./package.pl GenJyuuGothic-Monospace-Normal GenJyuuGothicMonospace 350
	./package.pl GenJyuuGothic-Monospace-Regular GenJyuuGothicMonospace 400
	./package.pl GenJyuuGothic-Monospace-Medium GenJyuuGothicMonospace 500
	./package.pl GenJyuuGothic-Monospace-Bold GenJyuuGothicMonospace 700
	./package.pl GenJyuuGothic-Monospace-Heavy GenJyuuGothicMonospace 900
