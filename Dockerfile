LABEL authors="saurabhkaul"
# Use the official Rust image as the build environment
FROM rust:latest AS builder


# Set the working directory inside the container
WORKDIR /usr/src/kaul-value-store

# Copy the Cargo.toml and Cargo.lock files
COPY Cargo.toml Cargo.lock ./

# Pre-build the dependencies (this helps with caching)
RUN cargo fetch
RUN cargo build --release || exit 0

# Copy the source code
COPY . .

# Build the application
RUN cargo build --release

# Use a minimal base image for the final runtime environment
FROM debian:buster-slim

# Set the working directory inside the container
WORKDIR /usr/src/kaul-value-store

# Copy the compiled binary from the build stage
COPY --from=builder /usr/src/kaul-value-store/target/release/kaul-value-store .

# Command to run the application
CMD ["./kaul-value-store"]