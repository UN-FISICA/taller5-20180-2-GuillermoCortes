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
	
def contador(x):
	n=0
	nc = 0
	i=0
	u=0
	while(x[i]!=0):
		n=n+1 #Numero de elementos de la primera esfera encontrada en x
		i=i+1 #Numero del elemento de x hasta que llego.
	while(x[i]==0):
		i=i+1
		nc=nc+1
	x=x[(n+nc):]
	u = int(n/2)	#Fila central de las n-esimas filas de x
	return x, n, nc, u #x: nueva lista. nc= No. de ceros u = 
		
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
			
def centros(x,b)
	i=0
	j=0
	a = []
	xtemp = []
	while(i<b):
		
		
	return a
	
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

def final(x):
	xtemp = x[::-1]
	xtemp = sincer(xtemp)
	xtemp = xtemp[::-1]
	return xtemp
	
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
	x=np.array(x) #Todo pasa a ser un arreglo.
	x = inicio(x) #Quitamos el primer conjunto y los primeros ceros.
	b = contadorb(x)
	print x
	print b
	plt.imshow(img)
	plt.show()



	

calc("b5.jpeg",0.5,0.1)

