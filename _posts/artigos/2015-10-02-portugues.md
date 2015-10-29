---
layout: post
title: Português
description: "Resumo geral"
modified: 2015-10-02
category: articles
tags: [portugues, ]
image:
  feature: portugues/logoportugues.png
  credit: 
  creditlink: 
comments: true
share: true
---

#Principais Características

- Os algoritmos de ordenação são de fundamental inportância na ciência da computação.

- O melhor algoritmo para determinada aplicação depende, entre outros fatores, do número de itens a ordenar e do grau de ordenação ja apreseentado por esses itens.

- Um algoritmo de ordenação é <b>estável</b> se não altera a posição relativa de elementos que têm um mesmo valor.

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="/assets/js/ordenacao.js"></script>

   
   <noscript>&lt;p style="color:red"&gt;Sorry, Esse programa requer JavaScript para funcionar.&lt;/p&gt;</noscript>
   
   <h2>Algoritmos de ordenação</h2>
<!--[if lt IE 9]>
<div style="width:600px">
<p><b>Note for Internet Explorer 8 and earlier:</b> This page uses an emulator
for the HTML5 Canvas, which is not supported directly in your browser.  The
emulator runs more slowly than the real thing.  And in this example, some
text that should be shown on the canvas is <b>missing</b> because the emulator
does not support text.  Please consider using Internet Explorer 9, Firefox,
or Google Chrome.</p>
</div>
<br>
<![endif]-->      
   <div style="float:left;">
   <canvas id="sortcanvas" width="450" height="400" style="background-color:rgb(255,255,255)"></canvas>
   </div>
   <div style="float:left; margin-left:30px;">
      <select id="sortSelect" disabled="disabled">
         <option value="1">Bubble Sort</option>
         <option value="2">Selection Sort</option>
         <option value="3">Insertion Sort</option>
         <option value="4">Merge Sort</option>
         <option value="5">Quick Sort</option>
      </select>
      <p><button id="newBtn">Nova ordem</button></p>
      <p><input type="checkbox" id="fastCheckbox"><label for="fastCheckbox">Rápido</label></p>
      <p><button id="runBtn" disabled="disabled">Executar</button></p>
      <p><button id="pauseBtn">Pausar</button></p>
      <p><button id="stepBtn" disabled="disabled">Passos</button></p>
      <p style="margin-top:5px;">
         <b>Comparações:</b> <span id="compCt">72</span>
      </p>
      <p style="margin-top:30px;">
         <b>Copias: </b> <span id="moveCt">15</span>
      </p>
   </div>
   <div style="clear: both">
      <br>
      <p id="message1">Phase 6:   Find the next largest item and move it to position 11</p>
      <p id="message2">Item 8 is smaller than item 6, so item 6 is still the max seen.</p>
   </div>

   <h2>Selection Sort</h2>

   <h3>Funcionamento</h3>
   - O selection sort coloca sempre o menor valor do vetor para a primeira posição (ou o maior dependendo da ordem requerida), depois o de segundo menor valor para a segunda posição, e assim é feito sucessivamente com os (n-1) elementos restantes, até os últimos dois elementos.
   - Não Estável

   <h3>Complexidade</h3>

   - O(n<sup>2</sup>)
   

