close all
MSE = zeros(7,2);

info_female = audioinfo('test_dataset/test.wav');
[y_female,Fs] = audioread('test_dataset/test.wav');
t_female = 0:seconds(1/Fs):seconds(info_female.Duration);
t_female = t_female(1:end-1);
figure();
subplot(2,1,1)
plot(t_female,y_female)
xlabel('Time')
ylabel('Audio Signal')
title('Pitch of Female Audio')

T_female = readtable('test_dataset/test.csv');
A_female = table2array(T_female);
frequence_female = A_female(:,2);
subplot(2,1,2);
plot(frequence_female,'.')
ylim([0 300])
xlim([0 240])

info_male = audioinfo('test_dataset/test1.wav');
[y_male,Fs] = audioread('test_dataset/test1.wav');
t_male = 0:seconds(1/Fs):seconds(info_male.Duration);
t_male = t_male(1:end-1);
figure();
subplot(2,1,1)
plot(t_male,y_male)
xlabel('Time')
ylabel('Audio Signal')
title('Pitch of Male Audio')

T_male = readtable('test_dataset/test1.csv');
A_male = table2array(T_male);
frequence_male = A_male(:,2);
subplot(2,1,2);
plot(frequence_male,'.')
ylim([0 300])
xlim([0 220])

%%

figure()                                                 %% My Model Female 
subplot(3,1,1)
plot(t_female,y_female)
xlabel('Time')
ylabel('Audio Signal')
title('My Model Female Audio')

subplot(3,1,2);
plot(frequence_female,'.')
ylim([50 300])
xlim([0 240])

T = readtable('pitch_demo/MyModel_test.csv');
A = table2array(T);
frequence = A(:,1);
frequence = frequence+61;
subplot(3,1,3);
plot(frequence,'.')
ylim([50 300])

MSE(1,1) = 0;
for i=1:size(frequence)
    sub = frequence(i)-frequence_female(i);
    MSE(1,1) = MSE(1,1) + abs(sub);
end

figure()                                                 %% My Model Male 
subplot(3,1,1)
plot(t_male,y_male)
xlabel('Time')
ylabel('Audio Signal')
title('My Model Male Audio')

subplot(3,1,2);
plot(frequence_male,'.')
ylim([0 200])
xlim([0 220])

T = readtable('pitch_demo/MyModel_test1.csv');
A = table2array(T);
frequence = A(:,1);
frequence = frequence+61;
subplot(3,1,3);
plot(frequence,'.')
ylim([0 200])  
xlim([0 220])

MSE(1,2) = 0;
for i=1:size(frequence)
    sub = frequence(i)-frequence_male(i);
    MSE(1,2) = MSE(1,2) + abs(sub);
end

%%

figure();                                           %% 1D CNN Model1 Female
subplot(3,1,1)
plot(t_female,y_female)
xlabel('Time')
ylabel('Audio Signal')
title('1D CNN Model1 Female Audio')

subplot(3,1,2);
plot(frequence_true,'.')
T = readtable('pitch_demo/CNNModel1_test.csv');
A = table2array(T);
frequence = A(:,1);
frequence = frequence+61;
subplot(3,1,3);
plot(frequence,'.')
ylim([50 300])

MSE(2,1) = 0;
for i=1:size(frequence)
    sub = frequence(i)-frequence_female(i);
    MSE(2,1) = MSE(2,1) + abs(sub);
end

figure();                                         %% 1D CNN Model1 Male
subplot(3,1,1)
plot(t_male,y_male)
xlabel('Time')
ylabel('Audio Signal')
title('1D CNN Model1 Male Audio')

subplot(3,1,2);
plot(frequence_male,'.')
xlim([0 220])
ylim([0 200])

T = readtable('pitch_demo/CNNModel1_test1.csv');
A = table2array(T);
frequence = A(:,1);
frequence = frequence+61;
subplot(3,1,3);
plot(frequence,'.')
xlim([0 220])
ylim([0 200])

MSE(2,2) = 0;
for i=1:size(frequence)
    sub = frequence(i)-frequence_male(i);
    MSE(2,2) = MSE(2,2) + abs(sub);
end

%%

figure();                                        %% 1D CNN Model2 Female
subplot(3,1,1)
plot(t_female,y_female)
xlabel('Time')
ylabel('Audio Signal')
title('1D CNN Model2 Female Audio')

subplot(3,1,2);
plot(frequence_female,'.')

T = readtable('pitch_demo/CNNModel2_test.csv');
A = table2array(T);
frequence = A(:,1);
frequence = frequence+61;
subplot(3,1,3);
plot(frequence,'.')
ylim([0 300])

MSE(3,1) = 0;
for i=1:size(frequence)
    sub = frequence(i)-frequence_female(i);
    MSE(3,1) = MSE(3,1) + abs(sub);
end

figure();                                         %% 1D CNN Model2 Male
subplot(3,1,1)
plot(t_male,y_male)
xlabel('Time')
ylabel('Audio Signal')
title('1D CNN Model2 Male Audio')

subplot(3,1,2);
plot(frequence_male,'.')
xlim([0 220])
ylim([0 200])

T = readtable('pitch_demo/CNNModel2_test1.csv');
A = table2array(T);
frequence = A(:,1);
frequence = frequence+61;
subplot(3,1,3);
plot(frequence,'.')
xlim([0 220])
ylim([0 200])

MSE(3,2) = 0;
for i=1:size(frequence)
    sub = frequence(i)-frequence_male(i);
    MSE(3,2) = MSE(3,2) + abs(sub);
end

%%

