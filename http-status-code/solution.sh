#!/usr/bin/env bash
HOST=${HOST:-localhost}
PORT=${PORT:-8000}
SERVER="http://$HOST:$PORT"
NEXT=`curl --silent $SERVER | grep "<a" | sed 's/^[^"]*"\(\/[^"]*\)".*/\1/'`
NEXT=`curl --silent -L "$SERVER$NEXT" -b c -c c --max-redirs 100 | grep "<a" | sed 's/^[^"]*"\(\/[^"]*\)".*/\1/'`
rm c
NEXT=`echo -e "GET $NEXT HTTP/1.1\n" | nc $HOST $PORT | grep "<a" | sed 's/^[^"]*"\(\/[^"]*\)".*/\1/'`
NEXT=`echo -e "GET $NEXT HTTP/1.1\n" | nc $HOST $PORT | grep "<a" | sed 's/^[^"]*"\(\/[^"]*\)".*/\1/'`
NEXT=`echo -e "GET $NEXT HTTP/1.1\n" | nc $HOST $PORT | grep "<a" | sed 's/^[^"]*"\(\/[^"]*\)".*/\1/'`
NEXT=`echo -e "GET $NEXT HTTP/1.1\n" | nc $HOST $PORT | grep "<a" | sed 's/^[^"]*"\(\/[^"]*\)".*/\1/'`
echo -e "GET $NEXT HTTP/1.1\n" | nc $HOST $PORT | grep -q fL4G \
 && curl --silent "$SERVER$NEXT" -XfL4G | sed 's/.\[8m //'
