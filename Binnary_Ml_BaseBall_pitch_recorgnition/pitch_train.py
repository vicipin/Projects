import numpy as np
import matplotlib.pyplot as plt
import os
import cv2
from tqdm import tqdm

DIR_PATH = "/media/scape/SenDesign/SeniorDesign/ai/pitch_data_set"
CATEGORIES = ["Pitch", "NonPitch"]
SIZE = 100 #all orignal image apear to be  360P size but my hardware cant compte
#i have 4gigs of ram but later one of the image tensor could not be contained peherps 
# 8 gigs i would have been fine but i had to rezie // may affect result 
#new_array = cv2.resize(img_array, (SIZE, SIZE))
#plt.imshow(new_array, cmap='gray')
#plt.show()
#just diplaying what new image looks like
train_data = [] #new asrray to keep resized image
numbe=0
def get_train_data():
    for category in CATEGORIES:  # do Pitch and NonPitch
        path = os.path.join(DIR_PATH,category)  # create path to pitch and NonPitch
        class_num = CATEGORIES.index(category)  # get the classification  (0 or a 1). 0=Pitch 1=NonPitch
        #basicaly making  the image represented as either or 2
        for img in tqdm(os.listdir(path)):  # iterate over each image per Pitch and NonPitch
            try:
                img_array = cv2.imread(os.path.join(path,img) ,cv2.IMREAD_GRAYSCALE)  # convert to array
                new_array = cv2.resize(img_array, (SIZE, SIZE))  # resize to normalize data size
                #plt.imshow(new_array, cmap='gray')
                #plt.show()
                train_data.append([new_array, class_num])  # add this to our train_data
            except Exception as e:  # in the interest in keeping the output clean...
                pass
                #the data set is quite clean so we dont have to catch anything here

get_train_data()
# we simply call the function
print(len(train_data))
#here we just try to veryfy that we have good tensor or matrix of what we will train
import random
#import the eandom mdule
random.shuffle(train_data)# we now want to randomize our input 
for sample in train_data[:10]:
    print(sample[1])
    #diplay the sequence of the input for some sample
    #given  that this a supervised laerning we here some x and y for features and label

X = []
y = []

for features,label in train_data:
    X.append(features) #this array has the feature
    y.append(label) #this array has the label

X = np.array(X).reshape(-1, SIZE, SIZE, 1)

import pickle

pickle_out = open("X.pickle","wb")
pickle.dump(X, pickle_out)
pickle_out.close()

pickle_out = open("y.pickle","wb")
pickle.dump(y, pickle_out)
pickle_out.close()

import tensorflow as tf
from tensorflow.keras.datasets import cifar10
from tensorflow.keras.preprocessing.image import ImageDataGenerator
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense, Dropout, Activation, Flatten
from tensorflow.keras.layers import Conv2D, MaxPooling2D
from tensorflow.keras.callbacks import TensorBoard
import time
#we are using 2dCNN cause we change image to grascale
#so dimentions in clasifier is only 2 "how dark or how light parts of the image is"
import pickle
Name = "pitch_V_nonpitch{}".format(int(time.time()))
tensor_graph=TensorBoard(log_dir='logs/{}'.format(Name))#tensor board callback to diplay does not work yet
#graph of functions
pickle_in = open("X.pickle","rb")
X = pickle.load(pickle_in)

pickle_in = open("y.pickle","rb")
y = pickle.load(pickle_in)

X = X/255.0

model = Sequential()

model.add(Conv2D(256, (3, 3), input_shape=X.shape[1:]))  #first  layer
model.add(Activation('relu'))
model.add(MaxPooling2D(pool_size=(2, 2)))

model.add(Conv2D(256, (3, 3))) #second layer
model.add(Activation('relu'))
model.add(MaxPooling2D(pool_size=(2, 2)))

model.add(Flatten())  # get 1D feature array to feed to the dense layer

model.add(Dense(64)) #dense layer
model.add(Activation("relu"))

model.add(Dense(1))
model.add(Activation('sigmoid'))

model.compile(loss='binary_crossentropy', optimizer='adam', metrics=['accuracy'])

model.fit(X, y, batch_size=32, epochs=3, validation_split=0.3, callbacks=[tensor_graph])

model.save('Pitch_detect.model')#should save model in current working dir