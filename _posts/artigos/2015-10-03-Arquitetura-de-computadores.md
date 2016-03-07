---
layout: post
title: Arquitetura de Computadores
description: "Arquitetura e Organização de Computadores"
modified: 2015-10-03
category: articles
tags: [computação, arquitetura de computadores]
image:
  feature: arquiteturacomputadores/arquitetura.jpg
  credit: 
  creditlink: 
comments: true
share: true
---

#Arquitetura de Von Neumann x Modelo de Harvard

<figure>
	<img src="/images/arquiteturacomputadores/arquiteturacomp.png">
</figure>
link: <a href="https://www.goconqr.com/pt-BR/p/3670369">aqui</a>

#Máquina multinivel
<figure>
	<img src="/images/arquiteturacomputadores/multinivel.jpg">
</figure>

#Conversor de Linguagem
<figure>
  <img src="/images/arquiteturacomputadores/Compilador.png">
</figure>
Link: <a href="https://www.goconqr.com/pt-BR/mind_maps/3677492/">aqui</a>

<script s>
 var $ = go.GraphObject.make;
var myDiagram =
  $(go.Diagram, "myDiagramDiv",
    {
      initialContentAlignment: go.Spot.Center, // center Diagram contents
      "undoManager.isEnabled": true // enable Ctrl-Z to undo and Ctrl-Y to redo
    });

var myModel = $(go.Model);
// in our model data, each node is represented by a JavaScript object:
myModel.nodeDataArray = [
  { key: "Alpha" },
  { key: "Beta" },
  { key: "Gamma" }
];
myDiagram.model = myModel;
    </script>


<div id="myDiagramDiv" style="width:400px; height:150px; background-color: #DAE4E4;"></div>
    



