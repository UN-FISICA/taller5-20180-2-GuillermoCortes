import matplotlib.pyplot as plt

imc=plt.imread("Bolas2.tif")
img=((imc[:,:,0]*0.2989) + (imc[:,:,1]*0.5870) + (imc[:,:,2]*0.1140))/3
a = (sum(sum(img)))/(10**6)
l=0
if(a>20):
	l=60
	for i in range(len(img)):
		for j in range(len(img[i])):
			if img[i][j]<=l:
				img[i][j]=1
			if img[i][j]>l:
				img[i][j]=0
if(a<20):
	l=5
	for i in range(len(img)):
		for j in range(len(img[i])):
			if img[i][j]<=l:
				img[i][j]=0
			if img[i][j]>l:
				img[i][j]=1

plt.imshow(img)
plt.show()
#Hasta aqui sería pasarlo con los bordes, ahora toca es calcular los centros de masa y los tiempos.
