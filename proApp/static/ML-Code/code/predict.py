import numpy as np
import os
from scipy import  misc
from keras.models import model_from_json
import pickle
import cv2

# Loading int2word dict
classifier_f = open("int_to_word_out.pickle", "rb")
int_to_word_out = pickle.load(classifier_f)
classifier_f.close()

def load_model():    
    json_file = open('vein.json', 'r')
    loaded_model_json = json_file.read()
    json_file.close()
    loaded_model = model_from_json(loaded_model_json)
    loaded_model.load_weights("vein.h5")
    print("Loaded model from disk")
    return loaded_model

def pre_process(image):    
    image = image.astype('float32')
    image = image / 255.0
    return image

def load_image():
    img = cv2.imread("dataset\\person7\\7.bmp")
    image = cv2.resize(img, (64, 64))
    image=np.array([image])
    image=pre_process(image)
    return image

image=load_image()
model=load_model()
prediction=model.predict(image)

print(prediction)
print(np.max(prediction))
print(int_to_word_out[np.argmax(prediction)])
