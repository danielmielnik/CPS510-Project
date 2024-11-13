#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12c/client64/lib
sqlplus64 "dmielnik/11128927@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle12c.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl12c)))" <<EOF

DROP VIEW poorly_rated_suspended_seller;
DROP VIEW product_order_totals;
DROP VIEW location_shipped_totals;
DROP VIEW next_prod_delivery;
DROP VIEW needs_restocking;
DROP VIEW highest_spenders;

exit;
EOF
