🚀 Desafio Técnico – Flutter Developer
Este projeto foi desenvolvido como parte do desafio técnico para a vaga de Flutter Developer, com foco em entregar uma aplicação completa, funcional, responsiva e bem estruturada, compatível com mobile e web utilizando o Flutter.

🔧 Funcionalidades
A aplicação conta com as seguintes telas e recursos:

1. Tela de Login

Campos para CPF (com máscara) e senha.

Botões de "Entrar" e "Cadastrar".

Checkbox “Lembrar sempre”.

Link “Esqueceu a senha?”.

Ícones ilustrativos de redes sociais.

Login funcional utilizando Firebase Authentication.

2. Tela Home (pós-login)

Saudação com o nome do usuário logado.

Área “Cotar e Contratar” com ícones para: Automóvel, Residência, Vida, Acidentes Pessoais.

Seções:

"Minha Família": botão para adicionar membros.

"Contratados": lista inicialmente vazia com mensagem de estado vazio.

3. Menu Lateral (Drawer)

Exibição do nome e avatar do usuário.

Itens de menu: Home / Seguros, Minhas Contratações, Meus Sinistros, Minha Família, Meus Bens, Pagamentos, Coberturas, Validar Boleto, Telefones Importantes, Configurações.

4. Funcionalidade Adicional

Ao clicar no card "Automóvel", é aberta uma WebView com o site https://jsonplaceholder.typicode.com.

5. Responsividade

A aplicação foi desenvolvida com foco em responsividade, funcionando perfeitamente tanto em dispositivos móveis quanto em navegadores web, com o mesmo código base.

🛠️ Tecnologias e Pacotes Utilizados
A seguir, os principais pacotes utilizados no projeto e suas finalidades:

flutter_bloc: gerenciamento de estado com Bloc/Cubit.

go_router: navegação declarativa moderna.

firebase_core, firebase_auth, cloud_firestore: integração com Firebase para autenticação e backend.

flutter_svg: suporte a imagens SVG.

cached_network_image: carregamento e cache de imagens.

webview_flutter, webview_flutter_web: exibição de conteúdo web via WebView.

oktoast: sistema de notificações/feedback ao usuário.

shared_preferences: armazenamento local de preferências.

get_it: injeção de dependências.

mask_text_input_formatter: aplicação de máscaras no campo de CPF.

shimmer: efeito de loading com placeholder animado.

auto_size_text, gap: melhorias na responsividade e espaçamento da UI.

▶️ Como Rodar o Projeto
Clone o repositório:

git clone https://github.com/seu-usuario/seu-repositorio.git
cd seu-repositorio
Instale as dependências:

flutter pub get
Configure o Firebase:

Crie um projeto no Firebase.

Ative a autenticação por e-mail/senha.

Use o comando flutterfire configure para gerar o arquivo firebase_options.dart.

Caso esteja rodando no Android, adicione o google-services.json à pasta android/app.

Execute o projeto:

Para dispositivos móveis:

flutter run
Para Web:

flutter run -d chrome
🧪 Testes Automatizados
Testes básicos estão incluídos no projeto, utilizando flutter_test. Para executá-los:



🎯 Diferenciais Implementados
✅ Login funcional com Firebase Authentication

✅ State Management com Bloc e Cubit

✅ Injeção de dependências com GetIt

✅ Responsividade total (mobile + web)

✅ Toasts informativos com oktoast

✅ WebView funcional

✅ Código limpo, reutilizável e bem organizado
