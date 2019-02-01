
import abc
class Color(metaclass=abc.ABCMeta):
    @abc.abstractmethod
    def fill_color(self):
        pass

class Shape(metaclass=abc.ABCMeta):
    def __init__(self, color):
        self.color = color

    @abc.abstractmethod
    def color_it(self):
        pass

class Rectangle(Shape):
    def __init__(self, color):
        super(Rectangle, self).__init__(color)

    def color_it(self):
        print("Rectangle filled with ", end="")
        self.color.fill_color()

class Circle(Shape):
    def __init__(self, color):
        super(Circle, self).__init__(color)

    def color_it(self):
        print("Circle filled with ", end="")
        self.color.fill_color()

class RedColor(Color):
    def fill_color(self):
        print("red color")

class BlueColor(Color):
    def fill_color(self):
        print("blue color")

 """ Adding one more impletation of class Color """        
class GreenColor(Color):
    def fill_color(self):
        print("Green color")

if __name__ == '__main__':
    s1 = Rectangle(RedColor())
    s1.color_it()

    s2 = Circle(BlueColor())
    s2.color_it()
"""this is new implementation of shape and color"""
    s3=Circle(GreenColor())
    s3.color_it()
