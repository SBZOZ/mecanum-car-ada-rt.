with MyMotorDriver; use MyMotorDriver;

package TaskAct is
   task Act with Priority => 3; --highest priority, to avoid lagging in the car
end TaskAct;
