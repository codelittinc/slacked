require 'slack-notifier'
require 'dotenv'
Dotenv.load

mydir = File.expand_path(File.dirname(__FILE__))

Dir[mydir + '/slacked/*.rb'].each {|file| require file }
