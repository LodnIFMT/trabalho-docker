# WHITELIST COM SQUID PROXY USANDO DOCKER COMPOSE

## Professor:
- Joao Paulo Delgado Preti

## Alunos:
- Lucas Oliveira do Nascimento
- Luiz Fabiano Aires Da Silva

## Descrição
Este projeto demonstra o uso do **Squid Proxy** em containers Docker, configurado no modo **whitelist**:  
apenas os sites listados em `allowed-sites` podem ser acessados, todos os demais são bloqueados.

---

## Antes de começar
- Antes de iniciar verifique se o git, docker e o docker compose estão instalados no seu sistema
  - git
  ```bash
  git --version
  ```
    - o resultado deve ser algo parecido com a linha abaixo:
    ```bash
    git version 2.48.1.windows.1
    ```

  - docker
  ```bash
  docker --version
  ```
   - o resultado deve ser algo parecido com a linha abaixo:
    ```bash
    Docker version 27.5.1, build 9f9e405
    ```

  - docker compose
  ```bash
  docker compose version
  ```
    - o resultado deve ser algo parecido com a linha abaixo:
    ```bash
    Docker Compose version v2.32.4-desktop.1
    ```
- Caso você esteja usando o sistema operacional Windows, execute o programa Docker Descktop

## Como começar

Clone este repositório:
```bash
git clone https://github.com/LodnIFMT/trabalho-docker.git
```

depois que a clonagem estiver finalizada, entre na pasta que doi criada:
```bash
cd trabalho-docker
```

agora execute o comando abaixo para subir o docker compose:
```bash
docker compose up -d
```

caso queira verificar, se o compose foi inciado com sucesso, execute o comando:
```bash
docker ps
```
  - o resultadoo deve ser algo parecido com a linha abaixo:
  ```bash
  CONTAINER ID   IMAGE                          COMMAND                  CREATED          STATUS          PORTS                    NAMES
  8304a58b2535   trabalho-docker-user01         "tail -f /dev/null"      24 seconds ago   Up 23 seconds                            user1
  9d39f1e95270   trabalho-docker-user02         "tail -f /dev/null"      24 seconds ago   Up 23 seconds                            user2
  b9a35e552efb   ubuntu/squid:4.10-20.04_beta   "entrypoint.sh -f /e…"   25 seconds ago   Up 23 seconds     0.0.0.0:3128->3128/tcp   squid
  ```

Depois que terminar de subir o compose, vamos entrar em uma das maquinas de usuario para fazermos o teste:
```bash
docker exec -it user1 bash
```

Para testar se o squid proxy esta em funcionamento na rede, execute:
```bash
curl google.com.br
```
- O resultado esperado, é algo similar a:
```bash
<HTML><HEAD><meta http-equiv="content-type" content="text/html;charset=utf-8">
<TITLE>301 Moved</TITLE></HEAD><BODY>
<H1>301 Moved</H1>
The document has moved
<A HREF="http://www.google.com.br/">here</A>.
</BODY></HTML>
```

Agora vamos verificar se ele esta bloqueando site que não estão no arquivo `allowed-sites`, execute:
```bash
curl github.com
```

O site do github não esta na lista de sites permitidos, então o proxy deve negar o acesso ao site do github.
o resultado esperado é um texto grande, nesse texto deve conter a seguinte linha:
```bash
<!-- ERR_ACCESS_DENIED -->
```

Para sair do container do usuario, execute o comando:
```bash
exit
```

Para "destruir" o compose execute:
```bash
docker compose down -v
```

execute o comando a seguir para verificar se o compose foi destruido com sucesso:
```bash
docker ps
```

O resultado esperado é:
```bash
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES

```

- OBSERVAÇÃO: o comando ping não passa pelo proxy, sendo assim ele pinga sites que
              estão fora da lista de sites permitidos.
---
