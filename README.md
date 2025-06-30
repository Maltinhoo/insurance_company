# 🚀 Desafio Técnico – Flutter Developer

Este projeto foi desenvolvido como parte do desafio técnico para a vaga de Flutter Developer, com foco em entregar uma aplicação completa, funcional, responsiva e bem estruturada, compatível com mobile e web utilizando Flutter.

---

## 🔧 Funcionalidades

### 1. Tela de Login
- Campos para CPF (com máscara) e senha.
- Botões de **Entrar** e **Cadastrar**.
- Checkbox **Lembrar sempre**.
- Link **Esqueceu a senha?**.
- Ícones ilustrativos de redes sociais.
- Login funcional utilizando **Firebase Authentication**.

### 2. Tela Home (pós-login)
- Saudação com o nome do usuário logado.
- Área **Cotar e Contratar** com ícones para: Automóvel, Residência, Vida, Acidentes Pessoais.
- Seções:
  - **Minha Família**: botão para adicionar membros.
  - **Contratados**: lista inicialmente vazia com mensagem de estado vazio.

### 3. Menu Lateral (Drawer)
- Exibição do nome e avatar do usuário.
- Itens de menu:
  - Home / Seguros
  - Minhas Contratações
  - Meus Sinistros
  - Minha Família
  - Meus Bens
  - Pagamentos
  - Coberturas
  - Validar Boleto
  - Telefones Importantes
  - Configurações

### 4. Funcionalidade Adicional
- Ao clicar no card **Automóvel**, é aberta uma **WebView** com o site [https://jsonplaceholder.typicode.com](https://jsonplaceholder.typicode.com).

### 5. Responsividade
- Aplicação desenvolvida com foco em responsividade, funcionando perfeitamente tanto em dispositivos móveis quanto em navegadores web, utilizando o mesmo código base.

---

## 🛠️ Tecnologias e Pacotes Utilizados

- **flutter_bloc**: Gerenciamento de estado com Bloc/Cubit.
- **go_router**: Navegação declarativa moderna.
- **firebase_core, firebase_auth, cloud_firestore**: Integração com Firebase para autenticação e backend.
- **flutter_svg**: Suporte a imagens SVG.
- **cached_network_image**: Carregamento e cache de imagens.
- **webview_flutter, webview_flutter_web**: Exibição de conteúdo web via WebView.
- **oktoast**: Sistema de notificações/feedback ao usuário.
- **shared_preferences**: Armazenamento local de preferências.
- **get_it**: Injeção de dependências.
- **mask_text_input_formatter**: Aplicação de máscaras no campo de CPF.
- **shimmer**: Efeito de loading com placeholder animado.
- **auto_size_text, gap**: Melhorias na responsividade e espaçamento da UI.

---

## ▶️ Como Rodar o Projeto

```bash
# Clone o repositório
git clone [https://github.com/seu-usuario/seu-repositorio.git](https://github.com/Maltinhoo/insurence_company)

# Instale as dependências
flutter pub get
# Para dispositivos móveis
flutter run

# Para Web
flutter run -d chrome
