# BaseMatch
<img width="1440" alt="pf_top" src="https://user-images.githubusercontent.com/62239995/90213165-07dde300-de30-11ea-89a4-c460a26d50bf.png">

ご覧いただきありがとうございます。<br>
4月より3ヶ月間の学習期間を経て、ポートフォリオを作成しました。<br>
サイトはこちら >>> [BaseMatch](http://basematch.work/)

作品名は双方の考え方のBase(基盤・土台)とBaseBallを掛け合わせて、それらがMatchする(合う)よう、『BaseMatch』と名付けました。

## 技術面

### 使用言語 / 環境等
- RubyonRails(5.2.4.3)
- Ruby(2.6.3)
- javascript
- jQuery
- vagrant

### 使用技術
- Bootstrap(CSSフレームワーク)
- RSpec(テストフレームワーク)
- devise(ユーザー認証機能 / ゲストログインあり)
- kaminari(ページネーション)
- refile(画像投稿機能)
- ransack(検索機能)
- geocoder(地図表示)
- dotenv-rails(環境変数化)

### API
- Maps JavaScript API
- Geocoding API

### デプロイ環境
- AWS(EC2, ElasticIP, RDS, Route53, CloudWatch, IAM)
- puma
- nginx
- capistrano

## サイト概要
少年野球チームとチームを探す選手・親御さんとのマッチングサイト

### サイトテーマ
1. チームと選手の出会い場を設ける。
2. チーム選択においてミスマッチをなくし、野球を辞めてしまうリスクのあるチーム移籍の削減に貢献する。
3. 様々な問題解決に貢献し、野球人口減少に歯止めをかける。
4. 野球界の土台作りと発展。

### テーマを選んだ理由
私自身、約10年間小学生に野球を教えていて、<br>
最近、チームを移籍する選手が増えた印象がありました。<br>
移籍自体の否定はしませんが、親も子どもも精神的な負担や金銭的な負担も発生しますし、<br>
何より子どもが野球を辞めるきっかけになってしまう可能性が大きいといった問題が発生します。<br>
こういったことからチーム選びの重要性を感じ、選手がチームのことを事前に知ることのできる<br>場があれば少しでもミスマッチが減らせると思い、マッチングサイトを作成することにしました。<br>
<img width="920" alt="profile_png" src="https://user-images.githubusercontent.com/62239995/90625068-fb082780-e253-11ea-91b6-46c6159a95ca.png">
### 選手側使い方
1. 選手登録をする。(ゲストログインあり)
2. チームを探す。(検索機能あり)
3. 各チームの紹介文や投稿(活動記録)をチェックする。
4. 気になるチームはお気に入り登録(ブックマーク)をして、いつでも見れるようにしておく。
5. 体験練習や入団を希望される場合は用意してあるお問い合わせフォームを活用し、チームに連絡をする。
6. チームからの返事を待って、体験練習or入団。

### チーム側使い方
1. チーム情報を間違えのないように登録する。
2. 登録内容のうち、特に紹介文にはチームのことをちゃんと知ってもらえるよう、<br>
   チームの決まり事や練習時間、その他アピールポイントなどをしっかり記載する。
3. 投稿機能を活用して試合結果や練習メニューなどの活動記録を残す。
4. 他のチームを閲覧して、練習方法や指導方法などの情報を得る。(検索機能あり)
5. チャット機能を活用してチーム同士で交流・情報交換を行い、野球界の発展に努める。
6. 選手からのお問い合わせ内容に答えたり、体験日や入団日の連絡をする。

## スクリーンショット
### ActionMailerによるメール通知
<img width="839" alt="slide1" src="https://user-images.githubusercontent.com/62239995/90945598-c4532c80-e460-11ea-8908-20455eab144c.png">
<img width="925" alt="slide2" src="https://user-images.githubusercontent.com/62239995/90946082-822bea00-e464-11ea-8cf0-2f84e73f9835.png">

## 設計書関連

### テーブル定義書
データベース関連。<br>
[Googleドキュメントへ移動](https://docs.google.com/spreadsheets/d/1N1m5Bx6Zf-yG2lAlxLBOt-WRaW4NnfU24PziIqP6_B0/edit#gid=0)

### WBS & 詳細設計書
サイト制作計画書、使用したGemなど。<br>
[Googleドキュメントへ移動](https://docs.google.com/spreadsheets/d/1VL7Cam4g_L5y-th-NDYEmjBWydERykOuTX1Hp66oF00/edit#gid=1773513600)

### 機能一覧
使用技術や機能について。<br>
[Googleドキュメントへ移動](https://docs.google.com/spreadsheets/d/1FYRGo0XCJfp79SE3WXRhj1XnyRRuQRZYxAh9I1tOsTI/edit#gid=0)