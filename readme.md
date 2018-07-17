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

公式サイト(http://appium.io/)より、Appiumをダウンロードしてください。
その後、以下のコマンドをコンソール上で実行してください。appium-test-runnerというディレクトリが作成され、 `bundle install`を行うことで、Rubyの実行時に必要なgemを取得します。

```
$ git clone https://github.com/yakumomutsuki/appium-test-runner.git
$ cd appium-test-runner
$ bundle install
```

## Test実行
- 端末をUSB接続し、ダウンロードしてきた dmg or exeファイルをたたいてAppiumを起動。
- テスト対象となるパッケージ、app or apkファイルをappsフォルダに格納。
- testフォルダに作成したスクリプトを実行することでテストが開始されます。

~実行例~
```
.../appium-test-runner> ruby .\test\sample_test.rb
```

エディタはRubyMineを推奨しますが、とくに指定はありません。なおRSpecではなく、TestUnitを使用しています。

#### 辞書ファイルの置き場
RubyMine(IntelliJ IDEA)使用時に、英単語として認識せずにwarningが表示されます。辞書登録を行うことにより、warningを回避します。(※Inspections -> Spelling -> Typoのチェックを外したらwarningが出なくなりますが、タイポミスのチェックも消えるため、これは行わないほうが良いです。)

`.\.idea\dictionaries` 直下のxmlファイルを編集してください。

## テストスクリプト

`lib`ディレクトリにある`BaseAction`を継承して、`src`ディレクトリに`HogehogeAction`クラスを作成。  
`HogehogeAction`クラスには画面遷移を行うメソッドなどを記述し、メソッドを呼び出せば完結するようひとまとめにしておくとよいです。
その後、`test`ディレクトリに、テストスクリプトを作成していきます。

`setup`と`teardown`メソッドは必ず記述してください。  
`setup`メソッドは毎回インスタンスを生成するメソッドです。  
`HogehogeAction`クラスのインスタンスを生成し、都度必要なインスタンスメソッドを呼び出すことで、検査したい画面に簡単に遷移できるため、スマートにテストを記述することができます。  
