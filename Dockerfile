# # Usa uma imagem base com o Node.js instalado
# FROM node:14
FROM buildkite/puppeteer:latest

# # Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia o arquivo package.json e o arquivo package-lock.json (se existir)
COPY package*.json ./

# Instala as dependências da aplicação
RUN npm install

# Copia todo o código-fonte da aplicação para o diretório de trabalho
COPY . .

# Expõe a porta em que a aplicação vai ser executada (se necessário)
ENV PORT 8000
EXPOSE 8000

# Define o comando para iniciar a aplicação
CMD ["npm", "start"]


# RUN mkdir /app
# WORKDIR /app

# COPY package.json yarn.lock /app/
# RUN yarn install --frozen-lockfile
# COPY ./ /app/

# ENV PORT 8000
# EXPOSE 8000
# CMD yarn start