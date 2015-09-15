---
layout: post
title: Segurança em servidores Linux - Parte 1
description: "Práticas recomendadas para deixar seu servidor linux mais seguro"
modified: 2014-09-13
category: articles
tags: [segurança, linux, antivirus, boot, grub, log, kaspersky, clamav, mysql, patições]
image:
  feature: seguranca_linux/comandos-linux.jpg
  credit: Lailson Henrique
  creditlink: 
comments: true
share: true
---

Hoje, o cenário da segurança digital não é um dos melhores. Sendo a informação o principal ativo de uma empresa, esta passa a ser bastante requisitada. A empresa <a href="http://imprima.com">imprima</a> mostrou uma imagem dos 20 paies que mais sofrem com ataques digitais. 
Tomar medidas para aumentar a segurança do seu servidor linux é primordial nos dias de hoje. Veremos aqui algumas delas:
 <figure>
 	<img src="/images/seguranca_linux/20countries.jpg">
 </figure>

* Table of Contents
{:toc}

#Instalando antivirus 
---
##ClamAV
Instalando o ClamAV
{% highlight yaml %}
apt-get install clamav
apt-get install arc bzip2 cabextract p7zip unzip unrar-free
/etc/init.d/clamav-freshclam status
{% endhighlight %}
O EICAR test file(arquivo de teste, em português) é um arquivo de 68 bytes que possui uma linha de caracteres, desenvolvido pelo European Institute of Computer Anti-Virus Research (Instituto Europeu para Pesquisa de Antivírus de Computador), é usado para testar a eficiência dos antivírus na detecção de vírus conhecidos sem qualquer risco ao computador. Usar o EICAR ao invés de um vírus real para testar um antivírus, é a garantia de que o computador não será infectado.
Baixar o <a href="http://www.eicar.org/">Eicar</a>:
{% highlight yaml %}
wget http://www.eicar.org/download/eicar.com
{% endhighlight %}
Testando o ClamAv:
{% highlight yaml %}
clamscan eicar.com
{% endhighlight %}
Testando o ClamAV
 <figure>
 	<img src="/images/seguranca_linux/clamscan_eicar.png">
 </figure>
 
##Kaspersky
Efetuar o download do pacote no site <a href="http://kaspersky.com/">kaspersky.com</a>:
Baixando e intalando o pacote mais atual (8.0.2):
{% highlight yaml %}
wget http://products.kaspersky-labs.com/products/multilanguage/file_servers/kavlinuxserver8.0/linux/kav4fs_8.0.2-172_i386.deb
dpkg -i kav4fs_8.0.2-172_i386.deb
/opt/kaspersky/kav4fs/bin/kav4fs-setup.pl
{% endhighlight %}
O processo de configuração do Kaspersky irá iniciar.

* Configuração do proxy, caso exista: N
* Download da última base de dados (atualização): yes
* Agendar atualização: N
* Proteção do kernel em tempo real: yes
* Proteção do SAMBA: yes
* locale: pt_BR.utf8
* diretório do arquivo da licença trial: 
* senha : Yes ****
Ao final abra seu navegador e digite http://SEU_IP:9080

 <figure>
 	<img src="/images/seguranca_linux/kaspersky-web.png">
 </figure>

# Segurança no gestor de boot: GRUB

Instalando o pbkdf2

{% highlight yaml %}
grub-mkpasswd-pbkdf2
{% endhighlight %}
 <figure>
 	<img src="/images/seguranca_linux/pbkdf2.png">
 </figure>
Edite o arquivo /etc/grub.d/40_custom e adiciona a senha ao final do arquivo.
 <figure>
 	<img src="/images/seguranca_linux/40_custon.png">
 </figure>
Neste arquivo foi criado o usuário `lailson` e sua senha. Este usuário é o root, é o unico que poderar editar o grub. É possível adicionar novas usuário mas estes não poderão editar o grub.
Para efetivar a operaçao digite o comando `update-grub` para atualizar o grub. 
Ao reiniciar o sistema verá que se solicitar a tecla de edição “e” será solicitado usuário e senha.
 <figure>
 	<img src="/images/seguranca_linux/grub_senha.png">
 </figure>
 
 
#Gerenciando Logs
Os logs são responsável por registrar todas as ações no sistema em um arquivo. Podemos registrar:

* Tentativas de conexão de usuários
* Páginas acessadas
* Registros do firewall como scanners e outros tipos de tentativas de invasão

O RSyslog é uma versão avançada do syslog que vamos utilizar para gerenciar os log.

##Configurações do servidor de log
<p>Neste exemplo o servidor vai ser a maquina que irá receber os log e tem o ip=192.168.0.17. </p>
Devemos alterar o arquivo `vim /etc/rsyslog.conf` e descomentar as linhas:
{% highlight yaml %}
$ModLoad imudp 
$UDPServerRun 514
{% endhighlight %}
No arquivo `vim /etc/default/rsyslog` devemos adiconar ao final do arquivo:
{% highlight yaml %}
RSYSLOGD_OPTIONS="-c0 -r"
{% endhighlight %}
Reiniciando o serviço com o comando `/etc/init.d/rsyslog restart`. Para visualizar os logs utilizaremos o comando `tail -f /var/log/auth.log`. 
Agora vamos configurar o cliente que irá enviar os logs para o servidor.

##Configurando o cliente de log
<p>Vamos alterar o arquivo de hosts do cliente.</p>
{% highlight yaml %}
192.168.0.17     lailson
{% endhighlight %}
<p>Agora vamos alterar o arquivo de configuração `vim /etc/rsyslog.conf`</p>
{% highlight yaml %}
*.*       @lailson
{% endhighlight %}
<p>Adicionando isso ao final do arquivo podmos reiniciar o serviço `/etc/init.d/rsyslog restart`. Pronto! Se logarmos novamente no cliente o log de  </p>
 <figure>
 	<img src="/images/seguranca_linux/logs.png">
 </figure>
<p> Podemos ver na figura acima um terminal onde o lado esquerdo mostra a tela do servidor e o lado direito mostra a tela do cliente. Podemos ver que no lado direito foi feito autenticação de usuário e isso foi registrado no servidor (lado direito).</p>

##Gravando os logs no MySQL
No servidor de log:
{% highlight yaml %}
apt-get install rsyslog-mysql mysql-server
mysql -p
    mysql> grant ALL ON Syslog.* to rsyslog@localhost identified by 'secret';
    mysql> flush privileges;
vim /etc/rsyslog.d/mysql.conf
    $ModLoad ommysql
    *.* :ommysql:localhost,Syslog,rsyslog,secret
{% endhighlight %}
<p>Todos os logs estão sendo gravados no banco de dados mysql. Podemos entrar no mysql `mysql -p` e na tabela syslog `use Syslog` podemos ver todos os logs: `select * from SystemEvents`</p>

#Configurando Partições
<p>Para todas as partições montadas em um servidor, é importante verificar as opções que estão disponíveis, pois estas podem ser uma porta de entrada para intrusos.</p>
`nosuid` – Irá ignorar o bit SUID em um arquivo, fazendo com que ele se comporte como um executável convencional.<br>
`noexec` - Não permite a execução de arquivos nesta partição.<br>
`nodev`  - Não permite a utilização de arquivos de dispositivos nesta partição.<br>
`/tmp`   – Deve ter a opção noexec.<br>
`/usr`   - Pode ser montado como apenas leitura. Lembre que em alguns servidores a mudança de arquivos é feita em momentos muito específicos.<br>
`/var `  - É possível utilizarmos o noexec nesta partição.<br>
Alterações no `/etc/fstab`


	
