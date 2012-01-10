#!/usr/bin/env ruby


$:.unshift(File.dirname(File.dirname(__FILE__)))
require 'bcrypt'
require 'securerandom'
require 'models/user'


password = ARGV.first
(puts 'Submit a password, please'; exit) if password.nil?

adapter = DataMapper.repository(:default).adapter
sql = 'INSERT INTO users (name, email, password_hash, auth_token) VALUES (?, ?, ?, ?)'
auth_token = SecureRandom.urlsafe_base64
adapter.execute(sql, 'mssola', 'mikisabate@gmail.com',
                BCrypt::Password.create(password), auth_token)
