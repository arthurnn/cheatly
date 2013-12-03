# `sprintf` formatters

 %b    => Binary integer
 %c    => Single character
 %d    => Decimal integer
 %e    => Decimal integer displayed in exponential form (3e+07)
 %E    => Decimal integer displayed in exponential form (3E+07)
 %f    => Floating point number
 %g    => Same as %e if exponent is less than -4, %f otherwise
 %G    => Same as %E if exponent is less than -4, %f otherwise
 %o    => Octal integer
 %s    => String
 %u    => Unsigned decimal integer
 %x    => Hexadecimal integer (2a)
 %X    => Hexadecimal integer uppercase (2A)
 %02d  => 0 padded two digits
 %.02f => round to the hundredths
 %+    => +/- sign

## Width & alignment

 "%10s"  % "hello" => "     hello"
 "%-10s" % "hello" => "hello     "
