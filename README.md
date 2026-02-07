# Terraform-Create_GCP-Instance
Google Cloud上にVPC、サブネット、パブリックCompute Engineを作成するためのサンプルTerraformコードです。
このコードは下記のツリー構成で作成しています。

```
│  initial.sh
│  main.tf
│  outputs.tf
│  versions.tf
│
└─modules
    ├─Network-Setup
    │      main.tf
    │      outputs.tf
    │      variables.tf
    │
    └─VM-Setup
            main.tf
            outputs.tf
            variables.tf
```
あくまでも検証用ですので、ご利用の際にはコピーの上、ご自身の環境に合わせてカスタマイズの上お使いいただけますようお願いします。

## コード作成環境
Windows11 Homeエディション 25H2

## 各モジュールの概要
### Network-Setup
* VPC、サブネット、SSH接続を許可するためのファイアーウォールルールを作成
### VM-Setup
* パブリックIPを持つCompute Engineを作成
* SSH接続の際に使用するSSHパブリックキー、及び、ログオンユーザー名を登録
  * SSHキーは事前にローカルでssh-keygenコマンドで作成。その際、「-C」オプションを指定して、Compute Engineにログオンするユーザー名を指定する。
※詳細については、下記ドキュメントを参照

https://docs.cloud.google.com/compute/docs/connect/create-ssh-keys?hl=ja

* Compute Engineは起動時に、initial.shシェルスクリプトに記載のコマンドを実行。(Google Cloudではメタデータスクリプトと呼ばれます。AWSのEC2におけるユーザーデータと同じです。)

## 使用方法
コードが存在するディレクトリに移動し、以下のコマンドを順次実行。
```
terraform init
terraform plan
terraform apply
```
コードの実行が完了すると、Compute EngineのパブリックIPとプライベートIPが表示されます。
ローカルからSSH接続する際には、パブリックIPを指定の上、ログオンください。
