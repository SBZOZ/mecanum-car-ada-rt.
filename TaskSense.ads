with MyBrain; use MyBrain;
with Config;

package TaskSense is
   task Sense with Priority => Config.Priority_Sense;
end TaskSense;
