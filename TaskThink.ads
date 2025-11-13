with MyMotorDriver; use MyMotorDriver;
with MyBrain;       use MyBrain;

package TaskThink is
   task Think with Priority => 2; --medium priority
end TaskThink;
