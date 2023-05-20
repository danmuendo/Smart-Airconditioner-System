# Smart Air Conditioner System

This is a simple system that allows you to monitor and control your air conditioner remotely. It consists of two main components:

- A temperature sensor connected to a Raspberry Pi, which measures the temperature in the room.
- A user interface running on your computer, which allows you to view the current temperature and turn the air conditioner on or off.

# Requirements
To run the temperature sensor component, you will need:

-A Raspberry Pi with GPIO pins
-A DHT11 or DHT22 temperature and humidity sensor
-Adafruit DHT library
-Firebase Realtime Database
-To run the user interface component, you will need:
-
-A computer with Python 3 installed
-Firebase Realtime Database
You can install the necessary Python packages by running:

Copy code
pip3 install -r requirements.txt

# Installation
Connect the DHT11 or DHT22 sensor to the Raspberry Pi according to the pinout diagram in the code.
Create a Firebase project and download the service account key JSON file.
Update the cred = credentials.Certificate('smart-aircond.json') line in the smart_aircond.py script to point to your service account key JSON file.
Update the temperature_threshold variable in the python_code.py script to the desired temperature threshold for turning on the air conditioner.
Run the smart_aircond.py script on the Raspberry Pi to start monitoring the temperature.
Usage
Run the cpp_code.cpp script on your computer to launch the user interface.
The current temperature and air conditioner status will be displayed.
To turn on or off the air conditioner, select the corresponding option from the menu.
You can also exit the program by selecting the "Exit" option from the menu.

# Future Improvements
Some potential improvements to this system include:

-Adding support for multiple temperature sensors to monitor different rooms.
-Adding support for scheduling the air conditioner to turn on or off at specific times.
-Adding support for controlling the air conditioner remotely through a mobile app.
-Acknowledgements
-This system was created with the help of the Adafruit DHT library and the Firebase Realtime Database.

To integrate these two sets of codes, you would need to modify the Python script to update the temperature and air conditioner status in the Firebase database whenever the temperature or air conditioner status changes from the user interface. You can use Firebase's Realtime Database Triggers to automatically execute a Cloud Function when the database is updated and then use the Cloud Function to send a command to the Raspberry Pi to turn the air conditioner on or off.

You would also need to modify the QML script to read the temperature and air conditioner status from the Firebase database and update the user interface accordingly. You can use Firebase's Realtime Database API to read data from the database and update the user interface when the data changes.