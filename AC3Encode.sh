#!/bin/bash

MOVIE_PATH=${radarr_moviefile_path}
if [ "${radarr_eventtype}" = "Test" ]; then
  MOVIE_PATH="/video/movies/Zombieland Double Tap (2019)/Zombieland Double Tap (2019).mp4"
  echo "Hit Test Mode"
fi

TEMP_FILE="$MOVIE_PATH.ac3.mp4"
ffmpeg -i "${MOVIE_PATH}" -map 0 -vcodec copy -scodec copy -acodec ac3 -b:a 640k "$TEMP_FILE"
mv "$TEMP_FILE" "$MOVIE_PATH"

echo "Converted ${MOVIE_PATH} to AC3"
