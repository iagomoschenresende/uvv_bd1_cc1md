# uvv_bd1_cc1md - projeto de criação de um banco de dados utilizando o postgreSQL.

## Descrição do projeto 
Este é um projeto que tem como principal objetivo criar um banco de dados por meio dos comandos do PostgreSQL. Esse banco de dados criado está pronto para inserção de dados podendo ser utilzado futuramente para uma melhor organização de uma determina loja ou tipo de comércio.
  
Como já dito esse projeto utilizou comandos do PostgreSQL, pois o PostgreSQL é um poderoso sistema de gerenciamento de banco de dados relacional que oferece uma ampla gama de recursos e funcionalidades. Além disso, tem como uma de suas grandes vantagens a flexibilidade suportando diferentes tipos de dados de forma eficiente e permite que o usuário modele e organize seus dados de acordo com as suas necessidades, outra vantagem é por ter um desempenho sólido e eficiênte possuindo otimizadores de consultas sofisticados que podem analisar e executar consultas de forma ágil, garantindo que a resposta seja gerada de forma rápida.

Além disto, foi utilizado o SQL Power Architect, pois é uma ferramenta modelagem de dados que permite o usuário criar, editar e visualizar modelo de banco de dados. Essa ferramenta tem como uma de suas vantagens a geração de scripts a partir da criação do modelo de banco de dados feito pelo usuário. Isso faz com que torne o trabalho de produção do script completo de maneira mais ágil e efeciente, sendo assim uma ferramenta importante durante o processo de criação do projeto.

Ademais, foi usado o DBeaver CE, pois é uma ferramenta de gerenciamento de banco de dados que oferece recursos muito bons para a criação desse projeto. Uma funcionalidade dele que foi utilizada foi o editor de SQL que por meio dele se tornou mais dinâmico a organização dos códigos que seriam executados na hora da aplicabilidade do projeto.

## Execução do projeto
Para executar esse projeto de forma adequada deve-se fazer alguns passos:
  
    1. Estar em um sistema operacional Linux para conseguir rodar o código pelo o terminal do Linux.
    2. Abrir o terminal do Linux
    3. Inserir no terminal este comando: psql -U postgres < cc1md_202305643_postgresql.sql
    4. inserir a senha: computacao@raiz
    5. inserir no terminal este comando: psql -U iago -d uvv
    6. inserir a senha: 1234
  
Após executar essas ações você estará dentro do banco de dados 'uvv' com usuário 'iago' e estará pronto para utilizar o projeto.

## Funcionalidade de cada arquivo 
### cc1md_202305643_postgresql.architect
Este é o arquivo que está contido todo o projeto lógico do SQL Power Architect, contendo suas tabelas e cardinalidades.
### cc1md_202305643_postgresql.pdf
Este é o arquivo que está contido o projeto lógico em pdf para facilitar a visualização.
### cc1md_202305643_postgresql.sql
Este é o arquivo que está contido o script do projeto.
