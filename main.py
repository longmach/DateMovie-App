from flask import Flask, render_template, url_for
import client
from imdb import IMDb
from random import seed
from random import randint
import time

app = Flask(__name__)

# create an instance of the IMDb class
ia = IMDb()

movieList = ['0034583', '0332280', '2350496', '0031381', '0314331']

seed(time)

@app.route("/")
@app.route("/home")
def home():
    return render_template('home.html')


@app.route("/movie")
def movie():
    index = randint(0,4)

    movie = ia.get_movie(movieList[index])
    movieTitle = movie['long imdb title']
    movieTitle = str(movieTitle)
    titleList = movieTitle.split("(")
    #print(titleList)
    link = client.connect(titleList[0])

    #print(sorted(movie.keys()))

    title = movie['long imdb title']
    rating = movie['rating']
    plot = movie['plot outline']
    runtime = movie['runtimes']
    cover = movie['full-size cover url']
    return render_template('movie.html', link = link, title = title, rating = rating, plot = plot, runtime = runtime, cover = cover)
    #return render_template('movie.html', title = title, rating = rating, plot = plot, runtime = runtime, cover = cover)
if __name__ == '__main__':
    app.run(debug=True)