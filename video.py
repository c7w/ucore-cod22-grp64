import cv2
cap = cv2.VideoCapture('./input.mp4')
with open('./video.bin', 'wb') as video:
    for idx in range(300):
        print(idx)
        ret, frame = cap.read()
        for _ in range(300):
            video.write(b'\x00')
        for line in range(72):
            for row in range(100):
                pixels = (frame[line * 2][row * 2 + 28], frame[line * 2 + 1][row * 2 + 28], frame[line * 2][row * 2 + 29], frame[line * 2 + 1][row * 2 + 29])
                blue = pixels[0][0] / 4 + pixels[1][0] / 4 + pixels[2][0] / 4 + pixels[3][0] / 4
                green = pixels[0][1] / 4 + pixels[1][1] / 4 + pixels[2][1] / 4 + pixels[3][1] / 4
                red = pixels[0][2] / 4 + pixels[1][2] / 4 + pixels[2][2] / 4 + pixels[3][2] / 4
                video.write((((int(red) >> 5) << 5) + ((int(green) >> 5) << 2) + (int(blue) >> 6)).to_bytes(1, byteorder='big'))
        ret, frame = cap.read()
        ret, frame = cap.read()
        for _ in range(300):
            video.write(b'\x00')
        for line in range(72):
            for row in range(100):
                pixels = (frame[line * 2][row * 2 + 28], frame[line * 2 + 1][row * 2 + 28], frame[line * 2][row * 2 + 29], frame[line * 2 + 1][row * 2 + 29])
                blue = pixels[0][0] / 4 + pixels[1][0] / 4 + pixels[2][0] / 4 + pixels[3][0] / 4
                green = pixels[0][1] / 4 + pixels[1][1] / 4 + pixels[2][1] / 4 + pixels[3][1] / 4
                red = pixels[0][2] / 4 + pixels[1][2] / 4 + pixels[2][2] / 4 + pixels[3][2] / 4
                video.write((((int(red) >> 5) << 5) + ((int(green) >> 5) << 2) + (int(blue) >> 6)).to_bytes(1, byteorder='big'))
        ret, frame = cap.read()
        ret, frame = cap.read()