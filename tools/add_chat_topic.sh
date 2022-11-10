#!/bin/bash

FILENAME="$1"
JSON_DOG="dog.json"
JSON_CAT="cat.json"
JSON_MAMMAL="mammal.json"
JSON_BIRD="bird.json"
JSON_BUG="bug.json"

JQ_COMMAND='map(. | { "id": .id, "type": "MONSTER", "copy-from": .id, "chat_topics": ["%s"]} )'
JQ_COMMAND_DOG=`printf "$JQ_COMMAND" "TALK_DOG"`
JQ_COMMAND_CAT=`printf "$JQ_COMMAND" "TALK_CAT"`
JQ_COMMAND_MAMMAL=`printf "$JQ_COMMAND" "TALK_MAMMAL"`
JQ_COMMAND_BIRD=`printf "$JQ_COMMAND" "TALK_BIRD"`
JQ_COMMAND_BUG=`printf "$JQ_COMMAND" "TALK_BUG"`

cat "./src/$JSON_DOG" | jq "$JQ_COMMAND_DOG" | json_formatter.cgi > "./output/$JSON_DOG"
cat "./src/$JSON_CAT" | jq "$JQ_COMMAND_CAT" | json_formatter.cgi > "./output/$JSON_CAT"
cat "./src/$JSON_MAMMAL" | jq "$JQ_COMMAND_MAMMAL" | json_formatter.cgi > "./output/$JSON_MAMMAL"
cat "./src/$JSON_BIRD" | jq "$JQ_COMMAND_BIRD" | json_formatter.cgi > "./output/$JSON_BIRD"
cat "./src/$JSON_BUG" | jq "$JQ_COMMAND_BUG" | json_formatter.cgi > "./output/$JSON_BUG"
