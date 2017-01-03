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
      archivos=[]
      for line in tesis:
                if '\input{Capitulos/0' in line:	
    				archivo="../Capitulos/"+line[line.find("/")+1:line.find("}")]
    				archivos.append(archivo)

#Buscar y reemplza
total=0
print 'Palabras en el Indice:', len(palabras)
for a in archivos:
  abak = a + '.bak'   #Backup de los archivos
  copyfile(a,abak)
  print 'Procesando Archivo:',a
  salida=a + '.tmp'
  count=0
  with open(abak) as infile: 
    with open(a, 'w') as outfile:
      for line in infile:
        for src, target in palabras.iteritems():
          count += line.count(src)
          line = line.replace(src, target)
          outfile.write(line)      
  print "    Entradas en el capitulo:",count
  total=total+count
print 'Total de Entradas:',total  