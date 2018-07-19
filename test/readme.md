# Test実行

実行例

```
./appium-test-runner> ruby .\test\sample_test.rb
```

エディタはRubyMineを推奨しますが、とくに指定はありません。
TestUnitを使用していますが、RSpecでも記述が可能です。お好きなように。

#### 辞書ファイルの置き場
RubyMine(IntelliJ IDEA)使用時に、英単語として認識せずにwarningが表示されます。辞書登録を行うことにより、warningを回避します。(※Inspections -> Spelling -> Typoのチェックを外したらwarningが出なくなりますが、タイポミスのチェックも消えるため、これは行わないほうが良いです。)

`.\.idea\dictionaries` 直下のxmlファイルを編集してください。

## テストスクリプト

`lib`ディレクトリにある`BaseAction`を継承して、`src`ディレクトリに`HogeAction`クラスを作成。  
`HogeAction`クラスには画面遷移を行うメソッドなどを記述し、メソッドを呼び出せば完結するようひとまとめにしておくとよいです。
その後、`test`ディレクトリに、テストスクリプトを作成していきます。

`setup`と`teardown`メソッドは必ず記述してください。  
`setup`メソッドは毎回インスタンスを生成するメソッドです。  
`HogehogeAction`クラスのインスタンスを生成し、都度必要なインスタンスメソッドを呼び出すことで、検査したい画面に簡単に遷移できるため、スマートにテストを記述することができます。  
