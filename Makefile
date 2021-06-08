
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

	./package.pl GenJyuuGothicL-ExtraLight GenJyuuGothicL 250
	./package.pl GenJyuuGothicL-Light GenJyuuGothicL 300
	./package.pl GenJyuuGothicL-Normal GenJyuuGothicL 350
	./package.pl GenJyuuGothicL-Regular GenJyuuGothicL 400
	./package.pl GenJyuuGothicL-Medium GenJyuuGothicL 500
	./package.pl GenJyuuGothicL-Bold GenJyuuGothicL 700
	./package.pl GenJyuuGothicL-Heavy GenJyuuGothicL 900

	./package.pl GenJyuuGothicL-P-ExtraLight GenJyuuGothicLP 250
	./package.pl GenJyuuGothicL-P-Light GenJyuuGothicLP 300
	./package.pl GenJyuuGothicL-P-Normal GenJyuuGothicLP 350
	./package.pl GenJyuuGothicL-P-Regular GenJyuuGothicLP 400
	./package.pl GenJyuuGothicL-P-Medium GenJyuuGothicLP 500
	./package.pl GenJyuuGothicL-P-Bold GenJyuuGothicLP 700
	./package.pl GenJyuuGothicL-P-Heavy GenJyuuGothicLP 900

	./package.pl GenJyuuGothicL-Monospace-ExtraLight GenJyuuGothicLMonospace 250
	./package.pl GenJyuuGothicL-Monospace-Light GenJyuuGothicLMonospace 300
	./package.pl GenJyuuGothicL-Monospace-Normal GenJyuuGothicLMonospace 350
	./package.pl GenJyuuGothicL-Monospace-Regular GenJyuuGothicLMonospace 400
	./package.pl GenJyuuGothicL-Monospace-Medium GenJyuuGothicLMonospace 500
	./package.pl GenJyuuGothicL-Monospace-Bold GenJyuuGothicLMonospace 700
	./package.pl GenJyuuGothicL-Monospace-Heavy GenJyuuGothicLMonospace 900

	./package.pl GenJyuuGothicX-ExtraLight GenJyuuGothicX 250
	./package.pl GenJyuuGothicX-Light GenJyuuGothicX 300
	./package.pl GenJyuuGothicX-Normal GenJyuuGothicX 350
	./package.pl GenJyuuGothicX-Regular GenJyuuGothicX 400
	./package.pl GenJyuuGothicX-Medium GenJyuuGothicX 500
	./package.pl GenJyuuGothicX-Bold GenJyuuGothicX 700
	./package.pl GenJyuuGothicX-Heavy GenJyuuGothicX 900

	./package.pl GenJyuuGothicX-P-ExtraLight GenJyuuGothicXP 250
	./package.pl GenJyuuGothicX-P-Light GenJyuuGothicXP 300
	./package.pl GenJyuuGothicX-P-Normal GenJyuuGothicXP 350
	./package.pl GenJyuuGothicX-P-Regular GenJyuuGothicXP 400
	./package.pl GenJyuuGothicX-P-Medium GenJyuuGothicXP 500
	./package.pl GenJyuuGothicX-P-Bold GenJyuuGothicXP 700
	./package.pl GenJyuuGothicX-P-Heavy GenJyuuGothicXP 900

	./package.pl GenJyuuGothicX-Monospace-ExtraLight GenJyuuGothicXMonospace 250
	./package.pl GenJyuuGothicX-Monospace-Light GenJyuuGothicXMonospace 300
	./package.pl GenJyuuGothicX-Monospace-Normal GenJyuuGothicXMonospace 350
	./package.pl GenJyuuGothicX-Monospace-Regular GenJyuuGothicXMonospace 400
	./package.pl GenJyuuGothicX-Monospace-Medium GenJyuuGothicXMonospace 500
	./package.pl GenJyuuGothicX-Monospace-Bold GenJyuuGothicXMonospace 700
	./package.pl GenJyuuGothicX-Monospace-Heavy GenJyuuGothicXMonospace 900
