with Ada.Real_Time;    use Ada.Real_Time;
with MicroBit;         use MicroBit;
with MicroBit.Ultrasonic;
with MicroBit.Console; use MicroBit.Console;
with MyBrain;
with Config;

package body TaskSense is
   task body Sense is
      myClock : Time;

      package Sensor_Left  is new MicroBit.Ultrasonic (MB_P13, MB_P1);
      package Sensor_Right is new MicroBit.Ultrasonic (MB_P12, MB_P0);

      Dist_Left, Dist_Right : MyBrain.Distance_CM;
   begin
      loop
         myClock := Clock;

         Dist_Left  := MyBrain.Distance_CM (Sensor_Left.Read);
         Dist_Right := MyBrain.Distance_CM (Sensor_Right.Read);

         Put_Line ("Sense: L=" & Integer'Image (Integer (Dist_Left)) &
                  " R=" & Integer'Image (Integer (Dist_Right)));

         MyBrain.SensorData_Instance.SetMeasurements (Dist_Left, Dist_Right);

         delay until myClock + Milliseconds (Config.Sense_Period_ms);
      end loop;
   end Sense;
end TaskSense;
