---
layout: post
title: Testando vulnerabilidade Shell Shock
description: "Teste se o seu sistema está vulnerável para Shell Shock"
modified: 2014-09-26
category: articles
tags: [vulnerabilidade, shell, shock, osx, linux]
image:
  feature: ShellShock/img.jpg
  creditlink: 
comments: true
share: true
---


#Vulnerabilidade
<p>Nesta quarta-feira dia 24 foi divulgado uma vulnerabilidade tão perigosa quando a Heartbleed, é uma falha no bash, um interpretador de comandos utilizado em sistemas operacionais baseado em Unix. A esta falha foi dada o nome de Shell Shock (CVE-2014-6271 e CVE-2014-7168)</p>
<p>O Bash é um shell utilizado sistemas baseado em Unix, portanto Ubuntu, Debian, OSX (Sistema Operacional da Apple), alguns roteadores podem estar vulneráveis. E o Windows ? Por incrível que pareca essa vulnerabildiade não esta presente no Windows, independente de sua versão, ja que este não utiliza o Bash.</p>

##Qual a boa notícia ?
<p>O linux é um sistema aberto e pessoas do mundo inteiro podem colaborar no seu desenvolvimento, assim, algumas horas após a divulgação da vulnerabilidade ja existia uma atualização das principais distribuições linux, como Ubuntu e Debian. Se esta vulnerabilidade estivesse presente no Windows, um patch de atualização poderia demorar meses ou anos, como ja aconteceu.</p>
<p>Esta não é a primeira vulnerabilidade divulgada que atinge um número muito grande de máquinas, temos exemplos na história de vulnerabilidade que era relacionada ao sistema operacional e o protocolo TCP/IP portanto atingia tanto Unix (linux e Mac OS) e Windows, depois da divulgação da vulnerabilidade poucas horas depois foi lançada uma atualização para o linux, ja o patch do Windows demorou alguns anos. </p>
<p>Algumas sites ou telejornais apresentaram esta vulnerabilidade como sendo um <em>Vírus</em>, o que não é verdade. Isto é um <em>bug</em>, que significa uma falha/defeito no software, e após feita a devida correção/atualização no software não poderá ser infectado por esta vulnerabilidade. </p>

##Verificando a vulnerabilidade no MacOS
<p>E como podemos saber se nossa máquina está vulnerável??</p>
Abre o seu terminal Bash  e digite a linha de comando:<br>
`env x='() { :;}; echo vulnerable' bash -c 'echo hello'`
{% highlight console linenos %}
env x='() { :;}; echo vulnerable' bash -c 'echo hello'
{% endhighlight %}

<figure>
	<img src="/images/ShellShock/vulnerabilidade.png">
</figure>

<p>Caso o resultado seja igual ao da imagem o seu sistema está vulnerável</p>

##Corrigindo a vulnerabilidade
<p>Verificando a versão do bash</p>

{% highlight bash linenos %}
$ bash --version
GNU bash, version 3.2.51(1)-release (x86_64-apple-darwin13)
Copyright (C) 2007 Free Software Foundation, Inc.
{% endhighlight %}

<p>Atualizando e recompilando o bash - Caso tenha o XCode instalado</p>
{% highlight bash linenos %}
$ mkdir bash-fix
$ cd bash-fix
$ curl https://opensource.apple.com/tarballs/bash/bash-92.tar.gz | tar zxf -
$ cd bash-92/bash-3.2
$ curl https://ftp.gnu.org/pub/gnu/bash/bash-3.2-patches/bash32-052 | patch -p0    
$ # Not-yet-released-patch - replace seclists line with:
$ # curl https://ftp.gnu.org/pub/gnu/bash/bash-3.2-patches/bash32-053 | patch -p0  
$ curl http://alblue.bandlem.com/bash32-053.patch | patch -p0
$ cd ..
$ xcodebuild
$ sudo cp /bin/bash /bin/bash.old
$ sudo cp /bin/sh /bin/sh.old
$ build/Release/bash --version # GNU bash, version 3.2.53(1)-release
$ build/Release/sh --version   # GNU bash, version 3.2.53(1)-release
$ sudo cp build/Release/bash /bin
$ sudo cp build/Release/sh /bin
{% endhighlight %}

<p>Verificando a nova versão do Bash</p>
{% highlight bash linenos %}
$ bash --version
GNU bash, version 3.2.53(1)-release (x86_64-apple-darwin13)
Copyright (C) 2007 Free Software Foundation, Inc.
{% endhighlight %}

<p>Para melhorar a segurança devemos utilizar o comando <em>chmod -x</em> na pasta da versão do bash anterior para que não possa ser executado</p>
{% highlight bash linenos %}
$ sudo chmod a-x /bin/bash.old /bin/sh.old
{% endhighlight %}

<p>Digite o comando novamente e seu sistema mostara a mensagem abaixo, assim, seu sistema está protegido de uma das maiores falhas ja divulgadas</p>

<figure>
	<img src="/images/ShellShock/ShellShock.png">
</figure>

<p>Sistema Protegido</p>


