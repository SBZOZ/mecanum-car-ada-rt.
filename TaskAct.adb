with Ada.Real_Time;    use Ada.Real_Time;
with MyMotorDriver;    use MyMotorDriver;
with MicroBit.Console; use MicroBit.Console;
with MicroBit.MotorDriver; use MicroBit.MotorDriver;
with Config;

package body TaskAct is
   task body Act is
      myClock : Time;
      Dir     : MicroBit.MotorDriver.Directions;
   begin
      loop
         myClock := Clock;

         Dir := MyMotorDriver.MotorDriver.GetDirection;

         case Dir is
            when Forward       => DriveForward;
            when Backward      => DriveBackward;
            when Left          => TurnLeft;
            when Right         => TurnRight;
            when Stop          => Stop;
            when others        => Stop;  --catch all other directions (as defauly for safety)
         end case;

         Put_Line ("Acting on: " & Directions'Image (Dir));

         delay until myClock + Milliseconds (Config.Act_Period_ms);
      end loop;
   end Act;
end TaskAct;
