# article-search

*article-search* is a Single Page App that searches the SCPR API (v3) for articles and returns the article titles as well as 10 second clips of any associated audio files.

The api (search-api/) was built on Rails using the --api flag, which avoids most of the frontend views that usually gets generated with Rails' generators.  None of those views are necessary in this case since the frontend is all AngularJS.

The client (client/) is an AngularJS app.  All app related tasks from testing to running a frontend server to a fullstack server can be done thru gulp tasks.


## Dependencies

* Rails 5
* Postgres
* Angular JS


## Usage

1. Install [Rails](https://github.com/rails/rails):
    ```
    $ gem install rails
    ```
2. Install [npm](http://blog.npmjs.org/post/85484771375/how-to-install-npm)
3. Install [gulp](https://github.com/gulpjs/gulp/blob/master/docs/getting-started.md)
    ```
    $ npm install --global bower gulp-cli
    ```
4. Install required gems (in the `search-api/` directory):
    ```
    $ bundle install
    ```
5. Go to the `client/` directory
6. Install bower dependencies
    ```
    $ bower install
    ```
7. To run the fullstack app (in the `client/` directory):
    ```
    $ gulp serve:full-stack
    ```
6. To run the rails app (`search-api/` directory):
    ```
    $ rails s
    ```
7. To run backend tests (`search-api/` directory):
    ```
    $ rspec
    ```
8. To run frontend tests (`client/` directory):
    ```
    $ gulp test
    ```


## Assumptions

* Audio files returned by SCPR api are in mp3 format.
* Article ID's are unique


## License

The MIT License (MIT)
Copyright (c) 2016 Lu Yi Louise Yang

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.