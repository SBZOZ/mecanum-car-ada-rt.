with MicroBit.MotorDriver;

package MyMotorDriver is
   use MicroBit.MotorDriver;

   procedure DriveForward;
   procedure DriveBackward;
   procedure TurnLeft;
   procedure TurnRight;
   procedure Stop;

   protected MotorDriver is
      function GetDirection return Directions;
      procedure SetDirection (V : Directions);
   private
      DriveDirection : Directions := Stop;
   end MotorDriver;
end MyMotorDriver;
