FROM alpine
RUN apk --no-cache --update add curl
ADD /src/main /main
EXPOSE 3000
CMD [ "/main" ]