import coppeliasim_zmqremoteapi_client as zmq
import time

client = zmq.RemoteAPIClient()
sim = client.getObject('sim')

left_finger = sim.getObject('/YuMiGripper/leftFinger_visible')
right_finger = sim.getObject('/YuMiGripper/rightFinger_visible')
sensor = sim.getObject('/proximitySensor')
point = sim.getObject('/YuMiGripper/attachPoint')

def open():
    sim.setObjectPosition(left_finger, point, [0.02, 0., 0])
    sim.setObjectPosition(right_finger, point, [-0.02, 0, 0])
    

def close():
    sim.setObjectPosition(left_finger, point, [0, 0, 0])
    sim.setObjectPosition(right_finger, point, [0, 0, 0])
    

open()
windows = True

while windows:
    detected, distance, detected_point, detected_object_handle, normal_vector = sim.readProximitySensor(sensor)

    if detected and distance < 0.2:
        close()
        time.sleep(3)
        open()
        
    else:
        open()

    print(distance)
    time.sleep(0.1)

