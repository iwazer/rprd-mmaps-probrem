# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'rprd-mmaps-probrem'
  app.archs['iPhoneOS'] = ['armv7','arm64']
  app.archs['iPhoneSimulator'] = ['i386','x86_64']
  app.info_plist['UIMainStoryboardFile'] = 'Storyboard'

  app.frameworks += ['QuartzCore','CoreLocation']
  app.libs << "-lsqlite3"

  app.vendor_project('vendor/MapionMaps.framework', :static, :products => ['MapionMaps'])
end
