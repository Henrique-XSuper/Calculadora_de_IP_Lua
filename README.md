# 🌐 Calculadora de Sub-redes IPv4 em Lua

Este projeto contém **duas versões** de uma calculadora de sub-redes desenvolvida em **Lua**, voltada para fins **educacionais** e de **prática em redes de computadores**.

---

## 🧮 Versão 1 — Simples

A primeira versão é direta e objetiva.
O usuário informa:

* Um **endereço IP** (ex: `192.168.1.10`)
* Uma **máscara CIDR** (ex: `/24`)

E o programa retorna:

* Máscara de sub-rede
* Endereço de rede
* Endereço de broadcast
* Total de hosts
* Hosts utilizáveis

💡 **Ideal para iniciantes** que desejam entender o cálculo básico de sub-redes IPv4.

### 📘 Exemplo de uso

**Entrada:**

```
Digite o endereco IP (ex: 192.168.1.1):
192.168.1.10
Digite a barra CIDR (ex: 24):
24
```

**Saída:**

```
------------------------------
ANALISE DE SUB-REDE
------------------------------
Endereco IP:            192.168.1.10
Barra CIDR:             /24
Mascara de rede:        255.255.255.0
Endereco de Rede:       192.168.1.0
Endereco de Broadcast:  192.168.1.255
Total de hosts:         256
Hosts utilizaveis:      254
------------------------------
```

---

## ⚙️ Versão 2 — Avançada (com escolha de classe)

Esta versão adiciona a opção de **escolher a classe da rede (A, B, C ou D)** antes da digitação do IP.
Cada classe exibe sua faixa típica de endereços e o programa faz a análise de forma mais detalhada.

**Diferenciais:**

* Escolha de classe da rede (A–D)
* Validação de IP aprimorada
* Tratamento de erros mais robusto
* Exibição organizada e explicativa

💡 **Classe E** foi propositalmente **removida**, pois é reservada para uso experimental e governamental.

### 📘 Exemplo de uso

**Entrada:**

```
Escolha a classe da rede (A, B, C, D):
C
Classe C selecionada. Faixa típica: 192.0.0.0 - 223.255.255.255

Digite o endereço IP (ex: 192.168.1.1):
192.168.1.15
Digite a barra CIDR (ex: 24):
24
```

**Saída:**

```
------------------------------
ANÁLISE DE SUB-REDE
------------------------------
Classe:                C
Endereço IP:           192.168.1.15
Barra CIDR:            /24
Máscara de rede:       255.255.255.0
Endereço de Rede:      192.168.1.0
Endereço de Broadcast: 192.168.1.255
Total de hosts:        256
Hosts utilizáveis:     254
------------------------------
```

---

## 🧠 Objetivo do projeto

Demonstrar na prática o **funcionamento dos cálculos de sub-redes IPv4**, utilizando **operações de bits (`bit32`)** e manipulação de endereços binários em **Lua**, de forma simples, didática e interativa.

---

## 🚀 Como executar

1. Instale o **Lua** (versão 5.2 ou superior).
2. Execute o código pelo terminal:

   ```bash
   lua calculadora_subrede.lua
   ```
3. Siga as instruções exibidas no console.

---

## 🧩 Tecnologias utilizadas

* **Linguagem:** Lua
* **Biblioteca:** bit32 (operações de bits)

---

## ✨ Autor

Desenvolvido por **Henrique Xavier**
💻 [GitHub](https://github.com/Henrique-XSuper)

---

🗂️ *Este projeto faz parte do meu aprendizado contínuo em redes e programação — mostrando a evolução de uma versão simples para uma mais completa e interativa.*
