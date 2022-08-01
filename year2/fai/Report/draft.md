# FAI Final Report: Investigating the Urban Score in Different Parts of a City
As a civil engineering student, besides dealing with structures and soil, we also have to study urban planning, including traffic flow and characteristics of different areas in a city. It is particularly important in countries like Japan because of the frequent occurrence of disasters, hence when we design a city or a neighbourhood, we also have to consider if residents are able to evacuate properly. In this report, I would like to focus on urban planning, and use deep learning to investigate the density of infrastructures in the area. The following code is just a simple concept of what I want to achieve in machine learning, meaning that my code still needs further development and more polishing. 
# Urban Planning 
To start off, we have to first understand what urban planning is. According to Wikipedia, urban planning is a technical and political process that is focused on the development and design of land use and the built environment. It is a study that requires meticulous thinking and predictions, which also affects the livelihood of people. A badly designed neighbourhood can have adverse effects on the person’s long-term mental health, increase local crime rates, or even increase the risk of chronic diseases such as respiratory issues due to factors such as bad air quality and noise pollution. A neighbourhood has to be carefully designed in a way that there is no overcrowding, with adequate green spaces and sufficient facilities to suit everyone’s needs. Urbanization is also related to economic development and disaster control; hence it is a subject that cannot be taken lightly.
# The Problem
One of the most straightforward ways to study a city is from its infrastructures. By knowing the density of buildings and in reverse, the amount of open spaces in that area and how far apart each cluster are from each other, it can help urban designers in a lot of things, such as designing the networks for public transportation, electricity, water distribution and such. A recent example is investigating the clusters of Covid-19 infections. Since it can be transmitted easily, scientists have to analyse whether the buildings within a certain radius of the infection will be affected so that residents can be evacuated. Furthermore, in risk assessments of infrastructures, such as building a factory nearby, planners have to first check which part of the area is suitable for constructing a factory, how the process will affect the residents nearby, the hazards that may occur to people in a certain radius of damage. With a rapid rate of population growth and other changes in the modern society, it is difficult to keep track of everything. If you count the number of buildings from a satellite map manually, it might be different after a day. Hence, it is important for us to come up with a way to monitor the changes in the area so that our data can be up to date. In order to achieve that, I would like to use deep learning to analyse images of satellite maps so that it can identify and count the buildings for us rather than finding someone to do it manually. 
# Machine learning vs Deep learning
The reason why I have chosen deep learning is because it involves image recognition. First, let me explain the differences between machine learning and deep learning. In the past lectures, we have come across both of the models. For machine learning, it refers to instructing the computer to use algorithms to perform certain tasks without any complicated structures. An example would be predictive modelling, which we have learnt in class using regression to investigate the relationship between variables and predict an outcome. For deep learning however, it is much more complex than machine learning. Deep learning utilises artificial neural networks, or “ANN” for short, which simulates the neural network of a human brain. You can imagine how complex it can be. While a model in machine learning has to be programmed explicitly for that specific task, deep learning models are made to allow the machine to “think and act”. There are layers of neural network connected to each other, resulting in a “non-linear outcome”. Deep learning models also require a large amount of data to train the system, so that it can “learn”. When compared to machine learning, it may take some time to "feed" the network to train it, but it can generate more complex outputs without human intervention. 

