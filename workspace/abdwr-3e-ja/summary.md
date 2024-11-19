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
















