#Toboggan Contrast Enhancement
#Created By- Mayur Raul
#enrollment Number- BT17ECE067

import numpy as np

# Image Matrix
image_matrix = np.array([[4,4,3,2], [3,7,6,1], [2,7,6,2], [0,1,0,2]])
print(image_matrix)
# Gradient Matrix
gradient_matrix = np.array([[12,14,23,13], [16,11,21,18], [21,24,23,13], [12,21,20,10]])
print(gradient_matrix)
# Output Matrix initially
# Values will be updated in the Output Matrix after applying Toboggan Algorithm

output_matrix = np.array([[0,0,0,0], [0,0,0,0], [0,0,0,0], [0,0,0,0]])
print(output_matrix)

# Padding Gradient Matrix with zeros
gd_zp = np.pad(gradient_matrix, pad_width=1, mode='constant', constant_values=0)

# Applying Toboggan Contrast Enhancement Algorithm
for i in range(1,5):
    for j in range(1,5):
        
        # Making Matrix of all neighbouring values 
        # It is a 3x3 Matrix
        neighbours = np.array([[gd_zp[i-1,j-1], gd_zp[i-1,j], gd_zp[i-1,j+1]], \
                              [gd_zp[i,j-1], gd_zp[i,j], gd_zp[i,j+1]], \
                              [gd_zp[i+1,j-1], gd_zp[i+1,j], gd_zp[i+1,j+1]]])
        print('Neighbourhood of',gd_zp[i,j],'is :')
        print(neighbours)
        
        # Minimum value in the Neighbourhood Matrix
        min_value = np.min(neighbours[np.nonzero(neighbours)])
        print('Minimum value in the Neighbourhood Matrix : ',min_value)

        # Computing index of minimum value in gradient matrix
        index_min_value = np.where(gradient_matrix == min_value)
        
        # Coordinates of minimum value in gradient matrix in List
        coord_np_arr = list(zip(index_min_value[0], index_min_value[1]))
        for cord in coord_np_arr :
            coordinate = list(cord)
            print(coordinate)
         
        # Updating output matrix with the value in image matrix corressponding to minimum value in gradient matrix 
        output_matrix[i-1,j-1] = image_matrix[coordinate[0], coordinate[1]] 

print('***************************************************************')        
print('Output : ')
print(output_matrix)

