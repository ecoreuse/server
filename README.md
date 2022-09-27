# エコリユースサーバー用スクリプト

エコリユースサーバーに必要なアプリケーションをインストールして、管理・運用するためのリポジトリです。

## セットアップ

`scripts/setup.sh`を実行します。

- Docker のインストール
- MicroK8s/kubectl のインストール
- crontab の更新
- `.git/hooks/post-merge`の更新

## サーバーの管理

`crontabs`下にあるファイルを変更して GitHub の master ブランチに push することでサーバーの状態を管理します。
必要に応じて変更してください。

ファイルの仕様は「crontab 書き方」でインターネット検索してください。
