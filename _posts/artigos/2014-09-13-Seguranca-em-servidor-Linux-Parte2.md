---
layout: post
title: Segurança em servidores Linux - Parte 2
description: "Práticas recomendadas para deixar seu servidor linux mais seguro"
modified: 2014-09-14
category: articles
tags: [segurança, linux, antivirus, boot, grub, log, kaspersky, clamav, mysql, patições]
image:
  feature: seguranca_linux/comandos-linux.jpg
  credit: Lailson Henrique
  creditlink: 
comments: true
share: true
---


#Limitando recursos
No sistema operacional Linux é possível limitar a utilização de recursos como memória, processador e logins
Estes recursos são controlados pelo Kernel e configurados no arquivo limits.conf para todos os serviços que utilizam PAM
{% highlight yaml %}
find /etc/pam.d/ \! -name "*.dpkg*" | xargs -- grep limits |grep -v ":#"
{% endhighlight %}
A primeira ação é derrubar o sistema com um comando simples chamado <em>fork bomb</em>. Como usuário comum, entre no Linux e digite o código abaixo:
{% highlight yaml %}
:(){ :|:& };:
{% endhighlight %}
Com esse comando o sistema vai parar então caso tenha executado o comando reinicie a máquina.<br>
Vamos verificar quais os limites do usuário: `ulimit -a`
 <figure>
 	<img src="/images/seguranca_linux/ulimit-a.png">
 </figure>
<p>Para definirmos os limites, temos que separar o usuário ROOT em um grupo especial, assim como todos os usuários que tenham perfil de administrador.</p>
{% highlight yaml %}
groupadd adm
gpasswd -a root adm
{% endhighlight %}
Editando os limites dos usuários:<br>
`vim /etc/security/limits.conf`<br>
É possível verificar as opções a serem alteras no arquivo. O arquivo é todo comentado.
 <figure>
 	<img src="/images/seguranca_linux/limits-conf.png">
 </figure>

#Expiração de Senhas
O arquivo `/etc/login.defs` controla as opções de senha e mais algumas coisas que são configuradas no momento da criação do usuário.
No exemplo abaixo vamos configurar o tempo máximo de uma senha e quanto tempo antes da senha do usuário expirar o sistema vai avisar.
{% highlight yaml %}
vim /etc/login.defs
     PASS_MAX_DAYS 60
     PASS_MIN_DAYS 0
     PASS_WARN_AGE 10
{% endhighlight %}