#include <Arduino.h>
#include <DigiMouse.h>

// 50 seconds
#define UPDATE_INTERVAL 50*1000
unsigned long timer;

void setup() {
  DigiMouse.begin();
  timer = 0;
}

void loop() {
    DigiMouse.delay(24);
    DigiMouse.move(1,1, 0);
    DigiMouse.delay(24);
    DigiMouse.move(-1,-1, 0);
    DigiMouse.delay(UPDATE_INTERVAL);
}
