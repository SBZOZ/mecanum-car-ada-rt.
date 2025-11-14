package Config is
   --Periods (in milliseconds)
   Sense_Period_ms : constant := 200;
   Think_Period_ms : constant := 100;
   Act_Period_ms   : constant := 40;

   --priorities(tasks)
   Priority_Think : constant := 3;
   Priority_Sense : constant := 2;
   Priority_Act   : constant := 1;

   --decision thresholds (in centimeters)
   Obstacle_Threshold_cm : constant := 25;
   Caution_Threshold_cm  : constant := 40;

   --Motor speeds (0..4095)
   Speed_Max    : constant := 4095;
   Speed_Fast   : constant := 3200;
   Speed_Medium : constant := 2600;
   Speed_Slow   : constant := 2000;
end Config;
