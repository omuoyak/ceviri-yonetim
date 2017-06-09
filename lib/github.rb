#!/usr/bin/env ruby

require 'octokit'
require 'highline/import'

# GitHub Fast Using Module
module MyGithub
  @client = nil
  class << self
    def login
      if @client.nil?
        puts "1 - Login by Username and Password\n2 - Login by OAUTH\n"
        print 'Enter the number of your choice: '
        case gets.chomp.to_i
        when 1 then login_by_pass
        when 2 then login_by_oauth
        else stderr.puts 'Invalid entry'
        end
      else puts 'Already logged in'
      end
    end

    def get_password(prompt = 'Enter Password(will be hidden)')
      ask(prompt) { |q| q.echo = false }
    end

    def login_by_pass
      usr = ask('Enter GitHub Username')
      pass = get_password
      @client = Octokit::Client.new(login: usr, password: pass)
    end

    def login_by_oauth
      token = ask('Enter 40 char token: (For help: https://help.github.com' \
        '/articles/creating-a-personal-access-token-for-the-command-line/ )')
      @client = Octokit::Client.new(access_token: token)
    end
  end
end
