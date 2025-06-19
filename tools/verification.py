import numpy as np
from Decimal_to_Q1_10_10_changing import float_to_q1_10_10

def cos(theta):
    return np.cos(theta)
def sin(theta):
    return np.sin(theta)
def tan(theta):
    return np.tan(theta)
def root(num):
    return np.sqrt(num)
pi = np.pi

#四面體邊長
B = 10

#中心點座標
xc = 0
yc = 0
#yc = B/(2*root(6))
zc = 100

#旋轉角度
thetax = 0
thetay = 0
thetaz = 0

w = 640
h = 480
tan_theta_2 = 0.5
f = 1000
n = 40


# 定義正四面體的四個點
orignal_point = np.array([
    [0, B/(2*root(6)), 0-B/root(3), 1],
    [0+B/2, B/(2*root(6)), 0+B/(2*root(3)), 1],
    [0-B/2, B/(2*root(6)), 0+B/(2*root(3)), 1],
    [0, -B*root(3)/(2*root(2)), 0, 1]
])

input_matrix = orignal_point.T


#z軸旋轉矩陣
z_rotate_matrix = np.array([
    [cos(thetaz), -sin(thetaz), 0, 0],
    [sin(thetaz), cos(thetaz), 0, 0],
    [0, 0, 1, 0],
    [0, 0, 0, 1]
])


#y軸旋轉矩陣
y_rotate_matrix = np.array([
    [cos(thetay), 0, sin(thetay), 0],
    [0, 1, 0, 0],
    [-sin(thetay), 0, cos(thetay), 0],
    [0, 0, 0, 1]
])

#x軸旋轉矩陣
x_rotate_matrix = np.array([
    [1, 0, 0, 0],
    [0, cos(thetax), -sin(thetax), 0],
    [0, sin(thetax), cos(thetax), 0],
    [0, 0, 0, 1]
])

#平移矩陣
shift_matrix = np.array([
    [1, 0, 0, xc],
    [0, 1, 0, yc],
    [0, 0, 1, zc],
    [0, 0, 0, 1]
])


#投影矩陣
projection_matrix = np.array([
    [1/tan_theta_2, 0, 0, 0],
    [0, 1/tan_theta_2, 0, 0],
    [0, 0, f/(f-n), -f*n/(f-n)],
    [0, 0, 1, 0]
])


#output_matrix = projection_matrix @ shift_matrix @ x_rotate_matrix @ y_rotate_matrix @ z_rotate_matrix @ input_matrix

print("input matrix")
for row in input_matrix:
    for element in row:
        print(float_to_q1_10_10(element))

output_matrix = shift_matrix @ input_matrix

print("after shift")
for row in output_matrix:
    for element in row:
        print(float_to_q1_10_10(element))

output_matrix = projection_matrix @ output_matrix

print("after projection")
for row in output_matrix:
    for element in row:
        print(float_to_q1_10_10(element))

'''
print("output matrix")
for row in output_matrix:
    for element in row:
        print(float_to_q1_10_10(element))
'''


output_matrix = output_matrix / output_matrix[3]


'''
for row in output_matrix:
    for element in row:
        print(float_to_q1_10_10(element))
'''


import matplotlib.pyplot as plt

display_matrix = output_matrix.T

display_matrix[:,0] *= 640
display_matrix[:,1] *= 480


point_number = [
    (0, 1), (0, 2), (0, 3),
    (1, 2), (1, 3),
    (2, 3)
]

plt.figure(figsize=(6, 6))
for i, j in point_number:
    point_1, point_2 = display_matrix[i], display_matrix[j]
    plt.plot([point_1[0], point_2[0]], [point_1[1], point_2[1]], 'k-')  # 畫黑色線段

plt.scatter(display_matrix[:,0], display_matrix[:,1], color='red')  # 畫紅色點
plt.gca().set_aspect('equal')  # 確保 x 與 y 比例一致
plt.title("2D projection result")
plt.grid(True)
plt.show()
