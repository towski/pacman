# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_pacman_session',
  :secret      => 'bc53f2f6fec550650345914b2f8620de796d68a85bd415eef49e9c63f8cfca0306be8734398f985c942ae62daf26797add8a7d05da515dd2762fd39c17a7442d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
