#!/usr/bin/env ruby


$:.unshift(File.dirname(File.dirname(__FILE__)))
require 'bcrypt'
require 'models/user'


password = ARGV.first
(puts 'Submit a password, please'; exit) if password.nil?

adapter = DataMapper.repository(:default).adapter
sql = 'INSERT INTO users (name, email, password_digest) VALUES (?, ?, ?)'
adapter.execute(sql, 'mssola', 'mikisabate@gmail.com',
                BCrypt::Password.create(password))
