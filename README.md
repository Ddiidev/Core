# Core - Módulo Compartilhado MaisFoco

## Visão Geral

Este repositório contém o módulo Core do ecossistema MaisFoco, que serve como uma biblioteca compartilhada entre os dois aplicativos principais:

1. **MaisFoco WebServer** - Aplicação web principal onde os usuários podem visualizar recomendações, se inscrever e fazer suas próprias recomendações.

2. **JobSendRecomendation** - Serviço responsável pelo envio diário de recomendações via WhatsApp ou e-mail para os usuários inscritos.

## Propósito

O módulo Core foi criado para resolver o problema de duplicação de código entre os dois projetos. Anteriormente, sempre que uma entidade era alterada em um dos projetos, era necessário copiar manualmente as alterações para o outro projeto, o que gerava inconsistências e aumentava o risco de erros.

Agora, com este módulo compartilhado, ambos os projetos podem importar e utilizar as mesmas entidades, repositórios e serviços, garantindo consistência e facilitando a manutenção.

## Estrutura do Projeto

```
Core/
├── src/
│   ├── conf_env/           # Configurações de ambiente
│   ├── consts/             # Constantes compartilhadas
│   ├── features/           # Funcionalidades e entidades de domínio
│   │   ├── amazon/         # Entidades e repositórios para produtos da Amazon
│   │   ├── contacts/       # Gerenciamento de contatos
│   │   ├── instant_gaming/ # Produtos de jogos
│   │   ├── livros_gratuitos/ # Livros gratuitos
│   │   ├── mercado_livre_play/ # Produtos do Mercado Livre
│   │   ├── netflix/        # Conteúdo da Netflix
│   │   └── user_recomendation/ # Recomendações de usuários
│   ├── handle_email/       # Serviços de envio de e-mail
│   │   ├── implementations/ # Implementações concretas
│   │   ├── interfaces/     # Interfaces para envio de e-mail
│   │   └── service/        # Serviços de e-mail
│   ├── infradb/            # Infraestrutura de banco de dados
│   ├── logger/             # Sistema de logging
│   ├── types/              # Tipos compartilhados
│   └── utils/              # Utilitários diversos
└── v.mod                   # Arquivo de configuração do módulo V
```

## Principais Componentes

### Entidades

O módulo contém todas as entidades de domínio utilizadas pelos aplicativos MaisFoco, como:

- Produtos da Amazon, Netflix, Mercado Livre, etc.
- Recomendações de usuários
- Contatos
- E outras entidades relacionadas

### Infraestrutura de Banco de Dados

O módulo fornece uma camada de abstração para acesso ao banco de dados, suportando tanto SQLite quanto PostgreSQL, facilitando o desenvolvimento e os testes.

### Serviços de E-mail

Implementações para envio de e-mails através de diferentes provedores, utilizando uma interface comum.

### Utilitários e Helpers

Funções utilitárias para validação de e-mail, UUID, números de telefone e outras operações comuns.

## Como Utilizar

Para utilizar este módulo nos projetos MaisFoco e JobSendRecomendation, basta importá-lo como uma dependência em seus respectivos arquivos `v.mod`.

## Benefícios

- **Consistência de Dados**: Garante que ambos os aplicativos utilizem as mesmas definições de entidades.
- **Redução de Duplicação**: Elimina a necessidade de copiar código entre projetos.
- **Manutenção Simplificada**: Alterações nas entidades são feitas em um único lugar.
- **Reutilização de Código**: Compartilha implementações comuns como serviços de e-mail, logging e acesso a banco de dados.

## Tecnologias

Este módulo é desenvolvido em V, uma linguagem de programação simples, rápida e segura.

## Licença

MIT