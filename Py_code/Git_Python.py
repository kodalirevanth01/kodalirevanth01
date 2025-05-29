import turtle

t = turtle.Turtle()
t.speed(0)
turtle.bgcolor("black")
colors = ["red", "orange", "yellow", "green", "blue", "purple"]

for i in range(72):
    t.color(colors[i % 6])
    t.circle(100)
    t.left(5)

turtle.done()
