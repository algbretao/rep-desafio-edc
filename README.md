# Desafio Módulo 1 - Engenharia de Dados Cloud

## Infraestrutura na AWS, criada automaticamente via Terraform

### Primeiro passo
1. Realizar download dos dados de "VÍNCULOS PÚBLICOS da RAIS 2020": <br>
    a. Servidor FTP: [ftp://ftp.mtps.gov.br/pdet/microdados/]; <br>
    b. Autenticação anônima via client (FileZilla, por exemplo); <br>
    c. Desconsiderar o arquivo de estabelecimentos (RAIS_ESTAB_PUB.7z); <br>
    d. Descompactar os arquivos do formato 7z e recompactar no formato gz.


### IaC com esteiras de Deploy, utilizando o Github

1. Criação de um bucket no S3 da AWS, com criptografia "AES256" e não público.

2. Criação de um Glue Job na AWS para realizar tratamentos no dataset da RAIS 2020:  <br>
    a. Modificar nomes das colunas trocando espaços por “_”; <br>
    b. Deixar o nome das colunas com letras minúsculas e sem acentos; <br>
    c. Criar uma coluna “uf” considerando as 2 primeiras posições da coluna "municipio"; <br>
    d. Ajustar o tipo de dado para "double" das colunas de remuneração; <br>
    e. Converter os dados tratados em formato parquet para escrever na camada "staging" do S3; <br>
    f. Fazer upload do script Glue Job no path do bucket S3 definido na resource. <br>

4. Criação de um Glue Crawler para indexar os dados em catálogos de dados do AWS Glue.


### Após execução da IaC

1. Executar a ingestão dos dados de "VÍNCULOS PÚBLICOS da RAIS 2020" no S3: <br>
    a. Executar o código "interactive_s3.py" para upload dos arquivos na camada "raw" do bucket S3; <br>
    b. Executar o Glue Job pelo console da AWS para disponibilizar os dados tratados na camada "staging". <br>

2. Dar um "Run" no Crawler criado via terraform.

3. Fazer integração com o AWS Athena (engine de Data Lake) para analisar os dados da "staging" com comandos SQL.


### Desenho da Arquitetura

![AWS Iac Terraform](/img/diagrama_arquitetura.png)