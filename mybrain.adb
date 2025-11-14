package Config is
   -- Periods (in milliseconds)
   Sense_Period_ms : constant := 200;
   Think_Period_ms : constant := 100;
   Act_Period_ms   : constant := 40;

   -- Priorities (tasks)
   Priority_Think : constant := 3;
   Priority_Sense : constant := 2;
   Priority_Act   : constant := 1;

   -- Decision thresholds (in centimeters)
   Obstacle_Threshold_cm : constant := 25;
   Caution_Threshold_cm  : constant := 40;

   -- Valid reading range for ultrasonic sensors
   Min_Valid_Distance_cm : constant := 2;    -- below this likely noise
   Max_Valid_Distance_cm : constant := 400;  -- sensor max range

   -- Treat zero as invalid reading (typical for no echo)
   Freshness_Timeout_ms : constant := 300;

   -- Motor speeds (0..4095) - kept here for reference, Act uses directions only
   Speed_Max    : constant := 4095;
   Speed_Fast   : constant := 3200;
   Speed_Medium : constant := 2600;
   Speed_Slow   : constant := 2000;
end Config;
