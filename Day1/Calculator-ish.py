""" A simple calculatorish program for two imputs with add(+), Minus(-), Divide(/) and Multiply(*) and the associated Simple GUI
implemented using TKinter W/o number input"""
import tkinter as tk

#project number 1 for 1 hour of code  all code written in 1 hour improvements that could be made are
#reducing double up of code for add multiple ect. add buttons i.e. 1,2,3,4 and add a full input box that can be calculated using in order traversal

class Calculator():
    def __init__(self):
        self.root = tk.Tk()  # create the main application
        canvas1 = tk.Canvas(self.root, width=400, height=200)  # store the objects
        canvas1.pack()

        self.entry1 = tk.Entry(self.root)
        canvas1.create_window(100, 60, window=self.entry1)
        self.entry2 = tk.Entry(self.root)
        canvas1.create_window(300, 60, window=self.entry2)

        label1 = tk.Label(self.root, text="Enter Two numbers")
        canvas1.create_window(200, 10, window=label1)

        label1 = tk.Label(self.root, text="Number 1")
        canvas1.create_window(100, 40, window=label1)

        label1 = tk.Label(self.root, text="Number 2", )
        canvas1.create_window(300, 40, window=label1)


        self.resultLabel = tk.Label(self.root, text="Result:")
        canvas1.create_window(280, 180, window=self.resultLabel)

        Add = tk.Button(self.root, text="Add", command=self.add)
        canvas1.create_window(100, 100, window=Add)

        Subtract = tk.Button(self.root, text="Subtract", command=self.subtract)
        canvas1.create_window(150, 100, window=Subtract)
        Multiply = tk.Button(self.root, text="Multiply", command=self.multiply)
        canvas1.create_window(250, 100, window=Multiply)
        Divide = tk.Button(self.root, text="Divide", command=self.divide)
        canvas1.create_window(300, 100, window=Divide)


        self.root.mainloop() #run the mainloop]

    def get_nums(self):
        num1 = self.entry1.get()
        num2 = self.entry2.get()
        return num1, num2

    # Function to add two numbers
    def add(self):

       num1, num2 = self.get_nums()
       result = "Result =  {}"
       self.resultLabel['text'] = result.format((int(num1) + int(num2)))


        # Function to subtract two numbers
    def subtract(self):
        num1, num2 = self.get_nums()
        result = "Result =  {}"
        self.resultLabel['text'] = result.format((int(num1) - int(num2)))


        # Function to multiply two numbers
    def multiply(self):
        num1, num2 = self.get_nums()
        result = "Result =  {}"
        self.resultLabel['text'] = result.format((int(num1) * int(num2)))


    # Function to divide two numbers
    def divide(self):
        num1, num2 = self.get_nums()
        result = "Result =  {}"
        self.resultLabel['text'] = result.format((int(num1) / int(num2)))

app=Calculator()