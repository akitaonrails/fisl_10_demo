# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_teste_session',
  :secret      => '4bf5f2282b9a27af51b2175bd8acd579d84c0c651db53aeb945c187b7762eebca3d16cf6f96355beb3a088edec1876fe1a383409e2c232d8d6d97c871eb984a7'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
