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

  - docker
  ```bash
  docker --version
  ```

  - git
  ```bash
  docker compose version
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

Depois que terminar de subir o compose, vamos entrar em uma das maquinas de usuario para fazermos o teste:
```bash
docker exec -it user1 bash
```
****
