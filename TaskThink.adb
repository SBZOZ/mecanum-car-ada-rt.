with Ada.Real_Time;            use Ada.Real_Time;
with MyBrain;                  use MyBrain;
with MyMotorDriver;
with MicroBit.Console;         use MicroBit.Console;
with MicroBit.MotorDriver;     use MicroBit.MotorDriver;
with Config;

package body TaskThink is
   task body Think is
      myClock                               : Time;
      Dist_Left, Dist_Right                 : MyBrain.Distance_CM;
      Dir                                   : MicroBit.MotorDriver.Directions;
      Fresh                                 : Boolean;
      Timeout                               : Duration := Duration (Config.Freshness_Timeout_ms) / 1000.0;
   begin
      loop
         myClock := Clock;

         -- Read sensor values
         MyBrain.SensorData_Instance.GetMeasurements (Dist_Left, Dist_Right);

         -- Freshness check
         Fresh := (Clock - MyBrain.SensorData_Instance.Last_Update) < Milliseconds (Config.Freshness_Timeout_ms);

         if not Fresh then
            MyMotorDriver.MotorDriver.SetDirection (MicroBit.MotorDriver.Stop);
            Put_Line ("Decision: STOP (stale data)");
         else
            -- Obstacle decision using Config thresholds
            if Dist_Left <= Config.Obstacle_Threshold_cm
               or Dist_Right <= Config.Obstacle_Threshold_cm
            then
               MyMotorDriver.MotorDriver.SetDirection (MicroBit.MotorDriver.Stop);
               Put_Line ("Decision: STOP (obstacle)");
            elsif Dist_Left <= Config.Caution_Threshold_cm
                  and then Dist_Right > Dist_Left
            then
               -- Obstacle is nearer on the left: turn away (right)
               MyMotorDriver.MotorDriver.SetDirection (MicroBit.MotorDriver.Right);
               Put_Line ("Decision: Right (away from left obstacle)");
            elsif Dist_Right <= Config.Caution_Threshold_cm
                  and then Dist_Left > Dist_Right
            then
               -- Obstacle is nearer on the right: turn away (left)
               MyMotorDriver.MotorDriver.SetDirection (MicroBit.MotorDriver.Left);
               Put_Line ("Decision: Left (away from right obstacle)");
            else
               -- Clear path: go forward
               MyMotorDriver.MotorDriver.SetDirection (MicroBit.MotorDriver.Forward);
               Put_Line ("Decision: Forward (clear)");
            end if;
         end if;

         -- Debug snapshot
         Dir := MyMotorDriver.MotorDriver.GetDirection;
         Put_Line ("Think: L=" & Distance_CM'Image (Dist_Left) &
                   " R=" & Distance_CM'Image (Dist_Right) &
                   " Fresh=" & Boolean'Image (Fresh) &
                   " -> " & MicroBit.MotorDriver.Directions'Image (Dir));

         delay until myClock + Milliseconds (Config.Think_Period_ms);
      end loop;
   end Think;
end TaskThink;
