# インフラ勉強会 AD-DNS環境

## 概要

- AWS上にAD×2,Clientを構築
  - OSまでの構築で役割機能の追加は自動化しない
- terraformを使用

## 構成

![構成図](https://raw.githubusercontent.com/kmd2kmd/iw-ad001/master/images/diagram.png)

## 手順(Mac,Linux)

### アクセスキーのセット

```bash
export AWS_ACCESS_KEY_ID=accesskey
export AWS_SECRET_ACCESS_KEY=secretkey
```

### デプロイ

```bash
git clone https://github.com/kmd2kmd/iw-ad001
cd iw-ad001
bash keygen.bash
mv varibales.tf.sample varibales.tf
vi varibales.tf # 必要箇所を記載
terraform init
terraform plan
terraform apply
```

### SSHポートフォワード

```bash
ssh -fNC -L 13389:10.0.10.11:3389 -i ./iw-ad001 ec2-user@[[ad01IPaddr]]
ssh -fNC -L 23389:10.0.10.12:3389 -i ./iw-ad001 ec2-user@[[ad02IPaddr]]
ssh -fNC -L 33389:10.0.10.13:3389 -i ./iw-ad001 ec2-user@[[client01IPaddr]]
```
