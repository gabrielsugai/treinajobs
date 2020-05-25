<center><img src="https://i.imgur.com/cRj87yM.png"/></center>

<p align="center">
  <img src="https://img.shields.io/static/v1?label=Ruby&message=2.6.5&color=red&style=for-the-badge&logo=ruby"/>
  <img src="https://img.shields.io/static/v1?label=Ruby%20on%20Rails&message=6.0.2&color=red&style=for-the-badge&logo=ruby"/>
</p>

> Status do Projeto: Em desenvolvimento :warning:

### Tópicos 

:small_blue_diamond: [Descrição do projeto](#descrição-do-projeto)

:small_blue_diamond: [Funcionalidades](#funcionalidades)

:small_blue_diamond: [Deploy da Aplicação](#deploy-da-aplicação-dash)

:small_blue_diamond: [Pré-requisitos](#pré-requisitos)

:small_blue_diamond: [Como rodar a aplicação](#como-rodar-a-aplicação-arrow_forward)

... 

Insira os tópicos do README em links para facilitar a navegação do leitor

## Descrição do projeto 

<p allign="justify">Plataforma de vagas de emprego, onde recrutadores podem publicar vagas, candidatos podem se inscrever no processo seletivo. O recrutador pode analisar o perfil de cada candidato com a opção de deixar comentarios no perfil de cada um</p>

## Gems instaladas

:books: [**Devise**](https://github.com/heartcombo/devise) > Autenticação
:books: [**Rspec**](https://github.com/rspec/rspec-rails) > Testes unitarios
:books: [**Capybara**](https://github.com/teamcapybara/capybara) > Testes de integração
:books: [**FactoryBot**](https://github.com/thoughtbot/factory_bot) > Otimizar testes
:books: [**BootStrap**](https://github.com/twbs/bootstrap-rubygem) > Framework de CSS

## Funcionalidades

:heavy_check_mark: Candidato e Recrutador podem se cadastrar

:heavy_check_mark: Candidato completa seu perfil (só terá acesso as demais funcionalidades após essa etapa)

:heavy_check_mark: Recrutador pode iniciar um processo, onde o candidato pode se inscrever

:heavy_check_mark: Recrutador pode ver todos os candidatos cadastrados em seus processos seletivos, e deixar comentarios em seu perfil

:heavy_check_mark: Recrutador pode marcar candidatos como destaque, ou rejeitar candidatos

:heavy_check_mark: Candidato recebe um feedback caso rejeitado

:heavy_check_mark: Recrutador pode enviar proposta para um candidato

:heavy_check_mark: Candidato pode aceitar ou recusar uma proposta (caso aceite, todos os seus outros processos são finalizados)

:heavy_check_mark: Recrutador recebe resposta do candidato e pode encerrar o processo caso ele tenha aceitado

## Pré-requisitos :package:

Algumas instalações serão necessárias antes de iniciar o projeto. 

:warning: [Ruby](https://www.ruby-lang.org/pt/documentation/installation/) versão >=2.6.5

:warning: [Ruby on Rails](https://guides.rubyonrails.org/getting_started.html) versão >=6.0.2.2

:warning: [Node](https://nodejs.org/en/download/) versão >=10.13.0

:warning: [Gem](https://rubygems.org/pages/download?locale=pt-BR) versão >=3.1.2

:warning: [Bundle](https://bundler.io/man/bundle-install.1.html) versão >=2.1.2

:warning: [Yarn](https://classic.yarnpkg.com/pt-BR/docs/install/#windows-stable) versão >=1.22.4 

## Como rodar a aplicação :arrow_forward:

No terminal, clone o projeto: 

```
git clone https://github.com/gabrielsugai/treinajobs.git
```
Entre na pasta
```
cd treinajobs
```
Instale as dependencias e prepare o database
```
bin/setup
```


## Principas comandos

> Subir a aplicação localmente
```
$ rails server or rails s
```
> Rodar os testes
```
$ rspec
```