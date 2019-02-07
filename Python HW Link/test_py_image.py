import tkinter as tk
import time
from tkinter import Label
from PIL import ImageTk
from PIL import Image
#from tkinter import *

class SimpleApp(object):
    def __init__(self, master, filename, **kwargs):
        self.master = master
        self.filename = filename
        self.canvas = tk.Canvas(master, width=1000, height=1000)

        self.canvas.pack()

        self.update = self.draw().__next__
        master.after(2000, self.update)

    def draw(self):
        image = Image.open(self.filename)
        image2 = Image.open("HSI Outline.png")

        angle = 0
        while True:
            #canvas_obj = self.canvas.create_rectangle(0,0,20,20,fill='red')

            
            tkimage = ImageTk.PhotoImage(image.rotate(angle))
            tkimage2 = ImageTk.PhotoImage(image2)
            canvas_obj = self.canvas.create_image(500, 526, image=tkimage)
            canvas_obj = self.canvas.create_image(500,500, image=tkimage2)

            circlediameter = 20
            xcentreline = 490
            x=xcentreline - (circlediameter/2)
            xwidth = circlediameter
            
            ycentreline = 525
            y=ycentreline - (circlediameter/2)
            yheight=circlediameter
            canvas_obj = self.canvas.create_oval(x,y,x+xwidth,y+yheight,fill='yellow')
          
            # canvas_obj = self.canvas.create_oval(100,100,400,400,fill='green')

            self.master.after_idle(self.update)
            
            yield

            self.canvas.delete(canvas_obj)
            angle += 1
            angle %= 360

root = tk.Tk()
app = SimpleApp(root, 'HSI copy 2.png')
root.mainloop()
