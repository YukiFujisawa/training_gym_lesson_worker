# training_gym_lesson_worker

## Rubyのセットアップ

see: https://github.com/rbenv/rbenv
```bash
$ brew install rbenv
$ rbenv init
$ source ~/.bash_profile
$ curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
$ rbenv install 2.6.0
$ rbenv local 2.6.0
$ ruby -v
ruby 2.6.0p0 (2018-12-25 revision 66547) [x86_64-darwin18]
$ gem install bundler
```

## 初期インストール

```bash
$ bundle install
$ docker-compose up -d
```

## docker起動、停止

```bash
$ docker-compose start
$ docker-compose stop
