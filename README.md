# viperSample
This project is sample for learning VIPER architecture

Apple MVC
UIView(main)　→　V<br>
└subView　→　V<br>
UIViewContrller　→　C<br>
M　→　？<br>

problem<br>
開発者によって認識が異なる<br>
Fat ViewControllerになりがち<br>

View<br>
見た目とユーザ操作を担当<br>
ユーザ操作はInteractroに処理を移譲<br>
presenterからの表示指示に従う<br>

Interactor<br>
ビジネスロジックを担当<br>
CRUD<br>
エンティティの作成と破棄<br>
単一責任の原則<br>

Presenter<br>
旗振り役<br>
ビューからの依頼を捌く<br>
interactorへ要求<br>
routerへの指示<br>
ウェイターのような役割<br>

Entity<br>
データそのもの<br>
ビジネスロジックを持たない<br>
ドメインに抽象化されたモデル<br>

Router<br>
画面遷移を担当<br>
遷移先の画面を生成<br>
依存性を注入<br>