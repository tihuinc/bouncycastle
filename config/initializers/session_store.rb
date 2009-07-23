# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_bouncycastle_session',
  :secret      => '0541495ae7315ed4a6a9552a2eed87701828df2ff9a991abe8e068addef6311d6fef62f5366e52ae18da7eee9af9c7faf77f29b2f45f1a0e68593a0902278580'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
