--Comando para apagar o banco de dados uvv caso ele exista, o que irá permitir a realização do script.
DROP DATABASE IF EXISTS uvv;
--Comando para apagar o esquema lojas caso ele exista, o que irá permitir a realização do script.
DROP SCHEMA IF EXISTS lojas CASCADE;
--Comando para apagar o usuário iago caso ele exista, o que irá permitir a realização do script.
DROP USER IF EXISTS iago;

-- Comando para criar um usuário dentro do postgres com a permissão de criar um banco de dados, criar roles e que tem uma senha criptografada.
CREATE USER iago WITH CREATEDB CREATEROLE ENCRYPTED PASSWORD '1234'; 

-- Comando para criar um banco de dados dentro do usuário anteriormente criado.
CREATE DATABASE uvv WITH
owner = iago
template = template0
encoding = 	'UTF8'
lc_collate = 'pt_BR.UTF-8'
lc_ctype = 'pt_BR.UTF-8'
allow_connections = TRUE; 

--Comando para criar um conexão com o banco de dados uvv.
\c uvv;
--Comando para escolher o usuário iago.
SET ROLE iago;

-- Comando para criar um esquema, que no caso seria lojas, com a autorização de acesso ao usuário, que é o caso de iago.
CREATE SCHEMA lojas AUTHORIZATION iago; 

-- Comando para verificar qual esquema está em uso no momento.
SELECT current_schema(); 

-- Comando para mostrar a ordem na qual está sendo representado os esquemas.
Show SEARCH_PATH; 

-- Comando para modificar a ordem dos esquemas, que no caso está sendo adcionado o lojas, temporário.
SET SEARCH_PATH TO lojas, "$user", public; 

-- Comando para mostrar a ordem na qual está sendo representado os esquemas.
Show SEARCH_PATH; 

-- Comando para tornar a mudança feita pelo meio do comando search_path permanente.
ALTER USER iago
SET SEARCH_PATH TO lojas, "$user", public; 

--Comando para criar a tabela produtos dentro do esquema lojas.
CREATE TABLE lojas.produtos (
                produto_id NUMERIC(38) NOT NULL,
                nome VARCHAR(255) NOT NULL,
                preco_unitario NUMERIC(10,2),
                detalhes BYTEA,
                imagem BYTEA,
                imagem_mime_type VARCHAR(512),
                imagem_arquivo VARCHAR(512),
                imagem_charset VARCHAR(512),
                imagem_ultima_atualizacao DATE,
                --Comando para criar uma primary key para a tabela produtos, adimitindo que a primary key seja produto_id.
                CONSTRAINT produtos_pk PRIMARY KEY (produto_id) 
);

--Comando para comentar em uma tabela.
COMMENT ON TABLE lojas.produtos IS 'Esta tabela representa as informações dos produtos';

--Comando para comentar em uma coluna.
COMMENT ON COLUMN lojas.produtos.produto_id IS 'esta coluna representa a identidade de cada produto';
COMMENT ON COLUMN lojas.produtos.nome IS 'esta coluna representa o nome de cada produto';
COMMENT ON COLUMN lojas.produtos.preco_unitario IS 'esta coluna representa o valor de cada produto';
COMMENT ON COLUMN lojas.produtos.detalhes IS 'esta coluna representa as informações extras de cada produto';
COMMENT ON COLUMN lojas.produtos.imagem IS 'esta coluna representa as imagens de cada produto';
COMMENT ON COLUMN lojas.produtos.imagem_mime_type IS 'esta coluna representa o tipo ou formato de arquivo da imagem';
COMMENT ON COLUMN lojas.produtos.imagem_arquivo IS 'esta coluna representa o arquivo de cada imagem';
COMMENT ON COLUMN lojas.produtos.imagem_charset IS 'esta coluna representa o formato da codificação utilizada em cada imagem';
COMMENT ON COLUMN lojas.produtos.imagem_ultima_atualizacao IS 'esta coluna representa  a ultima atualização de imagem feita';

--Comando para criar a tabela lojas dentro do esquema lojas.
CREATE TABLE lojas.lojas (
                loja_id NUMERIC(38) NOT NULL,
                nome VARCHAR(255) NOT NULL,
                endereco_web VARCHAR(100),
                endereco_fisico VARCHAR(512),
                latitude NUMERIC,
                longitude NUMERIC,
                logo BYTEA,
                logo_mime_type VARCHAR(512),
                logo_arquivo VARCHAR(512),
                logo_charset VARCHAR(512),
                logo_ultima_atualizacao DATE,
                --Comando para criar uma primary key para a tabela lojas, adimitindo que a primary key seja loja_id.
                CONSTRAINT lojas_pk PRIMARY KEY (loja_id)
);

