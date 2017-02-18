# BioloidMatlab
Matlab interface for Dynamixel motors and Bioloid robots (humanoid)

# About
This is a small toolbox used for controlling Bioloid humanoid robot. It is for a direct
USB control of the motors, assuming you have USB2Dynamixel or any other Serial-USB adapter.

# Usage
Copy the whole directory +hw to your current Matlab directory. Matlab recognises
all the directories that are written as +dir as structures with functions inside, 
so you can use dir.function() at the Matlab console.

First choose serial port number - 0,1,2,... for linux /dev/ttyUSB0, 1, etc., for Windows
5,6,7,8 for COM5, COM6, ... ans so on.

```matlab
hw.start( 0 )
```

This initialises the serial COM port for the USB2Dynamixel, now if you have a motor (let's say number 13)
you can move it to the zero position:
```matlab
hw.set_position( 13, 0 )
```
function set_position works in radians, so the usual permitted range for standard AX-12 would
 be -2.61...2.61 (the Murata SV-01 potentiometer has the range of about 300 degrees). To retrieve a current position:
```matlab
hw.get_position( 13 )
```
and to switch off the internal PID control for a moment:
```matlab
hw.set_off( 13 )
```
If you want to limit the speed of one of the motors you can use
hw.set_speed( 13, 0.1 )
which limits the max speed to 10% (parameter range 0=0%, 1=100%).

If you would like to switch between closed loop PID-controlled joint mode and open-loop (servo behaves like a wheel
then, but still can read the positions during movement! in other words: you control the PWM of the H-bridge on the DC motor controller)
```matlab
hw.set_mode_joint( 13 )
hw.set_position( 13, 0 )
pause(0.3)
hw.set_mode_wheel( 13 )
hw.set_speed( 13, -0.25 )
```
set_speed() now controls the PWM on the motor, remember that now you can move forward and backwards (-1.0 ... 1.0 )

get_pose() and set_pose() reads the current pose of a humanoid robot, including a little offset for hips so they don't
collide if you accidentally push zeros to all joints.

Have fun!

# Bugs
For some older Matlabs inside the start.m the function computer() that recognises the
architecture must be computer('arch').

## bug: computer('arch')
The architecture detection has changed the syntax, the correct one now is just computer(), fixed.


# License Warning
All the files inside specific architectures belong to the official Robotis Bioloid development
tools. For newer version fetch the ones from their SDKs.