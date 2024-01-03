FROM golang:latest AS BUILDER

WORKDIR /app

COPY . .

RUN go build ./fullcycle.go

# define imagem base 
FROM scratch

# # define endereço do app
WORKDIR /app

# # move o binário do app fullcycle
COPY --from=builder /app/fullcycle .

# # executa:
ENTRYPOINT [ "./fullcycle" ]