--Comando para comentar em uma tabela.
COMMENT ON TABLE lojas.lojas IS 'esta tabela demonstra as informações das lojas';

--Comando para comentar em uma coluna.
COMMENT ON COLUMN lojas.lojas.loja_id IS 'esta coluna representa a identidade de cada loja';
COMMENT ON COLUMN lojas.lojas.nome IS 'esta coluna representa o nome de cada loja';
COMMENT ON COLUMN lojas.lojas.endereco_web IS 'esta coluna representa a URL de cada loja';
COMMENT ON COLUMN lojas.lojas.endereco_fisico IS 'esta coluna representa o endereço fisico ( real) de cada loja';
COMMENT ON COLUMN lojas.lojas.latitude IS 'esta coluna representa a distância vertical de cada loja';
COMMENT ON COLUMN lojas.lojas.longitude IS 'esta coluna representa a distância horizontal de cada loja';
COMMENT ON COLUMN lojas.lojas.logo IS 'esta coluna representa a logo de cada loja';
COMMENT ON COLUMN lojas.lojas.logo_mime_type IS 'esta coluna representa o formato ou tipo de arquivo da logo de cada loja';
COMMENT ON COLUMN lojas.lojas.logo_arquivo IS 'esta coluna contém os arquivos da logo de cada loja';
COMMENT ON COLUMN lojas.lojas.logo_charset IS 'esta coluna representa o tipo de codificação utilizado na logo de cada loja';
COMMENT ON COLUMN lojas.lojas.logo_ultima_atualizacao IS 'esta coluna representa a ultima atualização feita em cada loja';

--Comando para criar a tabela estoques dentro do esquema lojas.
CREATE TABLE lojas.estoques (
                estoque_id NUMERIC(38) NOT NULL,
                loja_id NUMERIC(38) NOT NULL,
                produto_id NUMERIC(38) NOT NULL,
                quantidade NUMERIC(38) NOT NULL,
                --Comando para criar uma primary key para a tabela estoques, adimitindo que a primary key seja estoque_id.
                CONSTRAINT estoques_pk PRIMARY KEY (estoque_id)
);

--Comando para comentar em uma tabela.
COMMENT ON TABLE lojas.estoques IS 'esta tabela representa as informações sobre os estoques';

--Comando para comentar em uma coluna.
COMMENT ON COLUMN lojas.estoques.estoque_id IS 'esta coluna representa a identidade de cada estoque';
COMMENT ON COLUMN lojas.estoques.loja_id IS 'esta coluna representa a identidade de cada loja';
COMMENT ON COLUMN lojas.estoques.produto_id IS 'esta coluna representa a identidade de cada produto';
COMMENT ON COLUMN lojas.estoques.quantidade IS 'esta coluna representa a quantidade de produtos presente em cada estoque';

--Comando para criar a tabela clientes dentro do esquema lojas.
CREATE TABLE lojas.clientes (
                cliente_id NUMERIC(38) NOT NULL,
                email VARCHAR(255) NOT NULL,
                nome VARCHAR(255) NOT NULL,
                telefone1 VARCHAR(20),
                telefone2 VARCHAR(20),
                telefone3 VARCHAR(20),
                --Comando para criar uma primary key para a tabela clientes, adimitindo que a primary key seja cliente_id.
                CONSTRAINT clientes_pk PRIMARY KEY (cliente_id)
);

--Comando para comentar em uma tabela.
COMMENT ON TABLE lojas.clientes IS 'Esta tabela representa as informações dos clientes';

--Comando para comentar em uma coluna.
COMMENT ON COLUMN lojas.clientes.cliente_id IS 'esta coluna representa a identidade de cada cliente';
COMMENT ON COLUMN lojas.clientes.email IS 'esta coluna representa o email de cada cliente';
COMMENT ON COLUMN lojas.clientes.nome IS 'esta coluna representa o nome de cada cliente';
COMMENT ON COLUMN lojas.clientes.telefone1 IS 'esta coluna representa o número de telefone principal de cada cliente';
COMMENT ON COLUMN lojas.clientes.telefone2 IS 'esta coluna representa o telefone secundário de cada cliente';
COMMENT ON COLUMN lojas.clientes.telefone3 IS 'esta cluna representa o telefone terciário de cada cliente';

