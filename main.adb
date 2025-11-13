pragma Ada_2012;

with MicroBit.Console; use MicroBit.Console;
with MicroBit.Ultrasonic;
with Ada.Real_Time; use Ada.Real_Time;
with MicroBit; use MicroBit;

procedure Main is
   package Sensor is new MicroBit.Ultrasonic (MB_P14, MB_P16); -- adjust pins to your wiring
   Distance : Integer;
begin
--testing if the loop works
   Put_Line ("Sensor test starting...");
   loop
      Distance := Sensor.Read;
      Put_Line ("Distance=" & Integer'Image (Distance));
      delay until Clock + Milliseconds (200);
   end loop;
end Main;
