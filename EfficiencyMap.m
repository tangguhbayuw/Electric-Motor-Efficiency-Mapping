clc;
clear all;
%% Declare the efficiency map in RGB with .jpg/.png format
img = imread("efisiensi motor emrax.png");
[row, col, dim] = size(img);
im = double(img);
imshow(uint8(img));

%% Color segmentation of the efficiency map
red = im(:, :, 1);
green = im(:, :, 2);
blue = im(:, :, 3);
k = 1;
for i = 1:1:row
    for j = 1:1:col
        redVal = abs(red(i,j));
        greenVal = abs(green(i,j));
        blueVal = abs(blue(i,j));
        %% Eficciency 88
        if((redVal == 255) && (greenVal == 0) && (blueVal == 0))
            Torque(k) = 141 - i;
            RPM(k) = j;
            Efficiency(k) = 0.88;
            k = k + 1;
        %% Efficiency 92
        else if((redVal == 0) && (greenVal == 255) && (blueVal == 0))
            Torque(k) = 141 - i;
            RPM(k) = j;
            Efficiency(k) = 0.92;
            k = k + 1;
        %% Efficiency 94
        else if((redVal == 255) && (greenVal == 255) && (blueVal == 0))
            Torque(k) = 141 - i;
            RPM(k) = j;
            Efficiency(k) = 0.94;
            k = k + 1;
        %% Efficiecny 95
        else if((redVal == 0) && (greenVal == 255) && (blueVal == 255))
            Torque(k) = 141 - i;
            RPM(k) = j;
            Efficiency(k) = 0.95;
            k = k + 1;
        %% Efficiecny 96
        else if((redVal == 0) && (greenVal == 0) && (blueVal == 255))
            Torque(k) = 141 - i;
            RPM(k) = j;
            Efficiency(k) = 0.96;
            k = k + 1;   
        else
           Torque(k) = 141 - i;
           RPM(k) = j;
           Efficiency(k) = 0.86;
           k = k + 1;
        end
        end
        end
        end
        end
    end
end  
%% Transpose the matrix to be 1 column matrix
RPM_t = RPM.';
Torque_t = Torque.';
Efficiency_t = Efficiency.';
%% Combine the data an export to .csv
DataEfficiency = [RPM_t, Torque_t, Efficiency_t];
csvwrite('Efficiency Map.csv', DataEfficiency);