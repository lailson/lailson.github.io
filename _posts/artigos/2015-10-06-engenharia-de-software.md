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

###Desenvolvimento Incremental:
A idéia é de desenvolver e entregar o software em incrementos, com cada incremento entregando parte da funcionalidade requerida. 
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

###Desenvolvimento Espiral
O processo é representado como uma espiral em dez de uma sequência de atividades. Cada volta na espiral representa uma fase no processo. Não há fases fixas, como Especificação, projetos, etc. Os loopsna espiral são escolhidos dependendo do que for necessário. 
A grande diferença do modelo em Espiral é que ele acrescenta aspecstos gerenciais ao desenvolvimento de software (Análise de riscos).

Boehm:
<figure>
    <img src="/images/engenhariadesoftware/espiral.png">
</figure>
Pressman
<figure>
    <img src="/images/engenhariadesoftware/espiral_pressman.png">
</figure>

###Metodologias Ágeis
Motivação: Insatisfação com os excessos dos métodos tradicionais, considerados "pesados". Métodos ágeis buscam flexibilizar o desenvolvimento de software focando no código e não no projeto, são baseados em abordagens iterativas e tem como objetivo de entregar software funcionando o mais rápido possível.
Manifesto Ágil:
"Estamos evidenciando maneiras melhores de desenvolver software fazendo-o nós mesmos e ajudando outros a fazê-lo. Através desse trabalho, passamos a entender que:"

- <b>Indivíduos e interações</s> são mais importantes que processos e ferramentas.
- <b>Software funcionando</b> é mais importante do que documentação completa e detalhada.
- <b>Colaboração com o cliente</b> é mais importante do que negociação de contratos.
- <b>Adaptação a mudanças</b> é mais importante do que seguir o plano inicial.

Principais métodos ágeis:
eXtreme Programming, Scrum, FDD, Lean Software Development, Crystal Family... 

###Extreme Programming (XP)
"Trata-se de uma metodologia ágil para equipes pequenas e médias desenvolvendo software com <u>requisitos vagos</u> e em constante mudança" - Kent Beck. 
Levar todas as boas práticas ao extremo:

- Se revisar código é bom, vamos revisá-lo (pair programming).
- Se testar é bom, vamos testar toda hora (testes funcionais).
- Se projetar é bom, vamos fazer disso parte do trabalho diário de cada pessoa (refactoring).
- Se integrar é bom, vamos integrar a maior quantidade de vezes possível (integração contínua).
- Se simplicidade é bom, vamos deixar o sistema na forma mais simples possível (projeto simples).

Práticas do XP:

- Metáforas: Uma história que todos (progamadores, clientes e gerentes) podem contar acerca de como funciona o sistema.
- Projeto simples: O código está, a qualquer momento, na forma mais simples que passae todos os teste.
- Pequenas versões: As entregas são feitas através de pequenos releases (pedaços) de software funcionando. Dá confiança ao cliente sobre progresso geral.
- Refatoração (refectoring): O código deve ser constantemente melhorado, tornando-o mais simples e mais genérico, removendo redundâncias e duplicidades.
- Programação em pares (pair programming): Os programadores trabalham em pares, checando (validando) mutuamente o trabalho feito. Mesma máquina, mesmo mouse, mesmo monitor.
- Propriedade coletiva do código: Todos são responsáveis por todo o código e qualquer pessoa está autorizada a realizar mudanças.
- Padão de codificação: Todo código é desenvolvido de acordo com um estilo e formato consistentes (padrão).
- Ritmo sustentável: Cada programador trabalha 40 horas por semana, no máximo. 
- Reuniões em pé: Reuniões rápidas e diárias com a equipe, para discutir apenas o essencial.
- Reuniões em pé: Reuniões rápidas e diárias com a equipe, para discutir apenas o essencial.
- Cliente sempre presente: O cliente, com conhecimento sobre o negócio, deve estar dispon;ivel em tempo integral para a equipe.
- Desenvolvimento Orientado a Testes: Uma estrutura de testes unitários automatizada é criada e os testes são escritos antes mesmo das funcionalidades serem implementadas.
- Integração Contínua: Os diversos módulos do Software são integrados o mais cedo possível, para evitar problemas de intregação no futuro.
- Planejamento Incremental: Requisitos são registrados comos Estórias dos Usuários e priorizados para serem incluídos em uma determinada iteração.

Valores:

