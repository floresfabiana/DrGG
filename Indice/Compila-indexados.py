#! /usr/bin/env python
# -*- coding: utf-8 -*-

#Librerias
import csv
from shutil import copyfile
import sys
import codecs

#Varibles Principales
Tesis='../Tesis.tex'
TesisIndexada='../Tesis.indexada'
Indice='Indice.csv'

#Creo un diccionario con el archivo de Indice
with open(Indice, 'r') as arch_csv:
  lector = csv.reader(arch_csv,delimiter=';')
  palabras = {}
  for row in lector:
     k, v = row
     palabras[k] = v

#Lista de archivos de los capitulos solamente donde buscar y reemplazar para indexar
with open(Tesis, 'r') as tesis:
      ArchNuevos=[]
      ArchViejos=[]
      for line in tesis:
                if '\input{Capitulos/0' in line:	
    				      archivoviejo="Capitulos/"+line[line.find("/")+1:line.find("}")]
    				      ArchViejos.append(archivoviejo)
                if '\input{Capitulos/0' in line:
                  archivonuevo="Capitulos.indexados/"+line[line.find("/")+1:line.find("}")]
                  ArchNuevos.append(archivonuevo)

#Creo el diccionario
reemplazos = dict(zip(ArchViejos, ArchNuevos))

#Hago el reemplazo
lines = []
with open(Tesis) as infile:
     for line in infile:
         for src, target in reemplazos.iteritems():
             line = line.replace(src, target)
         lines.append(line)

with open(TesisIndexada, 'w') as outfile:
     for line in lines:
         outfile.write(line)

#Backup, copio y compilo
copyfile(Tesis,Tesis+'.backup')
copyfile(TesisIndexada,Tesis)
