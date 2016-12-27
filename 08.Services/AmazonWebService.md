# Amazon Web Services
## 初期設定
### Signup
クレカ情報が必要。

### ポリシーの生成
IAMユーザやグループに対してアクセス制限を設けるためのポリシーを作成する。  
#### 既存ポリシーの利用
既存のポリシーを利用する場合は、下記のグループやユーザ作成時にアタッチすれば良い。
#### 新規ポリシーの作成
新たなポリシーを作成する場合は以下の手順で作る。
- `サービス` -> `セキュリティ、アイデンティティ` -> `IAM`でIAMダッシュボードを開く
- `ポリシー`を開き、`ポリシーの作成`
- 以下の選択肢から作成方法を選ぶ
	+ AWS管理ポリシーをコピー
		* 既存のポリシーをコピーして変種
	+ PolicyGenerator
		* GUI的に用意されているアクションを選んでポリシーを作成
	+ 独自のポリシーを作成
		* AWSのJSON記法でポリシーを作成する。記法を理解していないと厳しい。

詳しくは以下を参照のこと。
- [IAMのEC2権限をまとめてみた | サーバーワークス エンジニアブログ](http://blog.serverworks.co.jp/tech/2014/02/07/iam-ec2/)
- [Amazon RDS の Amazon リソースネーム (ARN) での作業 - Amazon Relational Database Service](http://docs.aws.amazon.com/ja_jp/AmazonRDS/latest/UserGuide/USER_Tagging.ARN.html)
- [Amazon リソースネーム（ARN）と AWS サービスの名前空間 - アマゾン ウェブ サービス](https://docs.aws.amazon.com/ja_jp/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-ec2)

### グループの作成
IAMユーザのポリシーを設定するために、予め権限を設定したグループを設定する。
#### 手順
1. **サービス** -> *セキュリティ、アイデンティティ*　-> **IAM**
でIAMダッシュボードへ移動
1. サイドバーより **グループ** を選択
1. **新しい新しいグループの作成**
1. **グループ名** を任意に決める
1. **ポリシーのアタッチ** にてグループに設定するポリシーを決める
	- 今回は`AdministratorAccess`を選択。これで大抵のことはできるが課金情報にはアクセスできない。
	- 上記で独自のポリシーを設定している場合はこれを設定する。
1. グループを作成してfinish

### IAMユーザを作る
IAMユーザを作ることで色々制限をかけられる。  
今回は一応課金系情報にアクセス出来ないようにする目的でアカウントを切る。
#### 手順
1. IAMダッシュボードを開く
1. **ユーザを追加**
1. アクセスの種類を選択
	- **プログラムによるアクセス**  
	APIなんかでAWSを叩くときに必要なアクセスキーとかを同時に発行するか否か。今回はそんな予定もないし今後ユーザ一覧から設定できるのでノンチェック。
	- **AWSマネジメントコンソールへのアクセス**  
	文字通りコンソールへのアクセス権を付与する。今回はオンデマンド契約なのでこまめにインスタンスを落としてもらうためにはアクセスできたほうがラクなのでチェック。
		* `コンソールのパスワード`：自動生成でおｋ
		* `パスワードのリセットが必要`：文字通り。これもチェックを入れる。
1. アクセス権限を前述で作成した任意のグループに紐付けることでポリシーが適用される。
1. 確認画面を経て作成が完了すると、CSVでOTPの一覧が表示されるので **かならずDLしておくこと** 。
1. コンソールへのアクセスURLもメモしてfinish（これはあとでも拾える）。

### IAMユーザでコンソールへログイン
IAMダッシュボードに貼られているURLへアクセスし、CSVの内容でログインできる。  
URLはカスタマイズできる。

### CloudWatchで請求情報アラートを飛ばす
課金状態が一定を超えるとアラートメールを飛ばすようにする。
1. ルートAWSユーザでログインし、上部のバーのユーザプルダウンから **請求ダッシュボード** を開く。
1. サイドメニューより **設定** を選び、任意のメニューをチェック
	+ **電子メールでPDF版請求書を受け取る**  
	チェックしとく
	+ **請求アラートを受け取る**   
	しきい値以上の課金をアラート発泡してくれる。なぜか一度入れると解除できないらしい。
1. **サービスメニュー** から、 **CloudWatch** を選ぶ
1. TODO：書きかけ

### コストエクスプローラを有効化する
1. ルートAWSユーザでログインし、上部のバーのユーザプルダウンから **請求ダッシュボード** を開く。
1. サイドメニューより **コストエクスプローラ** を選び、 **コストエクスプローラを有効化** をクリック

### 現地通貨設定
**JCBカードでは支払いができないので注意！！！**
1. ルートAWSユーザでログインし、上部のバーのユーザプルダウンから **アカウント** を開く。
1. **お支払通貨の設定** 欄の通貨設定を **JPY** に

## EC2を使おう
### VPCを設定する
そのうち
### キーペアを作成する
SSHでログインするためのキーペアを作成する。
チャートに従う。詳細は後で書く。

## Dynamic DNS providerをつかってログインしやすくする
そのうちやる
### Reference
- [AWS EC2 でインスタンスを作った後は動的DNSを使用すると楽チンだよ - 覚悟はいいか？オレはできてる](http://junseis.hatenablog.com/entry/2014/07/05/124027)
- [Linux インスタンスの動的な DNS のセットアップ - Amazon Elastic Compute Cloud](http://docs.aws.amazon.com/ja_jp/AWSEC2/latest/UserGuide/dynamic-dns.html)

## EC2初期設定
### rootのPWの変更
```bash
$ sudo su
＃ passwd
```
### タイムゾーンの設定
```bash
$ timedate
#で現状を確認
$ timedate set-timezone Asia/Tokyo
```
### ユーザを作る
以下、そのうち
#### AWSでキーペアを作成する
#### Pubキーを作る
```bash
$ ssh-keygen -y -f PRIVATE_KEY_PATH > PUBLIC_KEY_NAME
```
#### 新しいユーザを追加する
##### グループを追加する
##### ユーザを追加する
##### ユーザのパーミッションを設定する
#### Pubキーを置く
##### Permissionを設定する
|Directory|Permission|
|:---|:---:|
|/home/USER/.ssh|700|
|/home/USER/.ssh/authorized_keys|600|
##### Pubキーを置く


## Reference

- [0から始めるAWS入門②：EC2編 - Qiita](http://qiita.com/hiroshik1985/items/f078a6a017d092a541cf)

### ポリシーに関して
- [IAMのEC2権限をまとめてみた | サーバーワークス エンジニアブログ](http://blog.serverworks.co.jp/tech/2014/02/07/iam-ec2/)
- [Amazon RDS の Amazon リソースネーム (ARN) での作業 - Amazon Relational Database Service](http://docs.aws.amazon.com/ja_jp/AmazonRDS/latest/UserGuide/USER_Tagging.ARN.html)
- [Amazon リソースネーム（ARN）と AWS サービスの名前空間 - アマゾン ウェブ サービス](https://docs.aws.amazon.com/ja_jp/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-ec2)
