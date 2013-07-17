# Vagrant Sandbox

Vagrant を使って開発環境を作るための手順です。

## インストール

### Virtual Box のインストール

仮想環境として Virtual Box を使用します。    
以下の URL からインストールしておきます。
    
https://www.virtualbox.org/wiki/Downloads

### Vagrant のインストール

仮想環境の管理に使用します。
以下の URL からインストールしておきます。

http://downloads.vagrantup.com/

### Vagrant Plugin のインストール

Vagrant を使用するにあたり便利なプラグインをインストールしておきます。

````
$ vagrant plugin install sahara
$ vagrant plugin install vagrant-omnibus
````

### Packer のインストール

Vagrant の仮想マシンテンプレートを作成するのに使用します。    
ダウンロード後、適当なパスに配置し、環境変数 PATH に設定を加えておきます。

http://www.packer.io/downloads.html


## 仮想マシンテンプレートを作る

Vagrant で使用する仮想マシンテンプレートを作成します。    
CentOS 6.4 を標準で使用します。

### Vagrant Box の作成

付属の Packer 設定を使用して仮想マシンテンプレートを作成します。

````
$ cd CentOS-6.4-x86_64
$ packer build packer.json
````

### Vagrant Box を登録

Packer が出力した Vagrant 用の Box ファイルを登録します。

````
$ vagrant box add CentOS-6.4 ./CentOS-6.4.box
````

## 仮想マシンを作る

仮想マシンテンプレートを使用して、仮想マシンを作成、起動します。

## 仮想マシンを作成する

付属の Vagrantfile を使用して、仮想マシンを起動します。

```
$ cd CentOS-6.4-x86_64
$ vagrant up
```

## SSH 経由でログイン可能にする

起動した仮想マシンに SSH 経由でアクセスできるように、ssh_config に設定を追加します。    
以下の例ではホスト名を sandbox としています。

````
$ vagrant ssh-config --host sandbox >> ~/.ssh/config
````

## 仮想マシンにログイン

vagrant ssh コマンドまたは ssh コマンドから仮想マシンにログインします。

````
$ vagrant ssh
$ ssh sandbox
````

以上で作業は完了です。