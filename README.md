# Marp Skill for Claude Code

**v1.0.0**

[Marp](https://marp.app/) を使ってMarkdownからプレゼンテーションスライドを作成する [Claude Code](https://claude.com/claude-code) スキルです。

## 特徴

- **タイトル + リード文 + コンテンツ** の3段構成でPPTライクなスライドを生成
- タイトルバー上部固定、リード文中央揃え、コンテンツ上詰めのレイアウト
- 2カラム、数値強調、セクション区切りなどのレイアウトパターン
- PDF → JPG変換によるビジュアルQAワークフロー内蔵
- 日本語対応テーマ（MSPゴシック）同梱

## インストール

### 方法1: Claude Code の `/install-skill` を使う

```
/install-skill https://github.com/<your-username>/marp-skill
```

### 方法2: 手動インストール

```bash
# スキルディレクトリにクローン
git clone https://github.com/<your-username>/marp-skill.git ~/.claude/skills/marp

# 依存関係をインストール
bash ~/.claude/skills/marp/setup.sh
```

## 依存関係

`setup.sh` を実行すると以下が自動インストールされます:

| ツール | 用途 |
|--------|------|
| `@marp-team/marp-cli` | Markdown → HTML/PDF/PPTX変換 |
| Google Chrome | PDF・画像出力エンジン |
| `poppler-utils` | PDF → JPG変換（QA用） |

## 使い方

Claude Code で `/marp` と入力するか、スライド作成を依頼してください。

```
/marp プロジェクトの進捗報告スライドを作って
```

## ファイル構成

```
├── SKILL.md          # スキル定義（Claude Codeが読む）
├── theme-simple.css  # 日本語対応テーマ
├── setup.sh          # 依存関係セットアップスクリプト
├── .vscode/
│   └── settings.json # VSCode Marp拡張用設定
├── examples/         # サンプルスライド
│   ├── hubmap_summary.md
│   ├── hubmap_summary.pdf
│   └── images/
└── README.md         # このファイル
```

## VSCode でのプレビュー

1. VS Code 拡張「[Marp for VS Code](https://marketplace.visualstudio.com/items?itemName=marp-team.marp-vscode)」をインストール
2. `.vscode/settings.json` が同梱されており、テーマと HTML タグが自動で有効になります
3. Markdown ファイルの front matter に `theme: simple-jp` を記載
4. VS Code のプレビュー（`Ctrl+Shift+V`）でスライドが表示されます

## テーマ: simple-jp

同梱の `theme-simple.css` は以下のスライドクラスを提供します:

| クラス | 用途 | 背景色 |
|--------|------|--------|
| `title` | タイトルスライド | ダークネイビー |
| `section` | セクション区切り | ダークグレー |
| `summary` | まとめスライド | 白 |
| `no-lead` | リード文なし（他クラスと併用） | - |
| (なし) | 通常コンテンツ | 白 |

## ライセンス

MIT License
