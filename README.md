# AtCoder 参加用環境

このリポジトリをクローンし VSCode で開くと、devcontainer が環境を構築する。
docker image を大きくしたくなかったので、デフォルトでインストールするプログラミング言語処理系は絞っている。

AtCoder 用ツールの acc, oj はインストール済み。
後述の VSCode タスクを支援するための、独自の wrapper tool もインストール済み。

## 対応プログラミング言語

デフォルトの言語は Java。ただし、デフォルトで構築される docker image のままで Python3, JavaScript(nodejs)は利用可能。acc config default-template の設定だけで済むはず。

[Dockerfile](.devcontainer/Dockerfile) の 44~49行目の コメントを外すことで、
他の言語処理系入りの Docker image を構築可能。

各種環境設定としては、以下の言語に対応しているつもり。

- Java (JDK 8)
- Ruby
- Elixir
- Python3.8
- PyPy3

## 使い方

VSCode 上のターミナルで acc や oj を使って、そのまま利用することも可能。

おすすめの使い方は VSCode のタスク機能の利用。
以下のタスクが設定済み。

- 新規コンテスト参加 (acc new 相当)
- コードのテスト (oj t 相当)
- コードの提出 (acc submit 相当)
- 問題のページをブラウザで開く

これらのタスクを起動するために、`タスクの実行`をショートカットを設定しておくことがお勧め。
作者は (Cmd + Shift + T, Ctrl + Shift + T) に割り当てている。
このキーは、`閉じたエディタを再度開く`機能に割り当てられているが、
AtCoder 参加中にこの機能を使うことは少ないと判断している。

### 新規コンテストセットアップタスク

タスク名：`AtCoder: setup NEW contest` 

起動すると、プロンプトが表示されるので、そこで `abc101` などと入力すると、`acc new abc101 --no-tests` のようにコマンドを実行し各問題用ディレクトリを作成する。
テストケースは、後述のコードテスト用タスクで自動でダウンロードする。

### コードテスト用タスク

タスク名: `AtCoder: TEST code`

開いているソースコードを対象に `oj t` 相当のコマンドを実行。
ソースコードの拡張子を元に必要な `-c` オプションを追加する。
テストケースは、このタスクの初回実行時に自動でダウンロードする。
テストケースを、セットアップ時にダウンロードしない理由は、提出タスクで余計なプロンプトを表示させないため。

### コード提出用タスク

タスク名: `AtCoder: SUBMIT code`

開いているソースコードを対象に `oj s` 相当のコマンドを実行。
ソースコードの拡張子を元に、`-l` オプションを推測する。
間違うようであれば、各ディレクトリにある makefile 中の、該当する言語用の `OJ_SFLAGS` での `-l` 指定を変更。
makefile はシンボリックリンクになっているので、一度変更すると他のディレクトリ中の makefile もすべて変更される。


### 問題ページ閲覧用タスク

タスク名: `AtCoder: OPEN Task Page`

開いているソースコードの対象の問題のページをローカルのブラウザで開く。
このタスクをビルドタスクとして設定しているので、
ショートカット (Ctrl + Shift + B あるいは Cmd + Shift + B)で起動できる。
AtCoder では、ビルド処理を実行することは少ないと考えて、このような設定にしている。
テストや提出をビルド処理に割り当てたい場合には [tasks.json](.vscode/tasks.json) を変更する。

## コマンドライン

これらのタスクを実行するために、新規コンテストセットアップタスク以外では make を利用している。
VSCode 上のターミナルで、
該当する問題のディレクトリに移動後 make コマンドを実行することも可能。

新規コンテストセットアップタスクは acc を利用している。

タスク間の差異を吸収するために [am](bin/am) コマンドを用意している。
ターミナル上から am new する際に、ディレクトリの移動を忘れた時に対応できるように .bashrc 中で am 関数を宣言している。

## GitHub repository
https://github.com/toshi0806/docker-atcoder

(fork from https://github.com/hinamimi/docker-atcoder)
