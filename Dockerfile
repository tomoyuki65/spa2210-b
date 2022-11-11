## ENVの設定
# railsコンソール中で日本語入力するための設定
ENV LANG=C.UTF-8
# 本番環境用のRAILS_ENV設定
ENV RAILS_ENV=production
# 2022年10月時点の最新版のbundler
# bundlerのバージョンを固定するための設定
ENV BUNDLER_VERSION=2.3.25

## ビルドステージ
# 2022年10月時点の最新安定版のRuby
FROM ruby:3.1.2 AS builder
# インストール可能なパッケージ一覧の更新
RUN apt-get update -qq \
    # パッケージのインストール
    && apt-get install build-essential \
    # キャッシュを削除して容量を小さくする
    && rm -rf /var/lib/apt/lists/*
# 作業ディレクトリの指定
RUN mkdir /app
WORKDIR /app
# ローカルにあるGemfileとGemfile.lockを
# コンテナ内のディレクトリにコピー
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
# bundlerのバージョンを固定する
RUN gem install bundler -v $BUNDLER_VERSION
RUN bundle -v
# bunlde installを実行する
RUN bundle install --jobs=4

## マルチステージビルド
# 2022年10月時点の最新安定版のRuby
FROM ruby:3.1.2
# インストール可能なパッケージ一覧の更新
RUN apt-get update -qq \
    # パッケージのインストール（-yは全部yesにするオプション）
    -y vim-gtk \
    # キャッシュを削除して容量を小さくする
    && rm -rf /var/lib/apt/lists/*
# 作業ディレクトリの指定
RUN mkdir /spa2210-b
WORKDIR /spa2210-b
# ビルドステージからファイルをコピー
COPY --from=builder /usr/local/bundle /usr/local/bundle
COPY . /spa2210-b
# コンテナ起動時に実行するスクリプト
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
