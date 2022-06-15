# Projeto final Flutter

## Aluno
**Nome:** Davis Amaral dos Santos</br>
**RM:** 47149</br>
**Turma:** 24MOB

## 24Mob Movies

### Funcionalidades

#### Splash Screen
Tela de carregamento do app, quando o usuário abre o app, verificamos se já existe uma sessão, caso positivo o usuário é direcionado para a tela de listagem de filmes, caso contrário, abrimos a tela de login.

#### Login
Nesta tela o usuário pode efetuar o login ou, caso não seja cadastrado, optar por criar um usuários.

#### SignUp
Aqui o usuário pode cadastrar um novo usuários, nesta tela são feitas validações de email e senha. Assim que o usuário efetuar o cadastro com sucesso, será direcionado para a tela de listagem de filmes.

#### Movies
Esta é a tela principal do aplicativo, onde o usuário pede ver as listas de de filmes populares, bem avaliados, em cartaz e que estarão em breve nos cinemas. Essas listas tem como fonte de dados a api pública do site The Movies DB e são carregadas paralelamente e de forma assíncrona.

| Splash | Login | SignUp | Movies | Movies |
|--|--|--|--|--|
|![splash_screen](https://user-images.githubusercontent.com/4776697/178381311-752d77fb-8286-4f76-be2b-7773fd573952.png)|![login_screen](https://user-images.githubusercontent.com/4776697/178381569-f39c8468-cf58-4e0a-b782-f57f5a578672.png)|![signup_screen](https://user-images.githubusercontent.com/4776697/178381589-6d36222f-5b35-46db-8c64-902a71589707.png)|![movies_screen_1](https://user-images.githubusercontent.com/4776697/178381621-6f76881e-2742-4ad2-85ad-72b8997f98da.png)|![movies_screen_2](https://user-images.githubusercontent.com/4776697/178381676-ec72f037-5c86-4e6c-853c-aee6af33f332.png)|

### Sobre o projeto

#### Configuração 
As configurações de endpoints e chaves são feitas no arquivo `configuration.json` que fica no diretório `/assets` do projeto.

#### Arquitetura
O projeto está estruturado em uma arquitetura em camadas, baseado no clean architecture, e a camada de apresentação segue o padrão MVVM.

#### Internacionalização
Todos os textos do app estão internacionalizados, os arquivos dentro do diretório `I10n` contém todas as strings utilizadas no projeto, a biblioteca `flutter_localizations` foi utilizada para este fim.

| Configuração | Arquitetura | Internacionalização |
|--|--|--|
|![Screen Shot 2022-07-11 at 21 50 45](https://user-images.githubusercontent.com/4776697/178384632-cb2c6ebf-7d8b-48ff-8cdf-1bfdc195c00d.png)|![Screen Shot 2022-07-11 at 21 31 57](https://user-images.githubusercontent.com/4776697/178384536-90212787-d989-412f-a85f-5372081f8609.png)|![Screen Shot 2022-07-11 at 21 31 28](https://user-images.githubusercontent.com/4776697/178384560-56a209a9-22a7-4e0a-bb58-d42ffb1725e9.png)|
