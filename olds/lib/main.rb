#!/usr/bin/env ruby

require_relative 'github'
require_relative 'markdown'

def main
  puts 'ÖYAK Çok Kullanıcılı Çeviri Yönetim Sistemi'
  MyGithub.login
end
