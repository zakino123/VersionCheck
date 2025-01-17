// ==================================================
// Simpacker 用 manifest.json 出力 Node.js スクリプト
// 基本の使い方：node output_manifest_js.js public
// ==================================================
const fs = require('fs');
const path = require('path');
const crypto = require('crypto');

// default ignore Path
const DEFAULT_IGNORE_PATH = 'public';
// default manifest.json path
const DEFAULT_OUTPUT_MANIFEST_PATH = 'public/packs/manifest.json';
// Cache Bustring String Source
const S = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
// Number of Cache Bustring String
const N = 6;

// 引数のチェック
function showUsageAndExit() {
  const basename = path.basename(process.argv[1]);
  console.error(`Usage: node ${basename} <対象ディレクトリパス> <省略可能:無視するパス> <省略可能:manifest.jsonのパス>`);
  process.exit(1);
}

// ファイルを取得するための同期関数
function getFiles(dirpath, basePath, outputObject) {
  const dirents = fs.readdirSync(dirpath, { withFileTypes: true });

  // ディレクトリとファイルを分けて保持
  const directories = [];
  const files = [];

  // ディレクトリとファイルを分類
  for (const dirent of dirents) {
    if (dirent.isDirectory()) {
      directories.push(dirent);
    } else {
      files.push(dirent);
    }
  }

  // ディレクトリとファイルをそれぞれアルファベット順にソート
  directories.sort((a, b) => a.name.localeCompare(b.name));
  files.sort((a, b) => a.name.localeCompare(b.name));

  // 先にディレクトリを処理
  for (const directory of directories) {
    const fp = path.join(dirpath, directory.name);
    getFiles(fp, basePath, outputObject); // 再帰的にディレクトリを探索
  }

  // 次にファイルを処理
  for (const file of files) {
    const fp = path.join(dirpath, file.name);
    if (basePath === dirpath) {
      // basePath直下のファイルは無視
      continue;
    } else if (fp === outputManifestPath) {
      // マニフェストファイル自体は処理対象外
      continue;
    }
    const cacheBustringString = Array.from(crypto.randomFillSync(new Uint8Array(N))).map((n) => S[n % S.length]).join('');
    outputObject[file.name] = `/${fp.replace(basePath + '/', '')}?v=${cacheBustringString}`;
  }
}

// process.argv[0] : Node.jsの実行プロセスのフルパス
// process.argv[1] : スクリプトファイルのフルパス
// なので3番目以降をargsに取り出す
const args = process.argv.slice(2);
if (args.length < 1) {
  showUsageAndExit();
}

if (args.length < 2) {
  args.push(DEFAULT_OUTPUT_MANIFEST_PATH);
  args.push(DEFAULT_IGNORE_PATH);
}

if (args.length < 3) {
  args.push(DEFAULT_IGNORE_PATH);
}

const checkPath = args[0];
const outputManifestPath = args[1];
const ignorePath = args[2];
const outputObject = {};

// ファイルを取得してオブジェクトを構築
getFiles(checkPath, ignorePath, outputObject);

// readdirSync で同期的に outputObject を生成しているので manifest.jsonを同期的に書き出し
fs.writeFileSync(outputManifestPath, JSON.stringify(outputObject, null, 2));
console.log(`${outputManifestPath} の出力に成功しました`);
