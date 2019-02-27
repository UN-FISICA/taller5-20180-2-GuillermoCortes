import numpy as np
import scipy.ndimage as nd 
import matplotlib.pyplot as plt
from numpy.linalg import inv
from pylab import *

imc = plt.imread("b4.jpeg")
dx = 0.5
dt = 1/0.65
def Gris(imagen):
	filtro = []
	for i in imagen:
		for r,g,b in i:
			rojo = r*0.2989
			verde = g*0.5870
			azul = b*0.1140
			numero = [int(rojo + verde + azul)]
			filtro.append(numero)
	result = np.reshape(filtro, imagen.shape[:2])
	return result
imc= Gris(imc)
promc=np.mean(imc)
def Bordes(image):
	if(promc>=200):
		imc1=np.where(image>200,0,255)
	if(promc<=40):
		imc1=np.where(image<28,0,255)
	return imc1

imc1= Bordes(imc) #En todas las imagenes, SIEMPRE el primer conjunto de pelotas esta pegado, por lo que podemos considerar a partir de la segunda.
lblim,n=nd.measurements.label(imc1)
Centro=[]
Tiempo=[]
l=0
while(l<n):
	Centro.append(nd.measurements.center_of_mass(imc1,lblim, l+1))
	l= l+1
Centro=Centro[1:]
Centro2=[]
Altura=[]

for i in Centro:
	Centro2.append(i[0] - Centro[0])
	
for i in Centro2:
	Altura.append(i[0]*dx)
	
for i in range(len(Altura)):
	Tiempo.append((i+1)/dt)

x=np.array(Tiempo)
y=np.array(Altura)

f=[]
f.append(lambda x:np.ones_like(x))
f.append(lambda x:x)
f.append(lambda x:x**2)

Xt=[]

for fu in f:
    Xt.append(fu(x))

Xt= np.array(Xt)
X=Xt.transpose()

a = np.dot(np.dot(inv(np.dot(Xt,X)),Xt),y)


print a[2]*2

	return 0
