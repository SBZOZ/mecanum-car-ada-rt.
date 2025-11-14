with Ada.Real_Time;

package body MyBrain is
   protected body SensorData is
      procedure SetMeasurements (Left, Right : Distance_CM) is
      begin
         Left_Dist   := Left;
         Right_Dist  := Right;
         Update_Time := Ada.Real_Time.Clock;
      end SetMeasurements;

      procedure GetMeasurements (Left, Right : out Distance_CM) is
      begin
         Left  := Left_Dist;
         Right := Right_Dist;
      end GetMeasurements;

      function Last_Update return Ada.Real_Time.Time is
      begin
         return Update_Time;
      end Last_Update;
   end SensorData;
end MyBrain;
