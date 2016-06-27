FROM alpine
RUN apk --no-cache --update add curl
COPY /src/main /main
EXPOSE 3000
CMD [ "/main" ]
