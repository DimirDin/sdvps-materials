# GitLab CI/CD в Яндекс.Облаке  
Выполнил: **Гридин Владимир Александрович**  
Курс: Netology, занятие «GitLab»

---

## Задание 1. Развёртывание GitLab и регистрация runner

1. GitLab запущен в Яндекс.Облаке по адресу  
   [http://51.250.7.143](http://51.250.7.143) (root / ваш пароль).
2. Создан проект `my-project`, зарегистрирован runner с executor **docker**.

Скриншот активного runner:  
![runner-active](screenshots/runner-active.png)

---

## Задание 2. CI/CD-пайплайн

1. Проект запушен в GitLab:
   ```bash
   git remote add origin http://root:*траляля*@51.250.7.143/root/my-project.git
   git push -u origin main

Скриншот pipeline:
![pipeline-passed](screenshots/pipeline-passed.png)

