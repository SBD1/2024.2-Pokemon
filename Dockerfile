# Usando a imagem oficial do PostgreSQL
FROM postgres:15

# Copiar os scripts SQL para o diretório de inicialização do PostgreSQL
COPY BD/*.sql /docker-entrypoint-initdb.d/

# As instruções acima garantem que os scripts em BD/ serão executados ao iniciar o container
