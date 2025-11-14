with HAL;                     use HAL;
with MicroBit.IOsForTasking;  use MicroBit.IOsForTasking;
with MicroBit.MotorDriver;    use MicroBit.MotorDriver;

package body MyMotorDriver is

   -- defining the speed levels using UInt12 (0 .. 4095)
   Speed_Max    : constant UInt12 := 4095;
   Speed_Fast   : constant UInt12 := 3200;
   Speed_Medium : constant UInt12 := 2600;
   Speed_Slow   : constant UInt12 := 2000;

   procedure DriveForward is
   begin
      Drive (Forward,  (Speed_Max, Speed_Max, Speed_Max, Speed_Max));
   end DriveForward;

   procedure DriveBackward is
   begin
      Drive (Backward, (Speed_Max, Speed_Max, Speed_Max, Speed_Max));
   end DriveBackward;

   procedure TurnLeft is
   begin
      Drive (Left,     (Speed_Max, Speed_Max, Speed_Max, Speed_Max));
   end TurnLeft;

   procedure TurnRight is
   begin
      Drive (Right,    (Speed_Max, Speed_Max, Speed_Max, Speed_Max));
   end TurnRight;

   procedure Stop is
   begin
      Drive (Stop,     (0, 0, 0, 0));
   end Stop;

   protected body MotorDriver is
      procedure SetDirection (V : Directions) is
      begin
         DriveDirection := V;
      end SetDirection;

      function GetDirection return Directions is
      begin
         return DriveDirection;
      end GetDirection;
   end MotorDriver;

end MyMotorDriver;
