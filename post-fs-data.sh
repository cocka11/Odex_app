#!/system/bin/sh

MODDIR=${0%/*}
SCRIPT="$MODDIR/system/bin/boot_script.sh"
SCRIPT_init="$MODDIR/system/etc/init.d"
POWER_SAVER="$MODDIR/system/bin/disable_power_save.sh"
POWER_SAVER="$MODDIR/system/bin/enable_power_save.sh"
    chown 0:0 "$POWER_SAVER"
    chmod 755 "$POWER_SAVER"

for PERM in "$SCRIPT_init"/*; do
    chown 0:0 "$PERM"
    chmod 755 "$PERM"
done

# Check if the script exists
if [ -f "$SCRIPT" ]; then
    # Change ownership and check for errors
    chown 0:0 "$SCRIPT"
    # Change permissions and check for errors
    chmod 775 "$SCRIPT"
    sh "$SCRIPT"
fi
