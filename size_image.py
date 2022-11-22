

# 图片压缩工具


from PIL import Image

name = "phone.png" # 文件名字
size = (75,50) # 缩放大小
size1 = (1080,1080)



def resize(name, size):
    image = Image.open(name)
    image = image.resize(size, Image.ANTIALIAS)
    image.save(name)

def mirror(name):
    image = Image.open(name)
    image = image.transpose(Image.FLIP_LEFT_RIGHT)
    image.save(name)

mirror(name)




