# viperSample
This project is sample for learning VIPER architecture(https://youtu.be/ieqNIySokxI)

Apple MVC<br>
V → UIView(main)<br>
    subView<br>
C → UIViewContrller<br>
M　→　？<br>

problem<br>
開発者によって認識が異なる<br>
Fat ViewControllerになりがち<br>

What is VIPER<br>

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

<img width="500" alt="スクリーンショット 2020-11-15 11 23 35" src="https://user-images.githubusercontent.com/60373909/99161416-74b98f80-2735-11eb-96be-f0070ebfcc0c.png">

