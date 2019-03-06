import matplotlib.pyplot as plt
import numpy as np

def inicio(x):
	i=0
	n=0
	while(x[i]!=0):
		n=n+1
		i=i+1
	i1=0
	n1=0
	x = x[n:]
	x = sincer(x)
	return x 

def sincer(x):
	i=0
	n=0
	while(x[i]==0):
		n=n+1
		i=i+1
	x = x[n:]
	return x
	
def concer(x):
	i=0
	n=0
	while(x[i]!=0):
		n=n+1
		i=i+1
	x=x[n:]
	return x
def listatemp(x,m):
	i=m
	n=0
	xtemp=[]
	while(x[i]!=0):
		xtemp.append(x[i])
		n=n+1
		i=i+1
	return xtemp, n

def centro(x):
	i=0
	
	
def cont1(img):
	g=1
	x=[]
	r=1
	for i in range(len(img)):
		for j in range(len(img[i])):
			if img[i][j]==1:
				g=g+1
		if(g!=0):
			x.append(g)
		else:
			x.append(0)
			r=0
		g=0
	return x



def calc(imagen,dx,dt):
	imc=plt.imread(imagen)
	img=((imc[:,:,0]*0.2989) + (imc[:,:,1]*0.5870) + (imc[:,:,2]*0.1140))/3
	a = (sum(sum(img)))/(10**6)
	if(a>20):
		k=60
		for i in range(len(img)):
			for j in range(len(img[i])):
				if img[i][j]<=k:
					img[i][j]=1
				if img[i][j]>k:
					img[i][j]=0
	if(a<20):
		k=5
		for i in range(len(img)):
			for j in range(len(img[i])):
				if img[i][j]<=k:
					img[i][j]=0
				if img[i][j]>k:
					img[i][j]=1
	x=cont1(img) #Contar cuantos "1" hay en cada fila de la matriz de img
	x=np.array(x) #Todo pasa a ser una lista.
	x = inicio(x)
	x1=[]
	x2=[]
	x1,n1 = listatemp(x,0)
	x = inicio(x)
	x = concer(x)
	print x
	print x1
	print (n1-1)/2 #Hasta aqui tocaria es encontrar los "centros" de cada "bloque" de x.
	

calc("Bolas2.tif",0.5,0.1)
