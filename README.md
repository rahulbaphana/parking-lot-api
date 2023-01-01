# Table of Contents
1. [Tech-stack](#tech-stack)
2. [Development](#development)
3. [Description](#description)

---
### Tech-stack
1. [Ruby 3.1.3](https://www.ruby-lang.org/en/news/2022/11/24/ruby-3-1-3-released/)
2. [Rails 7.0.4](https://rubygems.org/gems/rails/versions/7.0.4)
3. [RSpec](https://rspec.info/)
4. [Rubocop](https://rubocop.org/)
5. [CI: GitHub Actions](https://docs.github.com/en/actions)
    - Checks build passes
    - Run all tests
    - Code formatting check 
    - Code coverage check 

---
### Development:
#### 1. Build project 
```shell
bundle install
```

#### 2. Run all tests
```shell
bundle exec rspec
```

#### 3. Format
```shell
bundle exec rubocop -a
```

#### 4. Verify formatting
```shell
bundle exec rubocop
```

---
### Description:

A parking lot is a dedicated area that is intended for parking vehicles. Parking lots are
present in every city and suburban area. Shopping malls, stadiums, airports, train stations,
and similar venues often feature a parking lot with a large capacity. A parking lot can spread
across multiple buildings with multiple floors or can be in a large open area.

```
● The parking lot will allow different types of vehicles to be parked:
    ○ Motorcycles/Scooters
    ○ Cars/SUVs
    ○ Buses/Trucks
● Each vehicle will occupy a single spot and the spot size will be different for different
vehicles.
● The number of spots per vehicle type will be different for different parking lots. For
example
    ○ Motorcycles/scooters: 100 spots
    ○ Cars/SUVs: 80 spots
    ○ Buses/Trucks: 40 spots
● When a vehicle is parked, a parking ticket should be generated with the spot number
and the entry date-time.
● When a vehicle is unparked, a receipt should be generated with the entry date-time,
exit date-time, and the applicable fees to be paid.
```
---
### **Fee Models**

Different locations have different fee models. Below are a few possible models:

> #### 1. Mall

Per-hour flat fees

| Vehicle    | Fee |
|------------|-----|
| Motorcycle | 10  |
| Car/SUV    | 20  |
| Bus/Truck  | 50  |


> #### 2. Stadium

Flat rate up to a few hours and then per-hour rate. The total fee is the sum of all the previous
interval fees. No parking spots for buses/trucks at the stadium.

| Vehicle    | Interval                                | Fee                  |
|------------|-----------------------------------------|----------------------|
| Motorcycle | [0, 4) <br> [4,12) <br> [12, Infinity)  | 30 <br> 60 <br> 100  |
| Car/SUV    | [0, 4) <br> [4, 12) <br> [12, Infinity) | 60 <br> 120 <br> 200 |

As stated by the notation, the start times are inclusive and the end times are exclusive.

> #### 3. Airport

Flat rate up to one day. Then per-day rate. There is no summing up of the previous interval
fees. No parking spots for buses/trucks at the airport.

| Vehicle    | Interval                                      | Fee                          |
|------------|-----------------------------------------------|------------------------------|
| Motorcycle | [0, 1) <br> [1, 8) <br> [8, 24) <br> Each day | Free <br> 40 <br> 60 <br> 80 |
| Motorcycle | [0, 12) <br> [12, 24) <br> Each day           | 60 <br> 80 <br> 100          |

As stated by the notations, the start times are inclusive and end times are exclusive.

---
### Problem Statement

Given a parking lot with details about the vehicle types that can be parked, the number of
spots, and the fee model for the parking lot; compute the fees to be paid for the parked
vehicles when the vehicle is unparked.

##### Example 1: Small motorcycle/scooter parking lot

**Spots:**
- Motorcycles/scooters: 2 spots
- Cars/SUVs/Buses/Trucks: NA

**Fee Model:** Please refer to the [Mall fee model](#1-mall) , mentioned in the [Fee Models](#fee-models) section

Scenarios:

| Sr No | Action                                | Result                                                                                                                                              |
|-------|---------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|
| 1     | Park motorcycle                       | Parking Ticket:<br> Ticket Number: 001 <br> Spot Number: 1 <br> Entry Date-time: 29-May-2022 14:04:07                                               |
| 2     | Park scooter                          | Parking Ticket: <br> Ticket Number: 002 <br> Spot Number: 2 <br> Entry Date-time: 29-May-2022 14:44:07                                              |
| 3     | Park scooter                          | No space available                                                                                                                                  |
| 4     | Unpark scooter, ticket number 002     | Parking Receipt: <br> Receipt Number: R-001 <br> Entry Date-time: 29-May-2022 14:44:07 <br> Exit Date-time: 29-May-2022 15:40:07 <br> Fees: 10 <br> |
| 5     | Park motorcycle                       | Parking Ticket: <br> Ticket Number: 003 <br> Spot Number: 2 <br> Entry Date-time: 29-May-2022 15:59:07                                              |
| 6     | Unpark motorcycle, ticket number 001  | Parking Receipt: <br> Receipt Number: R-002 <br> Entry Date-time: 29-May-2022 14:04:07 <br> Exit Date-time: 29-May-2022 17:44:07 <br> Fees: 40 <br> |

#### Example 2: Mall parking lot

**Spots:**
- Motorcycles/scooters: 100 spots
- Cars/SUVs: 80 spots
- Buses/Trucks: 10 spots

**Fee Model:** Please refer to the [Mall fee model](#1-mall) and its examples, mentioned in the [Fee Models](#fee-models) section

Scenarios: The park and unpark steps shown in theprevious example have been skipped to
reduce the text in the problem statement.
```
● Motorcycle parked for 3 hours and 30 mins. Fees: 40
● Car parked for 6 hours and 1 min. Fees: 140
● Truck parked for 1 hour and 59 mins. Fees: 100
```

#### Example 3: Stadium Parking Lot

**Spots:**
- Motorcycles/scooters: 1000 spots
- Cars/SUVs: 1500 spots

**Fee Model:** Please refer to the [Stadium fee model](2-stadium) mentioned in the [Fee Models](#fee-models) section

Scenarios: The park and unpark steps shown in the previous example have been skipped to
reduce the text in the problem statement.
```
● Motorcycle parked for 3 hours and 40 mins. Fees: 30
● Motorcycle parked for 14 hours and 59 mins. Fees: 390.
    ○ 30 for the first 4 hours. 60 for the next 8 hours. And then 300 for the remaining duration.
● Electric SUV parked for 11 hours and 30 mins. Fees: 180.
    ○ 60 for the first 4 hours and then 120 for the remaining duration.
● SUV parked for 13 hours and 5 mins. Fees: 580.
    ○ 60 for the first 4 hours and then 120 for the next 8 hours. 400 for the remaining duration.
```

#### Example 4: Airport Parking Lot

**Spots:**
- Motorcycles/scooters: 200 spots
- Cars/SUVs: 500 spots
- Buses/Trucks: 100 spots

**Fee Model:** Please refer to the [Airport fee model](#3-airport) mentioned in the [Fee Models](#fee-models) section

Scenarios: The park and unpark steps shown in the previous example have been skipped to
reduce the text in the problem statement.

```
● Motorcycle parked for 55 mins. Fees: 0
● Motorcycle parked for 14 hours and 59 mins. Fees: 60
● Motorcycle parked for 1 day and 12 hours. Fees: 160
● Car parked for 50 mins. Fees: 60
● SUV parked for 23 hours and 59 mins. Fees: 80
● Car parked for 3 days and 1 hour. Fees: 400
```
