FROM golang:1.21 AS builder
WORKDIR /usr/src/app
ADD fullcycle.go /usr/src/app
RUN go build /usr/src/app/fullcycle.go


FROM scratch
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app/fullcycle .
ENTRYPOINT [ "/usr/src/app/fullcycle" ]
