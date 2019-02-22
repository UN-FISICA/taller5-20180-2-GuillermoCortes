def calc(image, hz, dx):
	
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
if(promc>=200):
	imc1=np.where(imc>200,0,255)
if(promc<=40):
	imc1=np.where(imc<30,0,255)



plt.imshow(imc)
plt.show()
plt.imshow(imc1)
plt.show()


	return 0
