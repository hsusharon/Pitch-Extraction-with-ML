# Pitch-Extraction-with-ML
By training different ML model on Pitch extraction and see the how it performs

Dataset: PTDB-TUG Database![image](https://user-images.githubusercontent.com/41236805/166835205-18192d6b-9142-4cea-a848-a11708d4a72b.png)

All the code is in the Code folder and is named after different types of model experimented through this project
The insert each frame with 480 samples(10 ms), we can train the model and obtain the pitch that will be assgined to this frame. 

![alt text](img/1.jpg)

1. Fully connected model
2. Feature model(Data + MFCC)
3. 1D Convolutional Neural Network
4. 2D Convolutional Neural Network
5. Transfer Learning with VGG19 model

