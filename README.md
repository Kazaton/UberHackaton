# Uber Global Hackathon Project - Universal Bus Solution

## Team: "Kazaton"
- Danial Iskakov (danial_ikar@mail.ru)
- Arsen Argandykov (doldboy@gmail.com)
- Miras Umyrzak (aituaraferist7b@gmail.com)
- Abylaikhan Mauyenov (abylaikhanmauyenov@gmail.com)

## Year: 2023

### Problem
Buses have become one of the most popular forms of transportation, but they often suffer from overcrowding, leading to inconvenience for passengers, especially those with special needs. Additionally, passengers are often unsure when their bus will arrive due to a lack of precise schedules and route-tracking apps.

### User Requirements
- **Bus Route and Map Interface**: Display a real-time map showing all active bus routes and their current locations.
- **Bus Schedule Tracking**: Monitor each bus according to its schedule and provide real-time updates for any delays or early arrivals.
- **Occupancy Monitoring**: Show the number of passengers on each bus, updated through QR code payment scanning.
- **Seat Availability**: Display the number of available seats in real-time.
- **Accessibility Notifications**: Alert passengers when a person with disabilities enters the bus to encourage offering them a seat.
- **Ticket Evidence**: Provide a special window after paying for a ticket that passengers can show to the bus conductor.
- **Special Needs Evidence**: After scanning a QR code, people with special needs will receive a window indicating their right to a special seat.

### Introduction of the Application
In today's fast-paced world, it's essential to use your time efficiently and be environmentally conscious. Our application aims to revolutionize the way you interact with public transportation, particularly buses.

**Account Registration and Login**: Users start by registering an account or logging in if they already have one. This is necessary to save their data and enhance the app's convenience.

**Bus Information**: The app provides comprehensive information about bus routes, allowing users to make informed decisions. Users can view precise data on a map showing the buses' real-time locations.

**Passenger Count and Special Needs**: The app also displays the current number of passengers on each bus, providing users with insights into bus occupancy. Special needs passengers can check the availability of designated seats.

**Innovative Payment System**: We've replaced the traditional bus payment method with an innovative system. Users can obtain bus tickets online by scanning special QR codes on buses. The fare will be deducted from the user's attached payment card.

**Ticket and Special Needs Proof**: After payment, users receive a digital ticket to show to the bus conductor. Passengers with special needs receive a digital certificate confirming their conditions and their right to a special seat.

### Explanation of Frontend and Backend
**Frontend**: Our frontend is built using Flutter and Dart programming language. The application consists of several screen types based on their function.

1. **Authorization Screens**:
   - `login_block`: Allows existing users to log in.
   - `registration_block`: For new users to register. Collects user information and handles errors.

2. **Main Functionality Screens**: These screens provide access to the app's core features, including bus routes, real-time maps, passenger counts, and special needs options.

**Backend**: Our backend is build on the Python's framework - Django

1. We use `djangorestframework` to control requests in our system. It also makes easier to create stable server API.
2. To provide security we use  `simple-jwt tokens`. Those tokens keep users signup in the app, keeping their data encrypted. Also they update every 5 minutes, which makes this type of security even stronger
3. To connect with frontend we send our data via `serializers`, whick converts python data to JSON.
4. To save the data about users and buses we used `sqlite3 database`, which is a basis of django. We created models of Bus, BusType and User and stored the info using the typification of these models.

### Results and Projection of App Usage
The application is expected to significantly improve the efficiency and convenience of using public buses. Users will be able to make informed decisions about their bus routes, access real-time information on bus locations, and benefit from an innovative payment system. Passengers with special needs will have their rights protected, and other passengers will be encouraged to offer them seats. Overall, the "Universal Bus Solution" aims to enhance the bus travel experience for all passengers while promoting a more eco-friendly mode of transportation.
