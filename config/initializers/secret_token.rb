# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
# MicroFluidics::Application.config.secret_key_base = ENV['SECRET_TOKEN']
MicroFluidics::Application.config.secret_key_base = 'affd246274613a5d2fccfa8e544c3f97cc8029ae043e06d9aedf320bc915ce5a6cecb67fcf296b11f420257ad0139d28370c5067fc7def8e6ea52a5fec485c2d'
