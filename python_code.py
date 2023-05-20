import time
import Adafruit_DHT
import firebase_admin
from firebase_admin import credentials
from firebase_admin import db

# Fetch the service account key JSON file contents
cred = credentials.Certificate('smart-aircond.json')

# Initialize the app with a service account, granting admin privileges
firebase_admin.initialize_app(cred, {
    'databaseURL': 'https://smart-aircond-default-rtdb.firebaseio.com/'
})

# Get a reference to the database service
ref = db.reference('/')

# Set the temperature threshold for turning on the air conditioner
temperature_threshold = 30

# Function to get the current temperature from the sensor
def get_temperature():
    humidity, temperature = Adafruit_DHT.read_retry(11, 4)  # DHT11 sensor connected to GPIO pin 4
    return temperature

# Function to check the temperature and update the air conditioner status in Firebase
def check_temperature():
    temperature = get_temperature()
    if temperature >= temperature_threshold:
        set_ac_status(True)
    else:
        set_ac_status(False)

# Function to get the current air conditioner status from Firebase
def get_ac_status():
    return ref.child('ac_status').get()

# Function to turn the air conditioner on or off in Firebase
def set_ac_status(status):
    ref.child('ac_status').set(status)

# Run the temperature check every 10 seconds
while True:
    check_temperature()
    time.sleep(10)