figure();                                         %% MFCC Model Female
subplot(3,1,1)
plot(t_female,y_female)
xlabel('Time')
ylabel('Audio Signal')
title('MFCC My Model Female Audio')

subplot(3,1,2);
plot(frequence_female,'.')

T = readtable('pitch_demo/MFCC_MyModel_test.csv');
A = table2array(T);
frequence = A(:,1);
frequence = frequence+61;
subplot(3,1,3);
plot(frequence,'.')
ylim([0 300])

MSE(5,1) = 0;
for i=1:size(frequence)
    sub = frequence(i)-frequence_female(i);
    MSE(5,1) = MSE(5,1) + abs(sub);
end


figure();                                         %% MFCC My Model Male
subplot(3,1,1)
plot(t_male,y_male)
xlabel('Time')
ylabel('Audio Signal');
title('MFCC My Model Male Audio')

subplot(3,1,2);
plot(frequence_male,'.')
ylim([0 300])
xlim([0 220])

T = readtable('pitch_demo/MFCC_MyModel_test1.csv');
A = table2array(T);
frequence = A(:,1);
frequence = frequence+61;
subplot(3,1,3);
plot(frequence,'.')
ylim([0 300])
xlim([0 220])

MSE(5,2) = 0;
for i=1:size(frequence)
    sub = frequence(i)-frequence_male(i);
    MSE(5,2) = MSE(5,2) + abs(sub);
end

%%

figure();                                       %%2D CNN Model1 Female
subplot(3,1,1)
plot(t_female,y_female)
xlabel('Time')
ylabel('Audio Signal')
title('2D CNN Model Female Audio')

subplot(3,1,2);
plot(frequence_female,'.')

T = readtable('pitch_demo/CNN2Model_test.csv');
A = table2array(T);
frequence = A(:,1);
frequence = frequence+61;
subplot(3,1,3);
plot(frequence,'.')
ylim([0 300])


MSE(4,1) = 0;
for i=1:size(frequence)
    sub = frequence(i)-frequence_female(i);
    MSE(4,1) = MSE(4,1) + abs(sub);
end

figure();                                       %%2D CNN Model1 Male
subplot(3,1,1)
plot(t_male,y_male)
xlabel('Time')
ylabel('Audio Signal')
title('2D CNN Model Male Audio')

subplot(3,1,2);
plot(frequence_male,'.')
ylim([0 200])
xlim([0 220])

T = readtable('pitch_demo/CNN2Model_test1.csv');
A = table2array(T);
frequence = A(:,1);
frequence = frequence+61;
subplot(3,1,3);
plot(frequence,'.')
ylim([0 200])
xlim([0 220])

MSE(4,2) = 0;
for i=1:size(frequence)
    sub = frequence(i)-frequence_male(i);
    MSE(4,2) = MSE(4,2) + abs(sub);
end

%%

figure();                                  %% TL Female Model
subplot(3,1,1)
plot(t_female,y_female)
xlabel('Time')
ylabel('Audio Signal')
title('Transfer Learning VGG16 Model Female Audio')

subplot(3,1,2);
plot(frequence_female,'.')

T = readtable('pitch_demo/TLModel_test.csv');
A = table2array(T);
frequence = A(:,1);
frequence = frequence+31;
subplot(3,1,3);
plot(frequence,'.')
ylim([0 300])

MSE(6,1) = 0;
for i=1:size(frequence)
    sub = frequence(i)-frequence_female(i);
    MSE(6,1) = MSE(6,1) + abs(sub);
end

figure();                                          %% TL Male Model
subplot(3,1,1)
plot(t_male,y_male)
xlabel('Time')
ylabel('Audio Signal')
title('Transfer Learning VGG16 Model Male Audio')

subplot(3,1,2);
plot(frequence_male,'.')
xlim([0 200])
ylim([0 220])

T = readtable('pitch_demo/TLModel_test1.csv');
A = table2array(T);
frequence = A(:,1);
frequence = frequence;
subplot(3,1,3);
plot(frequence,'.')
xlim([0 200])
ylim([0 220])

MSE(6,2) = 0;
for i=1:size(frequence)
    sub = frequence(i)-frequence_female(i);
    MSE(6,2) = MSE(6,2) + abs(sub);
end

%%

figure();                                  %%Feature Model Female
subplot(3,1,1)
plot(t_female,y_female)
xlabel('Time')
ylabel('Audio Signal')
title('Feature My Model Female Audio')

subplot(3,1,2);
plot(frequence_female,'.')

T = readtable('pitch_demo/Feature_MyModel_test.csv');
A = table2array(T);
frequence = A(:,1);
frequence = frequence+31;
subplot(3,1,3);
plot(frequence,'.')
ylim([0 300])

MSE(7,1) = 0;
for i=1:size(frequence)
    sub = frequence(i)-frequence_female(i);
    MSE(7,1) = MSE(7,1) + abs(sub);
end

figure();                             %% Feature Model Male Audio
subplot(3,1,1)
plot(t_male,y_male)
xlabel('Time')
ylabel('Audio Signal')
title('Feature Model Male Audio')

subplot(3,1,2);
plot(frequence_male,'.')
ylim([0 200])
xlim([0 220])

T = readtable('pitch_demo/Feature_MyModel_test1.csv');
A = table2array(T);
frequence = A(:,1);
frequence = frequence+31;
subplot(3,1,3);
plot(frequence,'.')
ylim([0 200])
xlim([0 220])

MSE(7,2) = 0;
for i=1:size(frequence)
    sub = frequence(i)-frequence_male(i);
    MSE(7,2) = MSE(7,2) + abs(sub);
end


