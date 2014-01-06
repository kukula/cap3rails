### Capistrano3 standalone deploy tool

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