#!/usr/bin/env bash

node lighthouse-cli/test/fixtures/static-server.js &

sleep 0.5s

config="lighthouse-core/config/seo.js"
expectations="lighthouse-cli/test/smokehouse/seo/expectations.js"

yarn smokehouse -- --config-path=$config --expectations-path=$expectations
exit_code=$?

# kill test servers
kill $(jobs -p)

exit "$exit_code"