- Comunicação: Métodos para rapidamente construir e disseminar conhecimento.

- Simplicidade: XP encorajar que você comece, sempre, pela solução mais simples que funcione.

- Feedback: Do cliente, do sistema e da equipe.

- Coragem: Design simples, refatoração ...

- Respeito: Respeito da equipe, do cliente, dos usuários ...

###Scrum
"É um framework de processo dentro do qual podem ser empregados processos e técnicas variadas"
Para concurso: Processo ou metodologia Scrum.

Características: 

- As equipes se auto-organizam para maximizar a comunicação e diminuir a supervisão.
- O produto evolui em uma sérir de "sprints".
- Os requisitos (funcionalidades dos clientes) são listados em um "product backlog".
- Não há prática de engenharia prescrita (Scrum se adapta a todas elas).
- Scrum é um processo essencialmente gerencial.

<figure>
    <img src="/images/engenhariadesoftware/scrum.png">
</figure>

Artefatos:

- Product Backlog: Conjunto de funcionalidades/requisitos.
- Sprint Backlog: Uma lista de tarefas que a equipe se compromete a completar dentro de uma determinada sprint. Os itens são derivados a partir do Product Backlog. São considerados a prioridade que o cliente deu aos itens, o tempo e o esforço estimados pela equipe para completar os vários itens.
Daily Scrums: Reuniões diárias.Incremento do produto: Incremento funcional do produto.

Papéis

- Product Owner: Define as funcionalidades do produto. Decide as datas de lançamento e conteúdo. Prioriza as funcionalidades de acordo com o valor para a empresa. Aceita ou rejeita os resultados dos trabalhos.

- Team: Contém tipicamente entre 5 e 9 pessoas. Multi-funcional (programadores, testadores, desenvolvedores da interface, etc). Dedicação integral. Trocas só na mudança de sprints.

- Scrum Master: Responsável pela aplicação dos valores e práticas Scrum. Remove obstáculos, facilita resultados. Garante a plena funcionalidade e produtividade da equipe. Escudo para inferência externas. Não é um gerente de projetos.

Eventos

- Planejamento da Sprint: Selecionam-se itens do Product Backlog, e as tarefas são identificadas e estimadas. De forma colaborativa, não apenas feito pelo Scrum Master.

- Reuniões Diárias (Daily Scrums): Apenas os mebros da equipe, todos os dias, em pé, durante 15 minutos.

- Revisão do Sprint: Apresentação dos resultados obtidos. Todo o time participar, informalmente, 2 horas de preparação, sem slides.

- Retrospectiva da Sprint: Ocorre após a revisão da sprint e antes da próxima reunião de planejamento. Inspeciona como foi a último sprint em termos de: Pessoas e relações, Processo e ferramentas.

###Ferramentas CASE
São ferramentas que auxiliam o engenheiro de SW em cada atividade associada ao desenvolvimento de SW.

Categorias: 

- Horizontais: São utilizadas durante o processo de desenvolvimento de software. 

- Verticais: São específicas para uma disciplina de software.

- Por função: Processos de negócio, planejamento de projeto, análise de risco, IDEs, Análise Estática, etc.

- Front-end ou Upper Case: Apoiam as etapas iniciais da criação dos sistemas: as fases de planejamento, análise e projeto da aplicação.

- Back-end ou Lower CASE: Dão apoio à parte física, código, testes e manutenção.

- I-CASE ou Integrated CASE: Cobrem todo o ciclo de vida, do início ao fim.

###RUP - Rational Unified Process
Segundo Kruchten:<br>
Necessidades do usuário mal compreendidas; Falta de habilidade para tratar mudanças de requisitos; Descoberta tardia de problemas sérios; Baixa qualidade de SW; Problemas com papéis e responsabilidades.

É uma plataforma (framework) de processos:</br>
Adptável.<br>
Deve ser configurada para selecionar os elementos apropriados às necessidades da organização.
Fornece atividades, artefatos e guias ligados às ferramentas IBM/Rational e À linguagem UML.

Características:

- Iterativo e Incremental: O ciclo de vida do produto é dividido em iterações, cada uma entregando incrementos (partes acabadas) do software.

- Guiado por casos de uso: Os casos de uso conectam todas as fases e visões, sendo utilizados por todos os stakeholders.

- Centrado na arquitetura: Envolve aspectos estátivos e dinâmicos. Evolui a partir das necessidades do produto.


