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
		
def contadorb(x):
	i=0
	suma=0
	bloq=0
	b=0
	while(i<len(x)):
		suma = x[i] + suma
		if(x[i]!=0):
			if bloq==0:
				b = b+1
				bloq=1
		if suma==0:
			bloq=0	
		suma=0
		i=i+1		
	return b
			
def centros(x,b):
	i=0
	ci = []
	ci2 = []
	while(x[i]!=0):
		i=i+1
	e1=i		
	while(x[i]==0):
		i=i+1
	ci = e1 + i
	c = e1/2
	ci2 = 0
	t=1
	x = x[i:]
	centro = []*b
	while(t<b):
		a=0
		j=0
		s=[]
		while(x[a]!=0):
			a=a+1
			j=j+1
		cit = a
		s = x[a:]
		a=0
		while(s[a]==0):
			a=a+1
			j=j+1
		centro.append(ci + (cit)/2)
		ci = ci + j
		x = s[a:]
		t=t+1
	return centro
	

def sincer(x):
	i=0
	n=0
	while(x[i]==0):
		n=n+1
		i=i+1
	x = x[n:]
	return x
	

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

def cuadrados(x,t):
	l = len(x)
	temp = []
	i=0
	s= [1]*l
	while(i<l):
		temp.append(x[i]*x[i])
		i=i+1
	f = []
	f.append(lambda x:s)
	f.append(lambda x:x)
	f.append(lambda x:temp)
	
	Xt = []
	
	for fu in f:
		Xt.append(fu(x))
	Xt = np.array(Xt)
	X = trans(Xt)
	a = np.dot(np.dot(inv(np.dot(Xt,X)),Xt),t)
	print a[2]*2

def determinante(x):
	det = (x[0][0]*x[1][1]*x[2][2]) + (x[1][
	0]*x[2][1]*x[0][2]) + (x[2][0]*x[0][1]*x[1][2]) - (x[0][2]*x[1][1]*x[2][0]) - (x[1][2]*x[2][1]*x[0][0]) - (x[2][2]*x[0][1]*x[1][0])
	return det

def inv(x):
	i=[[None]*3,[None]*3,[None]*3]
	det = determinante(x)
	i[0][0]=(x[1][1]*x[2][2]-x[1][2]*x[2][1])/det
	i[0][1]=(x[0][2]*x[2][1]-x[0][1]*x[2][2])/det
	i[0][2]=(x[0][1]*x[1][2]-x[0][2]*x[1][1])/det
	
	i[1][0]=(x[1][2]*x[2][0]-x[1][0]*x[2][2])/det
	i[1][1]=(x[0][0]*x[2][2]-x[0][2]*x[2][0])/det
	i[1][2]=(x[0][2]*x[1][0]-x[0][0]*x[1][2])/det
	
	i[2][0]=(x[1][0]*x[2][1]-x[1][1]*x[2][0])/det
	i[2][1]=(x[0][1]*x[2][0]-x[0][0]*x[2][1])/det
	i[2][2]=(x[0][0]*x[1][1]-x[0][1]*x[1][0])/det
	return i

def trans(x):
	c=len(x[0])
	f=len(x)
	fi=0
	cl = 0
	i = 0
	xT = [None]*c
	for i in range(c):
		xT[i] = [None]*f
	while fi < f:
		while cl < c:
			xT[cl][fi] = x[fi][cl]
			cl = cl + 1
		fi = fi + 1 
		cl = 0
	xT = np.array(xT)
	return xT

def calc(imagen,dx,dt):
	dx=dx
	dt = 1/dt
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
	x=np.array(x) #Todo pasa a ser un arreglo.
	x = inicio(x) #Quitamos el primer conjunto y los primeros ceros.
	b = contadorb(x)
	Altura = []
	Altura = centros(x,b)
	print Altura

	


#Hasta aqui tocaria es encontrar los "centros" de cada "bloque" de x.
	

calc("b0.jpeg",0.5,0.5)
