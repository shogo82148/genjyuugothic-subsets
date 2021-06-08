
noto-sans-jp.css:
	curl -o $@ -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36' 'https://fonts.googleapis.com/css?family=Noto+Sans+JP'

.PHONY: unicode-range
unicode-range: noto-sans-jp.css
	./extract-unicode-range.pl < noto-sans-jp.css

genjyuugothic.zip:
	curl -L -o $@ 'https://ja.osdn.net/frs/chamber_redir.php?m=nchc&f=%2Fusers%2F8%2F8642%2Fgenjyuugothic-20150607.zip'
