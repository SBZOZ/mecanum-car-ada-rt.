package MyBrain is
   type Distance_CM is new Integer range 0 .. 400;

   protected type SensorData is
      procedure SetMeasurements (Left, Right : Distance_CM);
      procedure GetMeasurements (Left, Right : out Distance_CM);
   private
      Left_Dist  : Distance_CM := 0;
      Right_Dist : Distance_CM := 0;
   end SensorData;
   SensorData_Instance  : SensorData;
end MyBrain;
