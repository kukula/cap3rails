### Cap3 standalone deploy tool

#### Why?

1. I want to keep it separately. Keep deploy tool in rails app it's not best idea
2. I want to have independent deploy tool for many rails apps
3. I want to restrict access to deploy tool in team. Juniors are shouldn't touch it.
4. It's should be easy to maintain and improve

#### How to use?

1. Clone cap3rails
2. Copy config file ```cp settings/production.yml.example settings/production.yml```
3. Puts your settings in config file
4. ```cap production deploy```
5. ...
6. Profit!

#### Авторизировать публичный ключ на удаленном сервере

```sh
cat ~/.ssh/id_rsa.pub | ssh USER@SERVER.COM 'cat >> ~/.ssh/authorized_keys'
```

#### Вызов задачи для production окружения

```sh
cap ИМЯ_ОКРУЖЕНИЯ ИМЯ_ЗАДАЧИ 
```

Например

```sh
cap production info:image_magick
```

#### Проверить доступность удаленного репозитория и создать базовые каталоги (deploy_to, deploy_to/shared, deploy_to/releases)

```sh
cap production deploy:check
```

#### Удалить все связаное с приложением сперва выключив веб сервер

```sh
cap production destroy:soft
```

#### Удалить все связаное с приложением

```sh
cap production destroy:hard
```