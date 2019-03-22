![alt text](https://github.com/stug43/Open_air/blob/development/app/assets/images/air-quality-logo/logo-1-d.png "")

Open Air is a 2-week long project (March 2019) to validate *[The Hacking Project](https://www.thehackingproject.org/)* training on Ruby on Rails. 

## Value Proposition

### In short

___Challenge:___ Education & data-based Information about Air Quality
> The general public don't understand Air Quality well and can't easily find all relevant databases for their subjects of interest on this topic. 

___Solution:___ Open Air web magazine
> A web magazine where Air Quality experts write **Articles** which:
>  * follows the same **explanatory structure**: 1. Drivers 2. Pressures 3. State 4. Impacts and 5. Responses (further info below)
> * lists **all available open databases** on the topic.

This solution has been designed with [A Lab in the AIR](https://www.alabintheair.cc/), as a forerunner to the 5-years-long [Air-DIAMS](https://www.air-diams.org/) EU programme.

Therefore it focuses on the **Provence** area.


### Further insights

Air Quality is a growing concern as both **Pollution** and **Urban Population** increase. **Open data** from public authorities are available but hard to find and understand on the web in France following the 2016 regulation *Loi Lemaire*. Our challenge is to improve the general understanding on this topic so as to have better understanding on it and eventually better decisions by the general public.

Current issues are: 

1. this topic is not well **Understood**. As an example, the level fine particulate in the air cannot be understood without knowing what **drives** it (industry, transports, etc.), which **emissions** have a pressure on its levels, what its current **state** is (concentration map),  what **impact** it has (example: at which level does it become dangerous?), and what **responses** already exist to control it (example: regulations). **Drivers** **Pressure** **State** **Impact** and **Response** (*DPSIR framework*) are five dimensions of the same Air Quality phenomena.

1. Second, **data are Available** but 
   1. Hard to **find** as they are **dispersed** in several locations
   1. Hard to **read**. Many open data currently require expert software to be visualised (web data visualisation issues)

Our solution addresses 1. (Pedagogical explanations of Air Quality Issues) and 2.i (A Common place to find all relevant databases). 

Data visualisation (2.ii) is to be addressed in a future version.
 
## Installation

### Online access

An Heroku pipeline has been used for the go-live of this web magazine:
1. Production environment: [open-air-sud.herokuapp.com](open-air-sud.herokuapp.com)
2. Staging environment: [open-air-dev.herokuapp.com](open-air-dev.herokuapp.com) - connected to the `development` branch on Github

Login as an Admin with the following ID: 
* admin@admin.com 
* password: AdminAdmin

### Local Setup (Ruby on Rails app)

* Install a .env file in the root folder with AWS login info 
```
AMAZON_ACCESS_KEY_ID= 'YOUR KEY'
AMAZON_SECRET_ACCESS_KEY= 'YOUR SECRET ACCESS KEY'
AMAZON_BUCKET= 'NAME OF YOUR BUCKET'
```
* Run the following commands
```bash
bundle install
rails db:reset db:migrate db:seed
```
## Tests

* Run units and features tests with ``rspec -fd``

## Contributing

It has been designed by Nicolas Bouju, Auguste Nganta, Amine Sanhaji, Rémy Aubert and Thibaut Miquel.

Contributions are welcome.

Please [contact us](mailto:open-air@alabintheair.cc) beforehand.

## License

None.

