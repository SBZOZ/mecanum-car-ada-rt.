with MyMotorDriver; use MyMotorDriver;
with Config;

package TaskAct is
   task Act with Priority => Config.Priority_Act;
end TaskAct;
