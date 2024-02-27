-- Copyright (C) 2020-2022  sirpdboy  <herboy2008@gmail.com> https://github.com/sirpdboy/netspeedtest
local m, s ,o

m = Map("netspeedtest", "<font color='green'>" .. translate("Net Speedtest") .."</font>",translate( "Network speed diagnosis test (including intranet and extranet)<br/>For specific usage, see:") ..translate("<a href=\'https://github.com/sirpdboy/netspeedtest.git' target=\'_blank\'>GitHub @sirpdboy/netspeedtest</a>") )

s = m:section(TypedSection, "homebox", translate('Lan homebox Web'))
s.anonymous = true

o=s:option(Flag,"enabled",translate("Enable"))
o.default=0

o = s:option(DummyValue, '', '')
o.rawhtml = true
o.template ='netspeedtest/homebox'

m.apply_on_parse = true
m.on_after_apply = function(self,map)
  io.popen("/etc/init.d/netspeedtest restart")
  luci.http.redirect(luci.dispatcher.build_url("admin","network","netspeedtest","homebox"))
end
return m
