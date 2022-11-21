# SPA構成Webアプリケーションのバックエンド（Rails7）  
SPA構成で作るWebアプリケーションのバックエンド（Rails7のAPIモード）です。  

## 機能一覧  
・テスト用のAPI（/api/v1/test）  

## 使用技術  
Ruby "3.1.2"  
Ruby on Rails "7.0.4"  
Docker  
docker-compose  
RSpec  
MySQL  
AWS ECS/RDS  

## 注意点  
このアプリの起動には以下が必要です。  
・docker環境  
・「.env」（開発環境やテスト環境用の環境変数情報）  
・master.key（credentials.yml.enc用）  

## 使い方  
①ビルド用のコマンド  
```
$ docker compose build --no-cache
```  

<br/>

②起動用のコマンド  
```
$ docker compose up -d
```  

<br/>

③db作成用のコマンド  
```
$ docker compose exec app rails db:create
```  

<br/>

④マイグレーション用のコマンド  
```
$ docker compose exec app rails db:migrate
```  

## 環境変数
①AWS ECSの環境変数  
RAILS_MASTER_KEY=master.key  
DB_DATABASE=RDSで設定したDB名  
DB_USERNAME=RDSで設定したユーザー名  
DB_PASSWORD=RDSで設定したパスワード  
DB_HOST=RDSのエンドポイント  

<br/>

②CircleCIの環境変数  
RAILS_MASTER_KEY=master.key  
MYSQL_ROOT_PASSWORD=.envに記載したMySQL用のパスワード  
TZ=.envに記載したタイムゾーン（Asia/Tokyo）  
AWS_ACCESS_KEY_ID=デプロイ用ユーザーのアクセスキーID  
 AWS_SECRET_ACCESS_KEY=デプロイ用ユーザーのシークレットアクセスキー  
 AWS_REGION=リージョン（東京なら「ap-northeast-1」）  
 AWS_ECR_REGISTRY_ID=AWSのアカウントID（12桁の数字）  

## 参考記事
技術ブログも作成していますので、興味がある方は下記の記事を参考にしてみて下さい。  
[・SPA構成Webアプリ開発方法まとめ](https://tomoyuki65.com/how-to-develop-a-web-application-with-spa/)  
