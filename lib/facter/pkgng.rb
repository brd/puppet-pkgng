
Facter.add("pkgng_supported") do
  confine :kernel => "FreeBSD"

  setcode do
    kernel = Facter.value('kernelversion')
    if kernel.to_i >= 9
      "true"
    end
  end

end

Facter.add("pkgng_enabled") do
  confine :kernel => "FreeBSD"

  setcode do
    if %x{/usr/bin/make /usr/share/mk/bsd.port.mk -V WITH_PKGNG} =~ /(yes|true)/i
      "true"
    end
  end

end