So, how does image recognition work with deep learning models? In deep learning, there is a type of network called the "Convolutional Neural Network". This type of network works specifically well with images, as it divides the image into different layers or elements, adjust it until the computer can "understand" the image. In the following part, I would like to demonstrate how the computer can recognize and label the objects found in an image using the object detection API from [TensorFlow](https://github.com/tensorflow/models/blob/master/research/object_detection/utils/visualization_utils.py). I have also referred to the [tutorial](https://www.tensorflow.org/hub/tutorials/object_detection) by TensorFlow regarding object detection. 

# Code 
Since the exact code can be found on the website, I will just highlight a few parts of the code since my main focus will be the end result. 

First, we have to import the library from TensorFlow because we are using its API:
```
import tensorflow as tf
```
Next, we import the trained machine learning models from TensorFlow (we need this because the pre-trained models are useful for the neural networks, including the image classification models):
```
import tensorflow_hub as hub
```
To import the image, we can ask our computer to download the image itself by only providing the url of the image. The computer can then download the image and save it to a temporary location, and can resize it accordingly.
```
import matplotlib.pyplot as plt
import tempfile 
from six.moves.urllib.request import urlopen
from six import BytesIO
```
Since our goal here is to not only identify the objects but to label them in the given image, the following libraries from numpy and PIL (Python Imaging Library). Our computer would first identify the object(s) in the image, determine its location, and label it by drawing a frame around it. 
```
import numpy as np
from PIL import Image
from PIL import ImageColor
from PIL import ImageDraw
from PIL import ImageFont
from PIL import ImageOps
```
Last but not least, we can import the time module from Python as it can come in handy when measuring the runtime and/or inference time for the model to process the data. 
```
import time
```
Here is what the entire setup will look like: 
```
#@title Imports and function definitions

# For running inference on the TF-Hub module.
import tensorflow as tf

import tensorflow_hub as hub

# For downloading the image.
import matplotlib.pyplot as plt
import tempfile
from six.moves.urllib.request import urlopen
from six import BytesIO

# For drawing onto the image.
import numpy as np
from PIL import Image
from PIL import ImageColor
from PIL import ImageDraw
from PIL import ImageFont
from PIL import ImageOps

# For measuring the inference time.
import time
```
Below are some helper functions that can come in handy later:

After setting it up, we can move forward to download an image from the Internet and resize it to the desired dimensions. 
```
image_url = "https://www.satellitetoday.com/wp-content/uploads/2018/04/0003_AUS_Sydney_Jan06_2015_WV3_30cm-1.jpg"  #@param
downloaded_image_path = download_and_resize_image(image_url, 1280, 856, True)
```
In order for it to work, we have to apply an object detection module on the downloaded image. According to the documentation, there are two modules, which are:
* **FasterRCNN+InceptionResNet V2**: gives higher accuracy but slow inference time
* **ssd+mobilenet V2**: a light module with fast inference time but lower accuracy

In this case, I would like to try out both of the modules and see how each of them fare against each other. To test the modules, I am going to use a satellite image of Sydney, Australia found [here](https://www.satellitetoday.com/wp-content/uploads/2018/04/0003_AUS_Sydney_Jan06_2015_WV3_30cm-1.jpg). 

![Satellite image of Sydney, Australia](https://www.satellitetoday.com/wp-content/uploads/2018/04/0003_AUS_Sydney_Jan06_2015_WV3_30cm-1.jpg)

```
module_handle = "https://tfhub.dev/google/faster_rcnn/openimages_v4/inception_resnet_v2/1" #@param ["https://tfhub.dev/google/openimages_v4/ssd/mobilenet_v2/1", "https://tfhub.dev/google/faster_rcnn/openimages_v4/inception_resnet_v2/1"]

detector = hub.load(module_handle).signatures['default']

def load_img(path):
  img = tf.io.read_file(path)
  img = tf.image.decode_jpeg(img, channels=3)
  return img

def run_detector(detector, path):
  img = load_img(path)

  converted_img  = tf.image.convert_image_dtype(img, tf.float32)[tf.newaxis, ...]
  start_time = time.time()
  result = detector(converted_img)
  end_time = time.time()

  result = {key:value.numpy() for key,value in result.items()}

  print("Found %d objects." % len(result["detection_scores"]))
  print("Inference time: ", end_time-start_time)

  image_with_boxes = draw_boxes(
      img.numpy(), result["detection_boxes"],
      result["detection_class_entities"], result["detection_scores"])

  display_image(image_with_boxes)
```
Run the detector:
```
run_detector(detector, downloaded_image_path)
```

# Future Developments
# References
