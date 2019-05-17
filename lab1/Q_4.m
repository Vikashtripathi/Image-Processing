I1 = imread('lenaTest1.jpg');
k1 = imfinfo('lenaTest1.jpg');
compressed_bytes_1 = k1.FileSize;
actual_bytes_1 = k1.Width * k1.Height * k1.BitDepth/8;
compression_ratio_1 = actual_bytes_1/compressed_bytes_1

I2 = imread('lenaTest2.jpg');
k2 = imfinfo('lenaTest2.jpg');
compressed_bytes_2 = k2.FileSize;
actual_bytes_2 = k2.Width * k2.Height * k2.BitDepth/8;
compression_ratio_2 = actual_bytes_2/compressed_bytes_2

I3 = imread('lenaTest3.jpg');
k3 = imfinfo('lenaTest3.jpg');
compressed_bytes_3 = k3.FileSize;
actual_bytes_3 = k3.Width * k3.Height * k3.BitDepth/8;
compression_ratio_3 = actual_bytes_3/compressed_bytes_3

I4 = imread('lenaTest4.jpg');
k4 = imfinfo('lenaTest4.jpg');
compressed_bytes_4 = k4.FileSize;
actual_bytes_4 = k4.Width * k4.Height * k4.BitDepth/8;
compression_ratio_4 = actual_bytes_4/compressed_bytes_4

error_1_1 = sqrt(immse(I1, I1))
error_1_2 = sqrt(immse(I1, I2))
error_1_3 = sqrt(immse(I1, I3))
error_1_4 = sqrt(immse(I1, I4))