import os
import cv2
import tensorflow as tf

DATADIR = "/media/scape/SenDesign/SeniorDesign/ai/pitch_data_set"

CATEGORIES = ["Pitchtest", "NonPitchtest"]
PreDiction = ["Pitch", "NotPitch"]

SIZE = 100 


model = tf.keras.models.load_model("Pitch_detect.model")
for category in CATEGORIES:  
    path = os.path.join(DATADIR,category)
    for img in os.listdir(path):
        img_array = cv2.imread(os.path.join(path,img) ,cv2.IMREAD_GRAYSCALE)
        new_array = cv2.resize(img_array, (SIZE, SIZE))
        transformed=new_array.reshape(-1, SIZE, SIZE, 1)
        prediction = model.predict(transformed)
        print(img,PreDiction[int(prediction[0][0])])

