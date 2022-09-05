#!/bin/bash

cat > /var/www/html/index.html <<EOF
<html lang="en">
<head>
  <title>Lunch</title>
</head>
<body bgcolor="${COLOR}">
  <h2>${TITLE}</h2>
  <hr/>
  ${BODY}
</body>
</html>
EOF

nginx -g "daemon off;"