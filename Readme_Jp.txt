************************************************************
      StarPRNT SDK Ver 5.0.2
         Readme_Jp.txt                  スター精密（株）
************************************************************

 1. 概要
 2. Ver 5.0.2 についての変更点
 3. 内容
 4. 適用
 5. 制限事項
 6. 著作権
 7. 変更履歴

==========
 1. 概要
==========

  本パッケージは、StarPRNT SDK Ver 5.0.2 です。
  StarIO/StarIO_Extension/SMCloudServicesは、Starプリンタを使用するアプリケーションの開発を
  容易にするためのライブラリです。

  本ソフトウェアは現在、iOS 7.0 - iOS 9.3に対応しています。

  詳細な説明は、ヘルプファイルを参照ください。


==============================
 2. Ver 5.0.2 についての変更点
==============================

  [StarIO]
    - StarPRNTエミュレーションに設定されたモバイルプリンタにおいて
      connectedプロパティおよびgetOnlineStatusメソッドが機能しない問題を修正。


==========
 3. 内容
==========

  StarPRNT_iOS_SDK_V5_0_2
  |- Readme_En.txt                          // リリースノート (英語)
  |- Readme_Jp.txt                          // リリースノート (日本語)
  |- SoftwareLicenseAgreement.pdf           // ソフトウエア使用許諾書 (英語)
  |- SoftwareLicenseAgreement_jp.pdf        // ソフトウエア使用許諾書 (日本語)
  |
  +- Document
  |  |- StarPRNT_iOS_SDK_En.pdf                // StarPRNT SDKドキュメント (英語)
  |  +- StarPRNT_iOS_SDK_Jp.pdf                // StarPRNT SDKドキュメント (日本語)
  |
  +- Documents_V3
  |  |- Readme_V3_En.txt                                    // V3リリースノート(英語)
  |  |- Readme_V3_Jp.txt                                    // V3リリースノート(日本語)
  |  |- StarIO_ESCPOS_PortablePrinter_iOS_SDK.pdf           // ESC/POSモバイルプリンタSDKドキュメント (英語)
  |  |- StarIO_ESCPOS_PortablePrinter_iOS_SDK_Jp.pdf        // ESC/POSモバイルプリンタSDKドキュメント (日本語)
  |  |- StarIO_POSPrinter_iOS_SDK.pdf                       // POSプリンタSDKドキュメント (英語)
  |  |- StarIO_POSPrinter_iOS_SDK_Jp.pdf                    // POSプリンタSDKドキュメント (日本語)
  |  |- StarIO_StarPRNT_iOS_SDK.pdf                         // StarPRNTモバイルプリンタSDKドキュメント (英語)
  |  |- StarIO_StarPRNT_iOS_SDK_Jp.pdf                      // StarPRNTモバイルプリンタSDKドキュメント (日本語)
  |  |- StarIO_DK-AirCash_iOS_SDK.pdf                       // DK-AirCash SDKドキュメント (英語)
  |  |- StarIO_DK-AirCash_iOS_SDK_Jp.pdf                    // DK-AirCash SDKドキュメント (日本語)
  |  |- ProxiPRNT_iOS_SDK.pdf                               // ProxiPRNT SDKドキュメント (英語)
  |  |- ProxiPRNT_UsersGuide_en.pdf                         // ProxiPRNTユーザーズガイド (英語)
  |  +- StarMicronics_POSPrinters_Mac_Ethernet.pdf          // POSプリンタMac OSXドキュメント (英語)
  |
  +- Software
     +- Distributables
     |  |- StarIO.framework                  // StarIO.framework (Ver 2.2.5)
     |  |- StarIO_Extension.framework        // StarIO_Extension.framework (Ver 1.4.0)
     |  +- SMCloudServices.framework         // SMCloudServices.framework (Ver 1.3.0)
     |
     +- StarPRNT SDK
        |- IOS SDK                         // サンプルプログラム (Ver 3.16.1)
        |- ObjectiveC SDK                  // サンプルプログラム (Ver 5.0.2)
        |- Swift SDK                       // サンプルプログラム (Ver 5.0.2)
        +- StarPRNT SDK.xcworkspace        // Xcode workspace

==========
 4. 適用
==========

  対応エミュレーションについては以下になります。
     - StarPRNT
     - Star Line Mode
     - Star Graphic Mode
     - ESC/POS
     - ESC/POS Mobile
     - Star Dot Impact

       コマンドの詳細は各コマンド仕様書を参照ください。
       各マニュアルはスター精密のウェブサイトで入手可能です。


===============
 5. 制限事項
===============



===========
 6. 著作権
===========

  スター精密（株）Copyright 2016


=============
 7. 変更履歴
=============
  Ver 5.0.2
   2016/08/25 : [StarIO]
                  - StarPRNTエミュレーションに設定されたモバイルプリンタにおいて
                    connectedプロパティおよびgetOnlineStatusメソッドが機能しない問題を修正。

  Ver 5.0.1
   2016/08/11 : [Objective-C SDK and Swift SDK]
                  - サンプルコードの追加
                    * カメラとフォトライブラリの印刷
                    * Bluetooth接続と切断
                    * ポート名とポート設定の手動入力
                    * キャッシュドロワの開閉センサの選択
                    * デバイスステータスの確認
                    * ドイツ語のサンプル印刷
                    * アプリケーション状態遷移の実装例

                [StarIO.framework]
                  - バージョンアップ
                    * API内の軽微な変更

                [StarIO_Extension.framework]
                  - バグ修正
                    * 接続と切断の繰り返し呼び出しへの対策

                [SMCloudServices.framework]
                  - バージョンアップ
                    * API内の軽微な変更.

  Ver 5.0.0
   2016/03/28 : 新規発行
