Pod::Spec.new do |s|

  s.name = "MDFoundation"
  s.version = "1.0.1"
  s.summary = "Библиотека полезных классов для ios-приложений"
  # s.static_framework = true
  s.platform = :ios, "14.0"

  s.swift_version = '5'

  s.description  = <<-DESC
                  Библиотека для приложений
  DESC

  s.license = { :type => 'Custom', :text => <<-LICENSE
                  Copyright 2020
                  Permission is granted to MD
                  LICENSE
               }

  s.author = { "Andreichev Michael" => "andreichev.m@mail.ru" }
  s.homepage     = "https://github.com/NGdev1/MDFoundation"
  s.source = { :git => "https://github.com/NGdev1/MDFoundation", :tag => "#{s.version}" }

  s.subspec 'Source' do |ss|
    ss.source_files = ["Source/**/*.swift"]
  end

end
