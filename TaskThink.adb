with Ada.Real_Time; use Ada.Real_Time;
with MyBrain;
with MyMotorDriver;
with MicroBit.Console; use MicroBit.Console;
with MicroBit.MotorDriver; use MicroBit.MotorDriver;

package body TaskThink is

   task body Think is
      myClock : Time;
      Dist_Left, Dist_Right : Distance_CM;
      Dir : MicroBit.MotorDriver.Directions;
   begin
      loop
         myClock := Clock;

         --reads the sensor values from the protected object, which again is written from the sense task
         MyBrain.SensorData_Instance.GetMeasurements (Dist_Left, Dist_Right);

         --this is where the decision logic is, based on the thresholds defined in config.ads
         if Dist_Left > 20 and Dist_Right > 20 then
            MyMotorDriver.MotorDriver.SetDirection (Forward);
         elsif Dist_Left < 10 and Dist_Right < 10 then
            MyMotorDriver.MotorDriver.SetDirection (Backward);
         elsif Dist_Left < 10 or Dist_Right < 10 then
            MyMotorDriver.MotorDriver.SetDirection (Stop);
         elsif Dist_Left < Dist_Right then
            MyMotorDriver.MotorDriver.SetDirection (Left);
         else
            MyMotorDriver.MotorDriver.SetDirection (Right);
         end if;

         --I also included a debug print here to see the sensor values and the decision made
         Put_Line ("Left=" & Distance_CM'Image(Dist_Left) &
                  " Right=" & Distance_CM'Image(Dist_Right));

         Dir := MyMotorDriver.MotorDriver.GetDirection;
         Put_Line ("Decision: " & MicroBit.MotorDriver.Directions'Image (Dir));

         delay until myClock + Milliseconds (100); --(100 ms period)
      end loop;
   end Think;

end TaskThink;
