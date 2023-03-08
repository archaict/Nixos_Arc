#!/usr/bin/env bash

mosquitto_sub \
    -h au1.cloud.thethings.network \
    -p 1883 \
    -t \# \
    -u solar-panel-server@ttn \
    -P NNSXS.OYFBDPD24SJQPJMCKXRNHLXOPAHF3L6ZAFAHTYI.BBMRSJYZESY2KF6REPCUHNOOHYCADKPWPUKOYSIDHVHGBDQRD24Q