--Comando para criar a tabela envios dentro do esquema lojas.
CREATE TABLE lojas.envios (
                envio_id NUMERIC(38) NOT NULL,
                loja_id NUMERIC(38) NOT NULL,
                cliente_id NUMERIC(38) NOT NULL,
                endereco_entrega VARCHAR(512) NOT NULL,
                status VARCHAR(15) NOT NULL,
                --Comando para criar uma primary key para a tabela envios, adimitindo que a primary key seja envio_id.
                CONSTRAINT envios_pk PRIMARY KEY (envio_id)
);

--Comando para comentar em uma tabela.
COMMENT ON TABLE lojas.envios IS 'Esta tabela representa as informações sobre os envios';

--Comando para comentar em uma coluna.
COMMENT ON COLUMN lojas.envios.envio_id IS 'esta coluna representa a identidade de cada envio feito';
COMMENT ON COLUMN lojas.envios.loja_id IS 'esta coluna representa a identidade de cada loja';
COMMENT ON COLUMN lojas.envios.cliente_id IS 'esta coluna representa a identidade de cada cliente';
COMMENT ON COLUMN lojas.envios.endereco_entrega IS 'esta coluna representa o endereço no qual será entregue o envio';
COMMENT ON COLUMN lojas.envios.status IS 'esta coluna representa a situação na qual esta o envio';

--Comando para criar a tabela pedidos dentro do esquema lojas.
CREATE TABLE lojas.pedidos (
                pedido_id NUMERIC(38) NOT NULL,
                data_hora TIMESTAMP NOT NULL,
                cliente_id NUMERIC(38) NOT NULL,
                status VARCHAR(15) NOT NULL,
                loja_id NUMERIC(38) NOT NULL,
                --Comando para criar uma primary key para a tabela pedidos, adimitindo que a primary key seja pedido_id.
                CONSTRAINT pedidos_pk PRIMARY KEY (pedido_id)
);

--Comando para comentar em uma tabela.
COMMENT ON TABLE lojas.pedidos IS 'esta tabela representa as informações dos pedidos';

--Comando para comentar em uma coluna.
COMMENT ON COLUMN lojas.pedidos.pedido_id IS 'esta coluna representa a identidade de cada pedido';
COMMENT ON COLUMN lojas.pedidos.data_hora IS 'esta coluna representa a data e a hora em que foram feitos os pedidos';
COMMENT ON COLUMN lojas.pedidos.cliente_id IS 'esta coluna representa a indentidade de cada cliente';
COMMENT ON COLUMN lojas.pedidos.status IS 'esta coluna representa a situação de cada pedido';
COMMENT ON COLUMN lojas.pedidos.loja_id IS 'esta coluna representa a identidade de cada loja';

--Comando para criar a tabela pedidos_itens dentro do esquema lojas.
CREATE TABLE lojas.pedidos_itens (
                pedido_id NUMERIC(38) NOT NULL,
                produto_id NUMERIC(38) NOT NULL,
                numero_da_linha NUMERIC(38) NOT NULL,
                preco_unitario NUMERIC(10,2) NOT NULL,
                quantidade NUMERIC(38) NOT NULL,
                envio_id NUMERIC(38),
                --Comando para criar uma primary key para a tabela pedidos_itens, adimitindo que a primary key seja pedido_id e produto_id.
                CONSTRAINT pedidos_itens_pk PRIMARY KEY (pedido_id, produto_id)
);

--Comando para comentar em uma tabela.
COMMENT ON TABLE lojas.pedidos_itens IS 'esta tabela representa as informações sobre os itens de cada pedido';

--Comando para comentar em uma coluna.
COMMENT ON COLUMN lojas.pedidos_itens.pedido_id IS 'esta coluna representa a identidade de cada pedido';
COMMENT ON COLUMN lojas.pedidos_itens.produto_id IS 'esta coluna representa a identidade de cada produto';
COMMENT ON COLUMN lojas.pedidos_itens.numero_da_linha IS 'esta coluna representa o númeor da linha que esta localizado o item pedido';
COMMENT ON COLUMN lojas.pedidos_itens.preco_unitario IS 'esta coluna representa a preço de cada item pedido';
COMMENT ON COLUMN lojas.pedidos_itens.quantidade IS 'esta coluna representa a quantidade de itens pedidos';
COMMENT ON COLUMN lojas.pedidos_itens.envio_id IS 'esta coluna representa a identidade de cada envio';

