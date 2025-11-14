pragma Ada_2012;
pragma Profile (Ravenscar);

with Ada.Real_Time;    use Ada.Real_Time;
with MicroBit.Console; use MicroBit.Console;
with TaskSense;
with TaskThink;
with TaskAct;

procedure Main is
begin
   Put_Line ("Car system starting...");

   -- Tasks run concurrently automatically
   loop
      delay until Clock + Milliseconds (1000);
   end loop;
end Main;
