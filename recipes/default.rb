#
# Cookbook Name:: cpufreq
# Recipe:: default
#
# Copyright 2013, Naoya Nakazawa
#
# All rights reserved - Do Not Redistribute
#

template "/etc/default/cpufrequtils" do
  mode 0644
  source "cpufrequtils.erb"
  variables(:params => { :governor => "performance" })
  notifies :run, "execute[exec-cpufrequtils]"
end

execute "exec-cpufrequtils" do
  command "/etc/init.d/cpufrequtils restart"
  action :nothing
end
