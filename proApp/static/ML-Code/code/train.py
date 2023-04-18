import numpy
import matplotlib.pyplot as plt
from keras.layers import Dropout
from keras.layers import Flatten
from keras.constraints import maxnorm
from tensorflow.keras.optimizers import SGD
from keras.optimizers import gradient_descent_v2 
from keras.layers import Conv2D
from keras.layers.convolutional import MaxPooling2D
from keras.utils import np_utils
from keras import backend as K
import load_data
from keras.models import Sequential
from keras.layers import Dense
from sklearn.model_selection import train_test_split

seed = 7
numpy.random.seed(seed)

def pre_process(X):
    X=X.astype('float32')
    X = X / 255.0
    return X

def one_hot_encode(y):
    y = np_utils.to_categorical(y)
    num_classes = y.shape[1]
    return y,num_classes

def define_model(num_classes,epochs):
    model = Sequential()
    model.add(Conv2D(32, (3, 3), input_shape=(64, 64, 3), padding='same', activation='relu', kernel_constraint=maxnorm(3)))
    model.add(Dropout(0.2))
    model.add(Conv2D(32, (3, 3), activation='relu', padding='same', kernel_constraint=maxnorm(3)))
    model.add(MaxPooling2D(pool_size=(2, 2)))
    model.add(Flatten())
    model.add(Dense(512, activation='relu', kernel_constraint=maxnorm(3)))
    model.add(Dropout(0.5))
    model.add(Dense(num_classes, activation='softmax'))
    lrate = 0.01
    decay = lrate/epochs
    sgd = SGD(lr=lrate, momentum=0.9, decay=decay, nesterov=False)
    model.compile(loss='categorical_crossentropy', optimizer=sgd, metrics=['accuracy'])
    print(model.summary())
    return model


X,y=load_data.load_datasets()

X=pre_process(X)

y,num_classes=one_hot_encode(y)


X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.20, random_state=7)

epochs = 100
model=define_model(num_classes,epochs)


history=model.fit(X_train, y_train, validation_data=(X_test, y_test), epochs=epochs, batch_size=50)


scores = model.evaluate(X_test, y_test, verbose=0)
print("Accuracy: %.2f%%" % (scores[1]*100))

model_json = model.to_json()
with open("vein.json", "w") as json_file:
    json_file.write(model_json)
model.save_weights("vein.h5")
print("Saved model to disk")

model.summary()




print(history.history.keys())
plt.plot(history.history['accuracy'])
plt.plot(history.history['val_accuracy'])
plt.title('model accuracy')
plt.ylabel('accuracy')
plt.xlabel('epoch')
plt.legend(['train', 'test'], loc='upper left')
plt.show()
plt.plot(history.history['loss'])
plt.plot(history.history['val_loss'])
plt.title('model loss')
plt.ylabel('loss')
plt.xlabel('epoch')
plt.legend(['train', 'test'], loc='upper left')
plt.show()





