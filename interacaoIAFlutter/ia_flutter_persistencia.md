# Persistência de Dados em Flutter

• O que é persistência de dados em aplicativos Flutter e por que é importante?

Persistência de dados é o ato de salvar informações de forma durável entre execuções do aplicativo, como configurações do usuário, preferências ou conteúdo offline. É importante porque garante que o usuário não perca dados ao fechar o app e permite carregar estados, personalizações e dados essenciais na próxima vez que o app for aberto.

• Quais são os diferentes tipos de dados que podem ser persistidos em um aplicativo Flutter?

Podem ser preservados dados simples como strings, números, booleanos e listas pequenas; configurações e preferências; dados de sessão; cache temporário; e também dados mais complexos como objetos serializados, registros de banco de dados local e arquivos de mídia, dependendo da solução de persistência usada.

(comentário) Interessante para guardar o tema do aplicativo e até mesmo o token de autenticação do usuário

• O que é o pacote SharedPreferences em Flutter e como ele funciona?

SharedPreferences é um pacote que fornece acesso a um armazenamento simples de chave-valor persistente para apps Flutter. Ele grava dados em um arquivo local específico da plataforma e permite ler/escrever valores primitivos facilmente, usando métodos assíncronos para buscar e salvar dados em pares de chave e valor.

• Quais são as limitações do SharedPreferences em termos de armazenamento de dados?

SharedPreferences é limitado a dados pequenos e simples; não é indicado para grandes volumes ou estruturas complexas. Não serve bem para armazenar grandes listas, imagens, arquivos ou dados fortemente relacionais, e seu desempenho pode degradar se usado como substituto de um banco de dados local.

• Quando devo usar SharedPreferences em vez de outras opções de persistência de dados?

Use SharedPreferences para salvar preferências do usuário, configurações simples, flags de inicialização, temas e valores pequenos de configuração. Prefira outras opções como SQLite, Hive ou armazenamento de arquivos quando precisar de dados maiores, relacionais, complexos ou formatos binários.

• Como posso lidar com erros ao usar SharedPreferences?

Trate erros usando blocos try/catch ao chamar métodos assíncronos de leitura e escrita. Verifique se o retorno de leitura não é nulo antes de usar e forneça valores padrão quando necessário. Em caso de falha, informe o usuário ou recupere para um estado seguro, e evite bloquear a interface com operações síncronas pesadas.

• Quais são as melhores práticas para usar SharedPreferences de forma eficiente?

Use SharedPreferences apenas para dados simples e pequenos; mantenha as chaves organizadas e consistentes; evite leituras e gravações desnecessárias em loops; carregue os valores uma vez quando o aplicativo iniciar ou quando necessário; e prefira armazenar apenas dados que realmente precisam persistir entre sessões.
