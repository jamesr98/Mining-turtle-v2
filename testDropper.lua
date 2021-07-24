local dropper = require "dropper"

print("T1: Attempting to detect chest...")
if (dropper.isChestBelow()) then
    print("T1: Correct chest detected below.")
else
    print("T1: Failed to find chest below.")
end

print("---")

print("T2: Dropping off at chest...")
dropper.dropOff()
print("T2: Manually check contents of chest. ")