with Ada.Real_Time;    use Ada.Real_Time;
with MyBrain;          use MyBrain;
with MyMotorDriver;
with MicroBit.Console; use MicroBit.Console;
with MicroBit.MotorDriver; use MicroBit.MotorDriver;
with Config;

package body TaskThink is
   task body Think is
      myClock : Time;
      Dist_Left, Dist_Right : MyBrain.Distance_CM;
      Dir : MicroBit.MotorDriver.Directions;
   begin
      loop
         myClock := Clock;

         -- Read sensor values
         MyBrain.SensorData_Instance.GetMeasurements (Dist_Left, Dist_Right);

         -- Decision logic
         if Dist_Left > 20 and Dist_Right > 20 then
            MyMotorDriver.MotorDriver.SetDirection (MicroBit.MotorDriver.Forward);
         elsif Dist_Left < 10 and Dist_Right < 10 then
            MyMotorDriver.MotorDriver.SetDirection (MicroBit.MotorDriver.Backward);
         elsif Dist_Left < 10 or Dist_Right < 10 then
            MyMotorDriver.MotorDriver.SetDirection (MicroBit.MotorDriver.Stop);
         elsif Dist_Left < Dist_Right then
            MyMotorDriver.MotorDriver.SetDirection (MicroBit.MotorDriver.Left);
         else
            MyMotorDriver.MotorDriver.SetDirection (MicroBit.MotorDriver.Right);
         end if;

         -- Debug print
         Dir := MyMotorDriver.MotorDriver.GetDirection;
         Put_Line ("Decision: " & MicroBit.MotorDriver.Directions'Image (Dir));

         delay until myClock + Milliseconds (Config.Think_Period_ms);
      end loop;
   end Think;
end TaskThink;
