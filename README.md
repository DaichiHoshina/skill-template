# skill-template

単独の公開スキルを作るための雛形。スキル 1 本につき独立 repo を 1 つ作り、その repo を正本にする。

## 使い方

```bash
scripts/new.sh <スキル名>     # 同じ階層に <スキル名>/ を作る
cd ../<スキル名>
# skills/<スキル名>/SKILL.md を書く
scripts/check-public.sh       # 公開前検査
```

公開 (GitHub への push) は検査を通してから手で行う。

## 検査の内容

- 個人 path が無い
- 社内の語と個人名が無い (term list 2 file を使う。list が無いと停止する)
