---
layout: post
title: Engenharia de Software
description: "Engenharia de Software"
modified: 2015-10-06
category: articles
tags: [Engenharia de Software ]
image:
  feature: engenhariadesoftware/esw.png
  credit: 
  creditlink: 
comments: true
share: true
---


#Engenharia de Software

* Processos: Racionalizam o desenvolvimento de Software.
* Métodos: Conhecimento técnico; "Como fazer".
* Ferramentas: Suporte automatizado para processos e métodos.

* Objetivos:
Obter software de qualidade com produtividade no seu desenvlvimento, operação e manutenção, dentro de custos, prazos e níveis de qualidade controlados com o melhor custo-benefício entre qualidade e produtividade.

####Engenharia de Software x Engenharia de Sistemas.
Engenharia de Sistemas é algo maior. Preocupa-se com todos os aspectos de sistemas baseados em computador(Hardware, Software, processos, pessoas e outros sistemas, etc). Engenharia de Software é apenas <b>parte</b> deste processo.

####Software
Programa de computador e documentação associada. 
Produtos de softwares podem ser desenvolvidos para um mercado geral. Novos softwares podem ser criados desenvolvendo-se novos programas ou reusando software existente.

####Processo
Uma série conectada de ações, com a intenção de satisfazer um objetivo. 
Define quem está fazendo o quê, quando e como para atingir um certo objetivo.
Processo de Software: Um conjunto estruturado de atividades para desenvolver um sistema de software: 
* Especificação 
* Projeto 
* Validação  
* Evolução.

####Modelos de Ciclo de Vida
"São uma representação abstrata e simplificada do processo de desenvolvimento de software, apresentada a partir de uma perspeciva específica"
Tipicamente contêm: Esqueleto do processo, Ordem de precedência das atividades, Principais artefatos e produtos gerados.
Principais modelos: Cascata ou clássico, Prototipagem, Métodos formais, Espiral, Incremental.

###Modelo em Cascata
Modelo "Clássico", foi o primeiro, teve origem na indústria de manufaturado e construção. Sua estrututa é composta por várias etapas que são executadas de forma sistemática e sequencial.
Orientado a planos (Plan driven). Você planeja tudo que tem que fazer antes de iniciar as etapas, não há <i>feed back</i> para voltar e corrigir erros.
Presman:
<figure>
    <img src="/images/engenhariadesoftware/cascata.png">
</figure>

Sommerville:
<figure>
    <img src="/images/engenhariadesoftware/cascata2.png">
</figure>
<b>Vantagens:</b> Minimiza o planejamento, organiza as atividades em uma sequência com entregas bem definidas. Funciona bem para requisitos estáveis e bem compreendidos. O modelo pressupõe que  os requisitos ficarão estáveisao longo do projeto. É facilmente aplicável em equipes inexperientes.
<b>Desvantagens:</b> Atrasa a redução de riscos.

Fases do ciclo de vida do Software

* Planejamento
Esboçar escopo e requisitos, fazer estimativas razoáveis sobre recursos, custos e prazos.

* Análise e Especificação de requisitos
Refinar requisotos e escopo. Entender o domínio do problema, com comportamento e funcionalidades esperados.

* Projeto
Incorporar requisitos tecnológicos aos requisitos essenciais do sistema. Projetar a arquitetura do sistema.

* Implementação
Traduzir o projeto em uma forma passível de execução pela máquina. Codificação.

* Testes
Realizar diversos níveis de teste, de forma a fazer a verificação do software.

* Implantação, Operação e Manutenção.
Colocar o software em produção, treinar pessoas, manter o software e gerenciar os serviços.

###Prototipagem
PROTOTIPAGEM EVOLUCIONÁRIA.
Objetivo: trabalhar junto aos clientes para evoluir o sistema a partir de uma especificação inicial resumida, entregar resultado o mais rápido possível. Deve começar com os requisitos mais bem compreendidos. Novas funcionalidades são adicionadas à medida que o cliente as propõem. Aplicável em sistemas pequenos ou médios com curto tempo de vida.
Problemas: Falta de visibilidade do progresso. O sistema está sempre evoluindo, nunca está "terminado". Os sistemas acabam tornando-se pobremente estruturados. A documentação pode ser esquecida. Os padrões de qualidade podem ser "relaxados".

PROTOTIPAGEM DESCARTÁVEL
Assim como na prototipagem evolucionária, pequenas versões prototípicas são disponibilizadas aos clientes para avaliação.
O objetivo aqui é entender e clarificar os requisitos do sistema. Deve-se começar com requisitos mais difíceis e menos compreendidos. Ao final, decarta-se o protótipo e a implementação do software continua. 
É util para sistemas grandes e complicados, e quando o cliente não sabe exatamente o que quer. Protótipos descartáveis podem ser aplicados no contexto de qualquer modelo de processo: Cascata, espiral e Iteativo/Incremental, etc.

###Métodos formais
Modelo baseado emtécnicas matemáticas para especificar, desenvolver e verificar software. O próprio processo de desenvolvimento garante que o programa faz exatamente o que foi especificado. Têm sido aplicados apenas ao desenvolvimento de sistemas críticos. 
Problemas: É muito caro, é muito específico, precisa de uma pessoa com base matemática muito grande. 

###Modelos Iterativos
Motivação: Requisitos de sistema sempre evoluem durante o projeto. Deve-se dividir para conquistar. Duas abordagens: Desenvolviemnto Incremental e Desenvolvimento Espiral.
Vantagens: Maior gerenciamneto de risco. 

- Desenvolvimento Incremental:
A idéia é de desenvolver e entregar o asoftware em incrementos, com cada incremento entregando parte da funcionalidade requerida. 
Requisitos são definidos antes do desenvolvimento do incremento, sendo os mais críticos priorizados. 
Ex.: RUP.
<figure>
    <img src="/images/engenhariadesoftware/rup.png">
</figure>
Iterativo xIncremental:
<figure>
    <img src="/images/engenhariadesoftware/iterativoxincremental.png">
</figure>
Vantagens do Incremental: O cliente pode receber e avaliar as entregas do produto mais cedo. Os incrementos são avaliados e os desvios identificados, sem possível <b>replanejar</b> as próximas iterações de acordo. O risco geral do projeto fracassar diminui.

- Desenvolvimento Espiral
O processo é representado como uma espiral em dez de uma sequência de atividades. Cada volta na espiral representa uma fase no processo. Não há fases fixas, como Especificação, projetos, etc. Os loopsna espiral são escolhidos dependendo do que for necessário. 
A grande diferença do modelo em Espiral é que ele acrescenta aspecstos gerenciais ao desenvolvimento de software (Análise de riscos).
<figure>
    <img src="/images/engenhariadesoftware/espiral.png">
</figure>

