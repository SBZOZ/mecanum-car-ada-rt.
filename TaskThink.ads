with MyBrain;
with MyMotorDriver;
with Config;

package TaskThink is
   task Think with Priority => Config.Priority_Think;
end TaskThink;
