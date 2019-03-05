import matplotlib.pyplot as plt
import numpy as np

imc=plt.imread("b9.jpeg")
img=((imc[:,:,0]*0.2989) + (imc[:,:,1]*0.5870) + (imc[:,:,2]*0.1140))/3
a = (sum(sum(img)))/(10**6)
l=0
print a
print np.size(imc)
print np.size(img)
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

#En el plt.imshow() salen cuadros amarillos. Donde es amarillo es que vale 1, de no ser asi vale 0.
k=1
c1=0
no=[[],[]]
k=0
while(k==0):
	for i in range(len(img)):
		for j in range(len(img[i])):
			if img[i][j]==1:
				a = img[i][j]
				no[i][j] = a			
			if(c1==0):
				k=1
			else:
				k=0
			c1=0
plt.imshow(img)
plt.show()
plt.imshow(no) #Hay un error aqui
plt.show()
