#!/usr/bin/env ruby

require_relative 'github'

def main
  puts 'ÖYAK Çok Kullanıcılı Çeviri Yönetim Sistemi'
  MyGithub.login
end
