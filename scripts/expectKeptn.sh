#!/usr/bin/expect -f
set dtid [lindex $argv 0];
set dtapi [lindex $argv 1];
set dtpaas [lindex $argv 2];
set batip [lindex $argv 3];
set x [lindex $argv 4];

set timeout -1

spawn /home/acllab$x/keptn/scripts/defineCredentials.sh
match_max 100000

expect "Dynatrace Tenant ID (8-digits)"

send -- "$dtid\r"

expect "Dynatrace API Token"

send -- "$dtapi\r"

expect "Dynatrace PaaS Token"

send -- "$dtpaas\r"

expect "GitHub User Name: "

send -- "acllab$x\r"

expect "GitHub Personal Access Token: "

send -- "dynatrace\r"

expect "GitHub User Email: "

send -- "acllab$x@dynatrace.com\r"

expect "GitHub Organization: "

send -- "sockshop$x\r"

expect "Bastion IP: "

send -- "$batip\r"

expect "Is this all correct? (y/n) :"

send -- "y\r"

expect eof