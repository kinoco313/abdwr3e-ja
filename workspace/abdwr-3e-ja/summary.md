# 野球データセット

## はじめに


無料のデータソースが4つあるよー


1. the Lahman database
2. Retrosheet
3. PITCHf/x
4. Statcast  


## the Lahman datebase:シーズンごとのデータ


### ボンズ、アーロン、ルース、ロドリゲスのホームラン数


- この中で誰が最強か決めるには、幅広いシーズンのデータがほしいね
- Lahmanていう人がデータベースを公開してくれてるよ


### データベースの取得


- Lahmanパッケージをインストールすればおけ
- データベース内にはいっぱいテーブルがあるよ
- 詳しくは[LahmanのGithub](https://github.com/cdalzell/Lahman)みてね


### The People table


- MLBの監督や選手の生年月日などがあるよ
- Lahmanデータベースの投球・打撃・守備の各テーブルは選手IDで識別されているから、その選手の名前を取得するのにこのPeopleテーブルが有用だよ
- Retrosheetデータベースとリンクする際にも使うよ


### The Batting table


- 1871年（WW1より前！）から現在のシーズンまでの打撃指標があるよ
- playerID・teamID・yearIDで分けられてるよ
- シーズン途中で移籍した選手は同じyearIDで複数の行があって、stintっていう変数で所属した順番がわかるよ
- 打撃指標の列名はAB・R・H・2Bのような略語になってるけど、Rの列名は数字で始められないから、例えば2Bはx2Bってなってるよ
- ヒット数や打数みたいな数える系のデータはあるけど、打率みたいな割合系のデータはないから自分で計算してね



### The Pitching table


- 投手に関するデータがあるよ
- 打撃テーブルにはなかった割合系のデータもあるよ


### The Fielding table


- 守備に関するデータがあるよ
- 昔のデータは外野がOutFielderとして一括りになってるよ
- 最近のデータはレフト、センター、ライトで分かれてるよ



### The Teams table


- チームの順位や勝敗数などがあるよ
- チーム全体の打撃・投球・守備指標があるよ
- 3文字のteamIDで識別されてるよ


### Baseball Questions


- Q：1試合当たりの平均HR数はどうなってるの？
- A：最初の方は0.3本だったけど、年々増えて2000年代に入ってからは2.2本だよ
- Q：本塁打率と三振率は相関するの？
- A：1試合当たり数は増えていて、2010年代は14.2個だよ


上のやり取りに関するデータはTeam tableにあるよ


- Q：アメリカンリーグにDHが導入されたことで、ナショナルリーグとの得点差は変わったの？
- A：導入してから10年間同じぐらいだったけど、それ以降はアメリカンリーグが0.5点差をキープしてるよ


上のやり取りに関するデータはTeam tableにあるよ


- Q：先発の完投率は100年前と比べてどうなったの？
- A：1900から09年は79%だったけど、2000から10年は3.5%にまで下がってるよ


上のやり取りに関するデータはPitching Tableにあるよ


## Retrosheet 試合ごとのデータ



### 98年のソーサとマグワイアのホームラン競争


- マグワイアがリードしてたけど、8月中旬ぐらいから拮抗してきたよ
- こういうのを考えるときに、試合ごとのデータが必要だよね


### Retrosheet


- Retrosheetはデービッド・スミス教授が立ち上げたボランティア団体だよ
- 試合ごとのデータを集めるのを目的にしてるんだよね
- プレーごとのデータもあって、4節で扱うよ


### 試合記録


- 試合の開催日時、観客数、イニングごとの点数などがあるよ
- 後の章でどんなデータがあるか詳しく見てみようね


### データの取得方法


- データは[ここ](https://www.retrosheet.org/gamelogs/index.html)にあるよ
- 11章4節でデータを取得する関数を作るよ


### 試合記録の例

- 曜日やデーゲームorナイターかなどもわかるよ


### BaseBall questions


- Q：ホームランが多い月ってわかるの？
- A：7月が多いよ
- Q：バッターに優しい、またはピッチャーに優しい審判とかわかるの？
- A：メリーウェザーって人が球審をすると1試合で両チーム合わせて平均10点になるけど、ハーヴェイって人が球審をすると7.8点だよ
- Q：曜日ごとの平均観客動員数はわかるの？
- A：金土日が3万人前後で多いよ。


## Retrosheet プレーごとのデータ


### イベントファイル


- ワンプレーごとのデータがあるよ
- イベント発生時のイニング、アウトカウント、出塁状況などがあるよ
- Appendixでデータを収集してくる関数を公開してるよ


### イベントの例


- データの見方が解説されてるよ
- 文章だと長くなるからデータを直接見てね


### Baseball questions


- Q：マグワイアとソーサで、ランナーがいる状況でより本塁打を打てるのはどっち？
- A：マグワイアは223打数中37本、ソーサは317打数中29本だからマグワイアだよ
- Q：ボンズがランナーなしの状況や満塁の状況で故意四球をどれぐらいもらったかわかる？
- A：結果は省略するけど、このデータでわかるよ
- Q：カウント別の打率とかわかる？
- A：追い込まれたときは.253、ノーストライク2ボールのときは.479だよ


## 1球ごとのデータ


### MLBAM Gameday と PITCHf/x


- 2005年から、the Major League Baseball Advanced Media (MLBAM) GamedayのWebアプリで試合を1球ごとに追うことができるようになったよ
- 最初の方はボールかストライクかぐらいしかわからなかったけど、球速、リリースポイント、軌道などもわかるようになったよ
- PITCHf/xというデータソースがあったけど、Statcastにとって代わられたんだよね


### PITCHf/xの例


- 1球ごとの結果、初速、終速、リリースポイントの位置などがわかるよ
- カジュアルなファンにとってはちょっと難しいけど、例えばボールがストライクゾーンを通ったかどうかがわかるよ
- 横方向と垂直方向の変化、回転率などから球種を予測するアルゴリズムがあるよ


### Baseball questions


- Q：速球を最も多く投げられる打者、またはその逆とかわかる？
- A：2008年から2011年の間で、最も多かった打者で56%、少なかった打者で35％だったよ
- Q：一番早い球を投げるのはだれ？
- A：チャップマンだよ
- Q：球種ごとの盗塁成功率とかわかるの？
- A：とある選手が真っすぐを投げたときは73%、カーブを投げたときは85%だよ


## Player Movement と Off-the-Bat Data


### Statcast


- 2015年から新しく導入されたよ
- 打球角度とか打球速度もわかるよ


### Baseball Savant data


- 相手の守備シフトのデータもわかるよ
- 打球の飛距離もわかるよ

## Data Used in this Book

- LarmanデータはLarmanパッケージで使えるよ
- 小さいデータはabdwr3edataパッケージで使えるよ
- RetrosheetとStatcastは大きすぎるから別途案内するよ
