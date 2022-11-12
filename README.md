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
RAILS_MASTER_KEY=master.key  
TZ=Asia/Tokyo  

## 参考記事
・・  
