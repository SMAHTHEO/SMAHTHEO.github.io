
image_win = Image.open(r"winner.png")
bg = ImageTk.PhotoImage(image_win)
app.canvas.create_image(0,0,anchor = "nw",image = bg)
