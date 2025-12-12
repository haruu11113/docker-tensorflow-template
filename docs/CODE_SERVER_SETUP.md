# code-server セットアップガイド

このドキュメントでは、code-serverを使用してブラウザでVS Codeを使用する方法について説明します。

## 概要

code-serverは、ブラウザから完全なVS Code環境にアクセスできるようにするツールです。このセットアップでは以下が可能になります：

- ブラウザからVS Codeインターフェースを使用
- ターミナルアクセス
- GitHub Copilotのサポート（VS Code Marketplaceから拡張機能をインストール）
- IntelliSenseを使用したPython開発
- Git統合
- ファイルエクスプローラー

## インストール方法

このリポジトリのDockerイメージには、code-serverがプリインストールされています。

1. コンテナをビルドします：
```bash
make build
```

2. コンテナを起動します：
```bash
make up
```

## 使用方法

### code-serverを起動（フォアグラウンド）

```bash
make code-server
```

このコマンドは、code-serverをフォアグラウンドで起動します。ログがターミナルに表示されます。

### code-serverを起動（バックグラウンド）

```bash
make code-server-bg
```

このコマンドは、code-serverをバックグラウンドで起動します。

### アクセス方法

ブラウザで以下のURLにアクセスしてください：

```
http://localhost:8080
```

デフォルトのパスワード: `codeserver`

## セキュリティ上の注意

### パスワードの変更

本番環境で使用する場合は、デフォルトのパスワードを必ず変更してください。

1. `code-server-config.yaml`ファイルを編集します：
```yaml
password: your-secure-password
```

2. または、環境変数を使用します：
```bash
docker compose exec tf bash -c 'PASSWORD=your-secure-password code-server /home/ec2-user/repo/'
```

## GitHub Copilotの設定

1. code-serverにアクセスした後、左側のExtensionsアイコンをクリックします
2. 「GitHub Copilot」を検索します
3. 「Install」をクリックします
4. GitHubアカウントでサインインします
5. GitHub Copilotのサブスクリプションが必要です

## トラブルシューティング

### code-serverに接続できない

1. コンテナが起動しているか確認します：
```bash
make ps
```

2. ログを確認します：
```bash
make logs
```

3. ポート8080が他のサービスで使用されていないか確認します：
```bash
lsof -i :8080
```

### パスワードが機能しない

設定ファイルが正しくコピーされているか確認します：
```bash
docker compose exec tf cat /root/.config/code-server/config.yaml
```

## 技術仕様

- **バージョン**: code-server 4.23.1
- **ポート**: 8080
- **認証**: パスワード認証
- **作業ディレクトリ**: /home/ec2-user/repo/
- **設定ファイル**: /root/.config/code-server/config.yaml

## 参考リンク

- [code-server公式ドキュメント](https://coder.com/docs/code-server/latest)
- [VS Code Extensions Marketplace](https://marketplace.visualstudio.com/)
- [GitHub Copilot](https://github.com/features/copilot)
