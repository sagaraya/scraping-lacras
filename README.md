# scraping-lacras

ローカルにダウンロードした給与・賞与の明細をスクレイピングして、tsvに出力します。

## 依存ライブラリ
- nokogiri

## 使い方
### 1. ディレクトリの作成
cloneしたディレクトリ内に、以下の２つのディレクトリを作成してください。

- `data`
- `data/bonus`

### 2. 給与・賞与明細をダウンロード
Webブラウザで給与明細を開き、htmlを`data`ディレクトリに保存してください。
賞与明細は`data/bonus`に保存してください。

```
├── data
│   ├── 201204.html
│   ├── 201204_files
│   │   ├── mtReferenceDetail.css
│   │   └── sf_main.jsp
│   ├── 201205.html
│   ├── 201205_files
│   │   ├── mtReferenceDetail.css
│   │   └── sf_main.jsp
（中略）
│   └── bonus
│       ├── 201212.html
│       ├── 201212_files
│       │   ├── mtReferenceDetail.css
│       │   └── sf_main.jsp
│       ├── 201306.html
│       ├── 201306_files
│       │   ├── mtReferenceDetail.css
│       │   └── sf_main.jsp
（中略）
├── html2tsv.rb

```

### 3. スクリプトを実行
```
ruby html2tsv.rb
```

デフォルトでは給与をスクレイピングします。
賞与をスクレイピングする場合は、プログラム中のコメントアウトされている箇所を切り替えてください。

MacのExcelで開く場合は、文字化けしないようにUTF-16に変換してください。
`nkf -w16L --overwrite salary.tsv`


あとは、好きなようにデータをごにょごにょしてください。
