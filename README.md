# README

# アプリケーション名
"HEAP" 
 
# Outline
 映画、ドラマ、小説、アニメ、漫画など沢山の作品を楽しむ方の視聴遍歴などをアーカイブするアプリです。  
 他のユーザーの投稿一覧もみることができて、その中から気になる作品を見つけることもできます。  
 ユーザーそれぞれにパラメータとレベルが設けてあるので沢山の作品を見れば見るほどレベルやパラメータの変化が
 楽しめるアプリになっています。

 
# URL
 https://heap-original-app.herokuapp.com/
 
# テスト用アカウント
 - Basic認証  
 ID： admin  
 pass: 2222  
 - アカウント  
 e-mail: test@com  
 pass: nagamori3  
 
# 利用方法
 - ログイン後、閲覧した作品を投稿する場合  
  トップページの右下に登録のアイコンがあるのでそこをクリックして閲覧作品の投稿フォームに従い必要情報を入力して登録する  
  投稿作品の編集、削除は作品一覧ページにて対象の作品をクリック後に表示される詳細ページにてボタンが設けあるのでそこから対応可能。  
  他のユーザー作品に対してはこのアクションは行えない。

 - マイページを開く場合  
  トップページに表示されている自身で設定したニックネームをクリックするとメニューリストが表示される。  
  マイページをクリックすれば自身のステータス表示がされている画面になる。そこにはステータス表示のに自分が視聴するメディアの  
  使用割合、閲覧してきた作品のジャンル別の作品数が表示されている。この数値は閲覧作品投稿により変化する。  
  その他、自身の投稿作品一覧、フォロー中一覧、フォロワー一覧、気になるをした作品の一覧が表示される。
 
 - ステータスと経験値について  
  ステータス(知力、ユーモア、勇気、思いやり、運、決断力が割り振られたもの)は、投稿する作品のジャンルによって変化する。  
  経験値は投稿する作品の使用するメディア、及び作品の印象の組み合わせで変化する。
 
 - 閲覧作品一覧の検索機能について  
  自身が投稿した作品は一覧として確認できることに加え、複数の検索条件によって絞り込むことができる。  
  これは他のユーザーの一覧でも使用可能。
 
 - フォロー機能について  
  トップページには他のユーザーが一覧表示されている。視聴遍歴など確認ができて気になるユーザーであればフォローすることができる。  
  フォローする際にはフォローボタンが設けてあるのでそこをクリックする。フォローを外す場合はフォロー解除ボタンをクリック。  
  フォローしたユーザーは一覧で確認可能。また自分をフォローしているユーザーも一覧で確認できる。
 
 - 気になるの機能について  
  他のユーザーが閲覧した作品一覧ページで作品をクリックするとその作品の詳細ページに移る。そのページの下段に設けある  
  ♡マークあるのでそこをクリックすると気になる作品として登録できる。横にある数字は他のユーザーが気になるボタンを押した総数。  
  気になるを押した作品は、一覧ページで確認可能。

 
# 目指した課題解決
 ・自身の視聴遍歴を視覚化して今後の視聴行動を考えるきっかけにしたい
  人それぞれ好みは違うもので、それに伴ってどんな作品をみるかは決まっていくと思う。
  そうすると、自然と見るものの傾向に偏りが出て他のジャンルやメディアに触れるきっかけが減ってしまう。
  昨今のサブスクサービスなどではレコメンデーションなどあるが、それは視聴遍歴に基づくものであって
  やはりその内容は似た傾向のものになることが多い。
  HEAPでは投稿した作品の使用したメディアとそのジャンルが視覚的に確認できるので、それをみて普段読まない小説を読んでみようとか
  普段見ないジャンルに挑戦してみようというきっかけ作りができればと思った。 

 ・読書習慣の獲得
  スマホで手軽に動画配信サービスが利用できる今、読書へ割く時間は減少傾向にある。
  HEAPでは経験値を獲得してレベルを上げる機能があるが、使用するメディアによってその数値は異なる。
  中でも小説については他のメディアに比べて経験値の配分を多くしてあるので、レベルを上げるゲーム感覚で
  小説などの読書に目を向けてもらえればと思った。
 

 
