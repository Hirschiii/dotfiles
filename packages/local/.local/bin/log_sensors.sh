#!/bin/bash

# Pfad zur Logdatei
LOGFILE="$HOME/projects/lenovo/powermanagement/test/sensordaten-25-10-27.log"
INTERVAL=30

# Optional: Header zur Datei hinzufügen, falls sie leer ist
if [ ! -f "$LOGFILE" ] || [ ! -s "$LOGFILE" ]; then
    echo "timestamp,cpu_temp,gpu_temp,fan_speed_cpu,cpu_usr,cpu_idle" >> "$LOGFILE"
fi

while true; do
	# Zeitstempel
	TIMESTAMP=$(date +%s) # Unix-Timestamp
	echo "Writeing on timestamp: $TIMESTAMP"

	SENSORS_OUTPUT=$(sensors)
	MPSTAT_OUTPUT=$(mpstat -P ALL)
	# Sensordaten erfassen und parsen
	# Die genauen Bezeichnungen können je nach Hardware variieren!
	# Passe die 'grep' und 'awk' Befehle an deine 'sensors'-Ausgabe an.

	# Beispiel: CPU Temperatur (k10temp oder coretemp)
	CPU_TEMP=$(echo "$SENSORS_OUTPUT" | grep "CPU:" | head -n 1 | awk '{print $2}' | sed 's/+//;s/°C//')

	# Beispiel: Eine andere Temperatur (z.B. Mainboard Temperatur)
	GPU_TEMP=$(echo "$SENSORS_OUTPUT" | grep "GPU:" | head -n 1 | awk '{print $2}' | sed 's/+//;s/°C//')

	# Beispiel: CPU Lüftergeschwindigkeit (nct6796 oder ähnliches)
	FAN_SPEED_CPU=$(echo "$SENSORS_OUTPUT" | grep "fan1:" | head -n 1 | awk '{print $2}')

	CPU_USR=$(echo "$MPSTAT_OUTPUT" | grep all | awk '{print $3}')
	CPU_IDLE=$(echo "$MPSTAT_OUTPUT" | grep all | awk '{print $12}')



	# Prüfen, ob die Variablen Werte haben, ansonsten "NaN" (Not a Number) setzen
	[ -z "$CPU_TEMP" ] && CPU_TEMP="NaN"
	[ -z "$FAN_SPEED_CPU" ] && FAN_SPEED_CPU="NaN"
	[ -z "$OTHER_TEMP" ] && OTHER_TEMP="NaN"

	# Daten in die Logdatei schreiben
	echo "$TIMESTAMP,$CPU_TEMP,$GPU_TEMP,$FAN_SPEED_CPU,$CPU_USR,$CPU_IDLE" >> "$LOGFILE"
	sleep "$INTERVAL"
done
