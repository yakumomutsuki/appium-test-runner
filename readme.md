# appium-test-runner
appium-test-runnerは、Appiumを利用してiOS / AndroidのUIテストを行うために作成したテストフレームワークです。Appium自体は、Java、Pythonでも動作しますが、本フレームワークではRubyを使用しています。

- ディレクトリ構成
```
root/
　├ apps/
　├ lib/
　├ src/
　├ test/
　│　└ logs/
　│　└ screenshot/
```

## 環境構築

[公式サイト](http://appium.io/)より、Appiumをダウンロード、その後、以下のコマンドをコンソール上で実行してください。  
appium-test-runnerというディレクトリに移動し、 `bundle install` を行うことで、Rubyの実行時に必要なgemを取得します。

```
$ git clone https://github.com/yakumomutsuki/appium-test-runner.git
$ cd appium-test-runner
$ bundle install
```

なお、Rubyのバージョンは `2.5.0` の使用を推奨します。

## Test実行
- 端末をUSB接続し、ダウンロードしてきた dmg or exeファイルをたたいてAppiumを起動。
- テスト対象となるパッケージ、app or apkファイルをappsフォルダに格納。
- testフォルダに作成したスクリプトを実行することでテストが開始されます。


実行するためのスクリプトの記述については、次のリンクを見てください。  
以下、サンプルの実行手順のみを示します。

```
.\appium-test-runner> ruby .\test\sample_test.rb
```