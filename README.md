# AWS Lambda's script for Notify Slack
CloudWatchのアラームをSlackで通知するためのスクリプト
## 概要
CloudWatchで設定したアラームをAWS Lambdaを通してSlackに通知する


1. SlackのworkspaceにIncoming WebHooksを追加する
2. AWS Lambdaで関数を作成する
3. 関数コード - コード エントリ タイプ で「.zipファイルをアップロード」
