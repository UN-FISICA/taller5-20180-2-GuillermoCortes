import numpy as np
import scipy.ndimage as nd 
import matplotlib.pyplot as plt


imc = plt.imread("Bolas1.tif")

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
print promc
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
Altura=[]
Inicio = Centro[0][0]

print Centro2
plt.imshow(imc)
plt.show()
plt.imshow(imc1)
plt.show()
plt.imshow(lblim)
plt.show()



#surface_area
	return 0
