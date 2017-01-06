#! /usr/bin/env python
# -*- coding: utf-8 -*-

#Librerias
import csv
from shutil import copyfile
import sys
import codecs
import os

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
#print reemplazos



#Recupera los registros del ultimo logfile
cantidadvieja=0
numerosreemplazos=0

if os.path.isfile('../Tesis.indice.log'):
  with open('../Tesis.indice.log', 'r') as loginfile:
    lector2 = csv.reader(loginfile,delimiter=';')
    registro = {}
    for row in lector2:
       i, j = row
       registro[i] = j
  for key, value in registro.iteritems() :
      cantidadvieja = key
      numerosreemplazos = value


#Buscar y reemplza
total=0
print '   Palabras en el Indice Anterior:',cantidadvieja
print '   Palabras en el Indice Actual:', '\033[1;32m',len(palabras),'\033[1;m'
for viejo, nuevo in reemplazos.iteritems():
  copyfile('../'+viejo , '../'+nuevo)
  print '   Procesando Archivo:',nuevo,
  count=0
  with open('../'+viejo) as infile: 
    with open('../'+nuevo, 'w') as outfile:
      for line in infile:
        for src, target in palabras.iteritems():
          count += line.count(src)
          line = line.replace(src, target)
        outfile.write(line)      
  print '--> Entradas:\033[1;32m',count,'\033[1;m'
  total=total+count
print '   Total de Entradas Indice anterior:',numerosreemplazos
print '   Total de Entradas Indice actual:\033[1;32m',total,'\033[1;m' 

#Escribe las registros de numeros en el logfile
with open('../Tesis.indice.log', 'w+') as logfile:
  linea1 = str(len(palabras))+';'+str(total)
  logfile.write(linea1)


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
