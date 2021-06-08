# Subsets of GenJyuuGothic

[源柔ゴシック (げんじゅうゴシック)](http://jikasei.me/font/genjyuu/) の Web Font です。
そのまま Web Font として利用するにはファイルサイズが非常に大きいため、
Google Fonts が提供する Noto Sans JP を参考にして最適化を行いました。

- [Google Fonts launches Japanese support](https://developers.googleblog.com/2018/09/google-fonts-launches-japanese-support.html)

[unicode-range](https://caniuse.com/#feat=font-unicode-range) と [woff2](https://caniuse.com/#feat=woff2) を利用し、
閲覧に必要なグリフのみをダウンロードすることで、ページの読み込み速度を向上させます。

## SYNOPSIS

[Releases](https://github.com/shogo82148/genjyuugothic-subsets/releases) から zip ファイルをダウンロードし、展開してください。
同梱されている CSS を `<link>` タグを使って読み込むことでフォントが利用可能になります。

```html
<link
  href="https://example.com/path/to/fonts/GenJyuuGothic-Regular.css"
  type="text/css"
  rel="stylesheet"
/>
```

以下のフォントファミリーが利用可能です。

```css
/* 源柔ゴシック */
font-family: "GenJyuuGothic";
font-family: "GenJyuuGothicP";
font-family: "GenJyuuGothicMonospace";

/* 源柔ゴシックL */
font-family: "GenJyuuGothicL";
font-family: "GenJyuuGothicLP";
font-family: "GenJyuuGothicLMonospace";

/* 源柔ゴシックX */
font-family: "GenJyuuGothicX";
font-family: "GenJyuuGothicXP";
font-family: "GenJyuuGothicXMonospace";
```

[https://shogo82148.github.io/genjyuugothic-subsets/](https://shogo82148.github.io/genjyuugothic-subsets/) から実際の利用例を確認できます。

## License

copyright 2021 Ichinose Shogo (@shogo82148) https://github.com/shogo82148/genjyuugothic-subsets  
copyright 2014 自家製フォント工房 by MM. http://jikasei.me/font/genjyuu/  
M+ OUTLINE FONTS is under the M+ FONTS LICENSE.

This Font Software is licensed under the SIL Open Font License, Version 1.1.