# 洗い出した要件定義
 
 優先順位（高：3、中：2、低：1） | 機能 | 目的 | 詳細 | ストーリー(ユースケース) | 見積もり（所要時間）
-- | -- | -- | -- | -- | --
3 | ユーザー管理機能 | ユーザー毎に投稿やフォロー相手など管理するため | deviseを利用したアカウント管理機能を実装。入力内容はニックネームとパスワード、誕生日とする。一度登録すれば次回よりログイン画面でアプリが利用可能。 | 新規であればアカウント作成画面で必要情報を入力してアカウント作成。アカウント作成済みであれば、ログイン画面にて必要情報を入力してアプリを利用。 | 3
2 | お気に入り機能 | LIKEテーブルを作成して、どのユーザーがどの作品にお気に入りをしたか管理してそれをリスト化する。 | 他のユーザーが投稿した閲覧作品に気になるものがあればそれを、チェックすることでリスト化出来る。後で読んだり観たりしたいものの備忘録として利用。 | ・他のユーザーが投稿した作品が対象・気になるのマークをクリックして利用・自身の投稿へはクリック不可・一つの投稿に対し一回しか押せない。・お気に入りのリストは自分しか見れない。 | 2
2 | フォロー機能 | 好きなユーザーをフォローすることでその人の閲覧作品を簡単にみることができる。 | フォローボタンをクリックすることでフォローを実現する。またフォローしたユーザーはフォロー解除ボタンでフォローを外すことができる。 | ・アプリ内に複数ユーザーが存在する。・どのユーザーもフォロー可能・フォロー済みの場合はフォロー解除の選択肢・フォローした人は一覧で確認できる。・誰からフォローされているかも一覧で確認可 | 2
3 | 閲覧作品投稿機能 | 自分が見たり読んだりした作品を投稿して管理する | 閲覧した作品を投稿して管理することができる。 | ・１ユーザーに付き複数投稿可能・削除、編集可能・他ユーザーの投稿は閲覧のみ | 3
2 | 閲覧作品検索 | 自分、他のユーザーが投稿した作品をジャンルやメディア毎に検索が可能。 | 複数条件指定した上で確認したい作品の検索を可能にする。 | ・複数の作品が投稿されている・タイトル、ジャンル等の検索条件を設ける・検索結果は専用のページで表示する | 3
3 | ステータス機能 | ユーザーそれぞれにレベルなどのステータスを設ける | ユーザーは投稿する毎に経験値を獲得できレベルや投稿した作品に応じたステータスが割り振られる。視聴遍歴によりユーザー毎にその内容が異なる。 | ・経験値は一つの投稿につき獲得・経験値は閲覧メディア、作品の印象によって変動・ステータスは閲覧した作品のジャンルによって変わる | 3



 
# 実装した機能
- マイページに設けた作品閲覧分析とステータス
 [![Image from Gyazo](https://i.gyazo.com/71972d3980ca8864c6cb9ef8debe7217.gif)](https://gyazo.com/71972d3980ca8864c6cb9ef8debe7217)

- 他ユーザーの投稿作品へ対する気になる機能
[![Image from Gyazo](https://i.gyazo.com/314bb65e1eee069e4eb95993cfa5199c.gif)](https://gyazo.com/314bb65e1eee069e4eb95993cfa5199c)
 
# 実装予定の機能
  フォローしあっているユーザー同士がコミュニケーションが取れるようなチャット機能
  フォロー、気になるボタンの非同期通信

# データベース設計図
  [![Image from Gyazo](https://i.gyazo.com/b628ad4434308a2d69c9e513b3763962.png)](https://gyazo.com/b628ad4434308a2d69c9e513b3763962)

# ローカルでの動作方法
 - バージョン情報  
  ruby 2.6.5  
  Rails 6.0.4  
 - 注意点  
  rails db:migrate後に、rails db:seedを実施  
  leveltableに経験値の閾値を入力するため。