#!/bin/sh
####################################################################
#
# Download album artwork
#
####################################################################
error() {
  echo $1
  exit 1
}

cd /tmp
curl -s -L "https://coverartarchive.org/release-group/72d15666-99a7-321e-b1f3-a3f8c09dff9f/front-250.jpg" -o rv.jpg || error "curl error"
curl -s -L "https://coverartarchive.org/release-group/fdd96703-7b21-365e-bdea-38029fbeb84e/front-250.jpg" -o ps.jpg || error "curl error"
curl -s -L "https://coverartarchive.org/release-group/9b1acd78-3d19-37bb-8ca0-5816d44da439/front-250.jpg" -o sd.jpg || error "curl error"
curl -s -L "https://coverartarchive.org/release-group/e2f503d7-5488-3fe1-b3ac-f236d9f1b44c/front-250.jpg" -o am.jpg || error "curl error"

for FILE in rv ps sd am
do
  convert ${FILE}.jpg ${FILE}.png
  cat <<EOF
  (create-image-from-png  "${FILE}" "/tmp/${FILE}.png")
  (define ${FILE} (paint-image "${FILE}"))
EOF

done

exit 0
