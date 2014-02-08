#JPG Lorem Pixel
This is a simple wrapper to the Lorem Pixel website.

Using this, it's possible to get image URLs with the .jpg extension, needed for uploaders such as Carrierwave.

A live version is available [here!](http://jpg-lorem-pixel.herokuapp.com)

##Usage
Getting a random 300x300 image:
`http://jpg-lorem-pixel.herokuapp.com/image/300/300/`

Getting a random 400x250 .jpg image:
`http://jpg-lorem-pixel.herokuapp.com/image/300/300/.jpg`

Getting a random 150x150 .jpg image of people:
`http://jpg-lorem-pixel.herokuapp.com/peolpe/150/150/`

###Available categories
* abstract
* animals
* business
* cats
* city
* food
* nightlife
* fashion
* people
* nature
* sports
* technics
* transport

##Setup
1. Clone de repository
`git clone git@github.com:barboza/jpg_lorem_pixel.git`
2. Install bundler
`gem install bundler`
3. Install all the dependencies from Gemfile
`bundle install`
4. Run the app
`ruby jpg_lorem_pixel.rb`

##Contributing
1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request

#License
Licensed under the MIT license (see MIT-LICENSE file)

