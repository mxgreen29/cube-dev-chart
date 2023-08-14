ARG BASE_IMAGE_TAG='v0.33.43'
FROM cubejs/cube:$BASE_IMAGE_TAG
RUN npm install express-prom-bundle --save