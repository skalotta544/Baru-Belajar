#
#!/bin/bash
#Script senarai akaun pelanggan
#Skalotta | Malaysian Phreaker Copy
#

echo "==============================================="
echo "USERNAME           EXPIRED DATE           "
echo "-----------------------------------------------"
while read expired
do
	Acc="$(echo $expired | cut -d: -f1)"
	Id="$(echo $expired | grep -v nobody | cut -d: -f3)"
	Exp="$(chage -l $Acc | grep "Account expires" | awk -F": " '{print $2}')"
	if [[ $Id -ge 1000 ]]; then
        printf "%-17s %2s\n" "$Acc" "$Exp"
	fi
done < /etc/passwd
Total="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
echo "-----------------------------------------------"
echo "Total Account: $Total user"
echo "==============================================="
echo "Skalotta | Malaysian Phreaker Knowledge | KS"
echo "==============================================="
echo ""