--Comando para criar a foreign key produto_id da tabela lojas.pedidos_itens, referente a tabela lojas.produtos.
ALTER TABLE lojas.pedidos_itens ADD CONSTRAINT produtos_pedidos_itens_fk
FOREIGN KEY (produto_id)
REFERENCES lojas.produtos (produto_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

--Comando para criar a foreign key produto_id da tabela lojas.estoques, referente a tabela lojas.produtos.
ALTER TABLE lojas.estoques ADD CONSTRAINT produtos_estoques_fk
FOREIGN KEY (produto_id)
REFERENCES lojas.produtos (produto_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

--Comando para criar a foreign key loja_id da tabela lojas.pedidos, referente a tabela lojas.lojas.
ALTER TABLE lojas.pedidos ADD CONSTRAINT lojas_pedidos_fk
FOREIGN KEY (loja_id)
REFERENCES lojas.lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

--Comando para criar a foreign key loja_id da tabela lojas.estoques, referente a tabela lojas.lojas.
ALTER TABLE lojas.estoques ADD CONSTRAINT lojas_estoques_fk
FOREIGN KEY (loja_id)
REFERENCES lojas.lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

--Comando para criar a foreign key loja_id da tabela lojas.envios, referente a tabela lojas.lojas.
ALTER TABLE lojas.envios ADD CONSTRAINT lojas_envios_fk
FOREIGN KEY (loja_id)
REFERENCES lojas.lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

--Comando para criar a foreign key cliente_id da tabela lojas.pedidos, referente a tabela lojas.clientes.
ALTER TABLE lojas.pedidos ADD CONSTRAINT clientes_pedidos_fk
FOREIGN KEY (cliente_id)
REFERENCES lojas.clientes (cliente_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

--Comando para criar a foreign key cliente_id da tabela lojas.envios, referente a tabela lojas.clientes.
ALTER TABLE lojas.envios ADD CONSTRAINT clientes_envios_fk
FOREIGN KEY (cliente_id)
REFERENCES lojas.clientes (cliente_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

--Comando para criar a foreign key envio_id da tabela lojas.pedidos_itens, referente a tabela lojas.envios.
ALTER TABLE lojas.pedidos_itens ADD CONSTRAINT envios_pedidos_itens_fk
FOREIGN KEY (envio_id)
REFERENCES lojas.envios (envio_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

--Comando para criar a foreign key pedido_id da tabela lojas.pedidos_itens, referente a tabela lojas.pedidos.
ALTER TABLE lojas.pedidos_itens ADD CONSTRAINT pedidos_pedidos_itens_fk
FOREIGN KEY (pedido_id)
REFERENCES lojas.pedidos (pedido_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

--Comando para criar a restrição na coluna status da tabela lojas.pedidos que apenas irá permitir escrever as palavras CANCELADO, COMPLETO, ABERTO, PAGO, REEMBOLSADO, ENVIADO.
ALTER TABLE lojas.pedidos
ADD CONSTRAINT cc_pedidos_status
CHECK (status IN('CANCELADO', 'COMPLETO','ABERTO','PAGO','REEMBOLSADO','ENVIADO'));

--Comando para criar a restrição na coluna status da tabela lojas.envios que apenas irá permitir escrever as palavras CRIADO, ENVIADO, TRANSITO, ENTREGUE. 
ALTER TABLE lojas.envios
ADD CONSTRAINT cc_envios_status
CHECK (status IN('CRIADO','ENVIADO','TRANSITO','ENTREGUE'));

--Comando para criar a restrição na coluna cliente_id da tabela lojas.clientes que irá apenas permitir que o valor inserido seja maior que 0.
ALTER TABLE lojas.clientes
ADD CONSTRAINT cc_clientes_cliente_id
CHECK (cliente_id > 0);

--Comando para criar a restrição na coluna pedido_id da tabela lojas.pedidos que irá apenas permitir que o valor inserido seja maior que 0.
ALTER TABLE lojas.pedidos
ADD CONSTRAINT cc_pedidos_pedido_id
CHECK (pedido_id > 0);

--Comando para criar a restrição na coluna cliente_id da tabela lojas.pedidos que irá apenas permitir que o valor inserido seja maior que 0.
ALTER TABLE lojas.pedidos
ADD CONSTRAINT cc_pedidos_cliente_id
CHECK (cliente_id > 0);

--Comando para criar a restrição na coluna loja_id da tabela lojas.pedidos que irá apenas permitir que o valor inserido seja maior que 0.
ALTER TABLE lojas.pedidos
ADD CONSTRAINT cc_pedidos_loja_id
CHECK (loja_id > 0);

--Comando para criar a restrição na coluna envio_id da tabela lojas.envios que irá apenas permitir que o valor inserido seja maior que 0.
ALTER TABLE lojas.envios
ADD CONSTRAINT cc_envios_envio_id
CHECK (envio_id > 0);

--Comando para criar a restrição na coluna loja_id da tabela lojas.envios que irá apenas permitir que o valor inserido seja maior que 0.
ALTER TABLE lojas.envios
ADD CONSTRAINT cc_envios_loja_id
CHECK (loja_id > 0);

--Comando para criar a restrição na coluna cliente_id da tabela lojas.envios que irá apenas permitir que o valor inserido seja maior que 0.
ALTER TABLE lojas.envios
ADD CONSTRAINT cc_envios_cliente_id
CHECK (cliente_id > 0);

--Comando para criar a restrição na coluna loja_id da tabela lojas.lojas que irá apenas permitir que o valor inserido seja maior que 0.
ALTER TABLE lojas.lojas
ADD CONSTRAINT cc_lojas_loja_id
CHECK (loja_id > 0);

--Comando para criar uma restrição na coluna latitude da tabela lojas.lojas que irá apenas permitir que o valor inserido esteja entre 90 e -90.
ALTER TABLE lojas.lojas
ADD CONSTRAINT cc_lojas_latitude
CHECK (latitude <= 90 AND latitude >= -90);

--Comando para criar uma restrição na coluna longitude da tabela lojas.lojas que irá apenas permitir que o valor inserido esteja entre 180 e -180.
ALTER TABLE lojas.lojas
ADD CONSTRAINT cc_lojas_longitude
CHECK (longitude <= 180 AND longitude >= -180);

--Comando para criar a restrição na coluna produto_id da tabela lojas.produtos que irá apenas permitir que o valor inserido seja maior que 0.
ALTER TABLE lojas.produtos
ADD CONSTRAINT cc_produtos_produto_id
CHECK (produto_id > 0);

--Comando para criar a restrição na coluna preco_unitario da tabela lojas.produtos que irá apenas permitir que o valor inserido seja maior ou igual a 0.
ALTER TABLE lojas.produtos
ADD CONSTRAINT cc_produtos_preco_unitario
CHECK (preco_unitario >= 0);

--Comando para criar a restrição na coluna estoque_id da tabela lojas.estoques que irá apenas permitir que o valor inserido seja maior que 0.
ALTER TABLE lojas.estoques
ADD CONSTRAINT cc_estoques_estoque_id
CHECK (estoque_id > 0);

--Comando para criar a restrição na coluna loja_id da tabela lojas.estoques que irá apenas permitir que o valor inserido seja maior que 0.
ALTER TABLE lojas.estoques
ADD CONSTRAINT cc_estoques_loja_id
CHECK (loja_id > 0);

--Comando para criar a restrição na coluna produto_id da tabela lojas.estoques que irá apenas permitir que o valor inserido seja maior que 0.
ALTER TABLE lojas.estoques
ADD CONSTRAINT cc_estoques_produto_id
CHECK (produto_id > 0);

--Comando para criar a restrição na coluna quantidade da tabela lojas.estoques que irá apenas permitir que o valor inserido seja maior ou igual a 0.
ALTER TABLE lojas.estoques
ADD CONSTRAINT cc_estoques_quantidade
CHECK (quantidade >= 0);

--Comando para criar a restrição na coluna pedido_id da tabela lojas.pedidos_itens que irá apenas permitir que o valor inserido seja maior que 0.
ALTER TABLE lojas.pedidos_itens
ADD CONSTRAINT cc_pedidos_itens_pedido_id
CHECK (pedido_id > 0);

--Comando para criar a restrição na coluna produto_id da tabela lojas.pedidos_itens que irá apenas permitir que o valor inserido seja maior que 0.
ALTER TABLE lojas.pedidos_itens
ADD CONSTRAINT cc_pedidos_itens_produto_id
CHECK (produto_id > 0);

--Comando para criar a restrição na coluna preco_unitario da tabela lojas.pedidos_itens que irá apenas permitir que o valor inserido seja maior ou igual a 0.
ALTER TABLE lojas.pedidos_itens
ADD CONSTRAINT cc_pedidos_itens_preco_unitario
CHECK (preco_unitario >= 0);

--Comando para criar a restrição na coluna quantidade da tabela lojas.pedidos_itens que irá apenas permitir que o valor inserido seja maior ou igual a 0.
ALTER TABLE lojas.pedidos_itens
ADD CONSTRAINT cc_pedidos_itens_quantidade
CHECK (quantidade >= 0);

--Comando para criar a restrição na coluna envio_id da tabela lojas.pedidos_itens que irá apenas permitir que o valor inserido seja maior que 0.
ALTER TABLE lojas.pedidos_itens
ADD CONSTRAINT cc_pedidos_itens_envio_id
CHECK (envio_id > 0);











