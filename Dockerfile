ARG FILE_NAME=myFile

FROM icr.io/obs/codeengine/kaniko/busybox-test AS builder
ARG FILE_NAME

RUN echo $FILE_NAME && touch /$FILE_NAME.txt && stat /$FILE_NAME.txt;

FROM icr.io/obs/codeengine/kaniko/busybox-test 
ARG FILE_NAME

RUN echo $FILE_NAME && touch /$FILE_NAME.txt && stat /$FILE_NAME.txt;
COPY --from=builder /$FILE_NAME.txt /
