from flask import Flask, render_template, url_for
import client
from imdb import IMDb
from random import seed
from random import randint
import time

app = Flask(__name__)

# create an instance of the IMDb class
ia = IMDb()

# movie database
movieList = ['0034583', '0332280', '2350496', '0031381', '0314331', '3783958', '5726616', '7653254', '0414387', '0783233', '2194499'
            , '1045658', '2980516', '2608224', '0314331', '0446029', '0110322', '2381111', '1570728', '1980929', '0362227', '1193138']

seed(time)

# homepage
@app.route("/")
@app.route("/home")
def home():
    return render_template('home.html')

# movie page
@app.route("/movie")
def movie():
    index = randint(0,22)

    # get movie info
    movie = ia.get_movie(movieList[index])
    movieTitle = movie['long imdb title']
    movieTitle = str(movieTitle)
    titleList = movieTitle.split("(")
    link = client.connect(titleList[0])

    # parse to variables
    title = movie['long imdb title']
    rating = movie['rating']
    plot = movie['plot outline']
    runtime = movie['runtimes']
    cover = movie['full-size cover url']
    
    return render_template('movie.html', link = link, title = title, rating = rating, plot = plot, runtime = runtime, cover = cover)

if __name__ == '__main__':
    app.run(debug=True)