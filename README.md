# singularity_elasticsearch

## singularity image のビルド
以下のコマンドで singularity image をビルドしてください。
```
$ sudo singularity build elasticsearch.sif Singularity
```

## 初期設定
以下のコマンドで singularity isntance 起動のための初期設定を行います。start_container.shに記載されているINSTANCE変数の値は起動するsingularity instanceの名前ですので、適宜変更してください。
```
$ bash start_container.sh
```

いくつかのディレクトリとelasticsearch、kibanaの設定ファイルが作成されます。以下のコマンドで一度singularity instanceを停止し、elasticsearch_config以下の設定ファイルとkibana.ymlを適宜編集してください。

```
$ singularity instnace stop elasticsearch
```

## singularity instance の起動
以下のコマンドで singularity instance を起動します。
```
$ bash start_container.sh
INFO:    instance started successfully
```

## elasticsearch へのアクセス

http://localhost:9200/ をウェブブラウザで開いてください。ポート番号は elasitcsearch_config/elasticsearch.yml 内の設定により変化します。

## kibana へのアクセス

http://localhost:5601/ をウェブブラウザで開いてください。
