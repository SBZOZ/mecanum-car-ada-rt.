with Ada.Real_Time;

package MyBrain is
   type Distance_CM is new Integer range 0 .. 400;

   protected type SensorData is
      procedure SetMeasurements (Left, Right : Distance_CM);
      procedure GetMeasurements (Left, Right : out Distance_CM);
      function Last_Update return Ada.Real_Time.Time;
   private
      -- Initialize to safe "far" values to avoid startup STOP
      Left_Dist   : Distance_CM := 400;
      Right_Dist  : Distance_CM := 400;
      Update_Time : Ada.Real_Time.Time := Ada.Real_Time.Clock;
   end SensorData;

   SensorData_Instance : SensorData;
end MyBrain;
